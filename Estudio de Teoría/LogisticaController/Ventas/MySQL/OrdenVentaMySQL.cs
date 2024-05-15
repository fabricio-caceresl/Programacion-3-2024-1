using EmpresaDBManager;
using LogisticaController.Ventas.DAO;
using LogisticaModel.Ventas;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogisticaController.Ventas.MySQL
{
    public class OrdenVentaMySQL : OrdenVentaDAO
    {
        private MySqlConnection conexion;
        private MySqlCommand comando;

        public int insertar(OrdenVenta ordenVenta)
        {
            int resultado = 0;

            try
            {
                conexion = DBManager.Instancia.Conexion;
                conexion.Open();

                comando = new MySqlCommand();
                comando.Connection = conexion;

                comando.CommandText = "INSERTAR_ORDEN_VENTA";
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                comando.Parameters.Add("_id", MySqlDbType.Int32).Direction =
                                       System.Data.ParameterDirection.Output;

                comando.Parameters.AddWithValue("_fidCliente", ordenVenta.Cliente.Id);
                // En lugar de '1' debería ir ordenVenta.Empleado.Id. Pero se ha hardcodeado.
                comando.Parameters.AddWithValue("_fidEmpleado", 1);
                comando.Parameters.AddWithValue("_total", ordenVenta.Total);

                comando.ExecuteNonQuery();
                ordenVenta.Id = Int32.Parse(comando.Parameters["_id"].Value.ToString());

                foreach (LineaOrdenVenta lineaOrdenVenta in ordenVenta.LineasOrdenVenta)
                {
                    comando = new MySqlCommand();
                    comando.Connection = conexion;

                    comando.CommandText = "INSERTAR_LINEA_ORDEN_VENTA";
                    comando.CommandType = System.Data.CommandType.StoredProcedure;

                    comando.Parameters.Add("_id", MySqlDbType.Int32).Direction =
                                       System.Data.ParameterDirection.Output;

                    comando.Parameters.AddWithValue("_fidOrdenVenta", ordenVenta.Id);
                    comando.Parameters.AddWithValue("_fidProducto", lineaOrdenVenta.Producto.Id);
                    comando.Parameters.AddWithValue("_cantidad", lineaOrdenVenta.Cantidad);
                    comando.Parameters.AddWithValue("_subtotal", lineaOrdenVenta.Subtotal);

                    comando.ExecuteNonQuery();
                    lineaOrdenVenta.Id = Int32.Parse(comando.Parameters["_id"].Value.ToString());
                }

                resultado = ordenVenta.Id;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                try { conexion.Close(); }
                catch (Exception ex)
                { throw new Exception(ex.Message); }
            }

            return resultado;
        }
    }
}
