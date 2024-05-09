using MySql.Data.MySqlClient;
using RecursosHumanosModel;
using EmpresaDBManager;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySqlX.XDevAPI;

namespace RecursosHumanosController.MySQL
{
    public class TrabajadorMySQL : TrabajadorDAO
    {
        private MySqlConnection conexion;
        private MySqlCommand comando;
        private MySqlDataReader lector;

        public int insertarTrabajador(Trabajador trabajador)
        {
            int resultado = 0;

            try
            {
                conexion = DBManager.Instancia.Connection;
                conexion.Open();
                comando = new MySqlCommand();
                comando.Connection = conexion;
                comando.CommandText = "INSERTAR_TRABAJADOR";
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.Parameters.Add("_id", MySqlDbType.Int32).Direction = System.Data.ParameterDirection.Output;
                comando.Parameters.AddWithValue("_nombre", trabajador.Nombre);
                comando.Parameters.AddWithValue("_edad", trabajador.Edad);
                comando.Parameters.AddWithValue("_area", trabajador.Area);
                comando.ExecuteNonQuery();
                trabajador.Id = Int32.Parse(comando.Parameters["_id"].Value.ToString());
                resultado = trabajador.Id;
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

        public int modificarTrabajador(Trabajador trabajador)
        {
            int resultado = 0;

            try
            {
                conexion = DBManager.Instancia.Connection;
                conexion.Open();

                comando = new MySqlCommand();
                comando.Connection = conexion;
                comando.CommandText = "MODIFICAR_TRABAJADOR";
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("_id", trabajador.Id);
                comando.Parameters.AddWithValue("_nombre", trabajador.Nombre);
                comando.Parameters.AddWithValue("_edad", trabajador.Edad);
                comando.Parameters.AddWithValue("_area", trabajador.Area);

                resultado = comando.ExecuteNonQuery();
            } catch (Exception ex)
            {
                throw new Exception(ex.Message);
            } finally
            {
                try { conexion.Close(); }
                catch (Exception ex)
                { throw new Exception(ex.Message); }
            }

            return resultado;
        }

        public int eliminarTrabajador(int idTrabajador)
        {
            int resultado = 0;

            try
            {
                conexion = DBManager.Instancia.Connection;
                conexion.Open();

                comando = new MySqlCommand();
                comando.Connection = conexion;
                comando.CommandText = "ELIMINAR_TRABAJADOR";
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("_id", idTrabajador);

                resultado = comando.ExecuteNonQuery();
            } catch (Exception ex)
            {
                throw new Exception(ex.Message);
            } finally
            {
                try { conexion.Close(); }
                catch (Exception ex)
                { throw new Exception(ex.Message); }
            }

            return resultado;
        }

        public BindingList<Trabajador> listarTodos()
        {
            BindingList<Trabajador> clientes = new BindingList<Trabajador>();

            try
            {
                conexion = DBManager.Instancia.Connection;
                conexion.Open();

                comando = new MySqlCommand();
                comando.Connection = conexion;
                comando.CommandText = "LISTAR_TRABAJADORES_TODOS";
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    Trabajador trabajador = new Trabajador();

                    if (!lector.IsDBNull(lector.GetOrdinal("ID")))
                        trabajador.Id = lector.GetInt32("ID");
                    if (!lector.IsDBNull(lector.GetOrdinal("Nombre")))
                        trabajador.Nombre = lector.GetString("Nombre");
                    if (!lector.IsDBNull(lector.GetOrdinal("Edad")))
                        trabajador.Edad = lector.GetInt32("Edad");
                    if (!lector.IsDBNull(lector.GetOrdinal("Area")))
                        trabajador.Area = lector.GetString("Area");

                    clientes.Add(trabajador);
                }
            } catch (Exception ex)
            {
                throw new Exception(ex.Message);
            } finally
            {
                try { lector.Close();   } catch (Exception ex) { throw new Exception(ex.Message); }
                try { conexion.Close(); } catch (Exception ex) { throw new Exception(ex.Message); }
            }

            return clientes;
        }
    }
}