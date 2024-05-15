using EmpresaDBManager;
using LogisticaController.Almacen.DAO;
using LogisticaModel;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogisticaController.Almacen.MySQL
{
    public class ProductoMySQL : ProductoDAO
    {
        private MySqlConnection conexion;
        private MySqlCommand comando;
        private MySqlDataReader lector;

        public BindingList<Producto> listarTodos()
        {
            BindingList<Producto> productos = new BindingList<Producto>();

            try
            {
                conexion = DBManager.Instancia.Conexion;
                conexion.Open();

                comando = new MySqlCommand();
                comando.Connection = conexion;

                comando.CommandText = "LISTAR_PRODUCTOS_TODOS";
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    Producto producto = new Producto();

                    if (!lector.IsDBNull(lector.GetOrdinal("ID")))
                        producto.Id = lector.GetInt32("ID");
                    if (!lector.IsDBNull(lector.GetOrdinal("Nombre")))
                        producto.Nombre = lector.GetString("Nombre");
                    if (!lector.IsDBNull(lector.GetOrdinal("Unidad de Medida")))
                        producto.UnidadMedida = lector.GetString("Unidad de Medida");
                    if (!lector.IsDBNull(lector.GetOrdinal("Precio Unitario")))
                        producto.Precio = lector.GetInt32("Precio Unitario");

                    productos.Add(producto);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                try { lector.Close(); }
                catch (Exception ex)
                { throw new Exception(ex.Message); }

                try { conexion.Close(); }
                catch (Exception ex)
                { throw new Exception(ex.Message); }
            }

            return productos;
        }

        public BindingList<Producto> listarPorNombre(string nombre)
        {
            BindingList<Producto> productos = new BindingList<Producto>();

            try
            {
                conexion = DBManager.Instancia.Conexion;
                conexion.Open();

                comando = new MySqlCommand();
                comando.Connection = conexion;

                comando.CommandText = "LISTAR_PRODUCTOS_POR_NOMBRE";
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("_nombre", nombre);

                lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    Producto producto = new Producto();

                    if (!lector.IsDBNull(lector.GetOrdinal("ID")))
                        producto.Id = lector.GetInt32("ID");
                    if (!lector.IsDBNull(lector.GetOrdinal("Nombre")))
                        producto.Nombre = lector.GetString("Nombre");
                    if (!lector.IsDBNull(lector.GetOrdinal("Unidad de Medida")))
                        producto.UnidadMedida = lector.GetString("Unidad de Medida");
                    if (!lector.IsDBNull(lector.GetOrdinal("Precio Unitario")))
                        producto.Precio = lector.GetInt32("Precio Unitario");

                    productos.Add(producto);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                try { lector.Close(); }
                catch (Exception ex)
                { throw new Exception(ex.Message); }

                try { conexion.Close(); }
                catch (Exception ex)
                { throw new Exception(ex.Message); }
            }

            return productos;
        }
    }
}
