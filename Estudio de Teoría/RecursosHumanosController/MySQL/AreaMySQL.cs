using EmpresaDBManager;
using MySql.Data.MySqlClient;
using RecursosHumanosController.DAO;
using RecursosHumanosModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecursosHumanosController.MySQL
{
    public class AreaMySQL : AreaDAO
    {
        private MySqlConnection conexion;
        private MySqlCommand comando;
        private MySqlDataReader lector;

        public int insertarArea(Area area)
        {
            int resultado = 0;

            try
            {
                conexion = DBManager.Instancia.Connection;
                conexion.Open();

                comando = new MySqlCommand();
                comando.Connection = conexion;

                comando.CommandText = "INSERTAR_AREA";
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                comando.Parameters.Add("_id", MySqlDbType.Int32).Direction =
                                       System.Data.ParameterDirection.Output;

                comando.Parameters.AddWithValue("_nombre", area.Nombre);
                comando.Parameters.AddWithValue("_descripcion", area.Descripcion);

                comando.ExecuteNonQuery();
                area.Id = Int32.Parse(comando.Parameters["_id"].Value.ToString());
                resultado = area.Id;
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

        public int modificarArea(Area area)
        {
            int resultado = 0;

            try
            {
                conexion = DBManager.Instancia.Connection;
                conexion.Open();

                comando = new MySqlCommand();
                comando.Connection = conexion;

                comando.CommandText = "MODIFICAR_AREA";
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("_id", area.Id);
                comando.Parameters.AddWithValue("_nombre", area.Nombre);
                comando.Parameters.AddWithValue("_descripcion", area.Descripcion);

                resultado = comando.ExecuteNonQuery();
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

        public int eliminarArea(int idArea)
        {
            int resultado = 0;

            try
            {
                conexion = DBManager.Instancia.Connection;
                conexion.Open();

                comando = new MySqlCommand();
                comando.Connection = conexion;

                comando.CommandText = "ELIMINAR_AREA";
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("_id", idArea);

                resultado = comando.ExecuteNonQuery();
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

        public BindingList<Area> listarTodas()
        {
            BindingList<Area> areas = new BindingList<Area>();

            try
            {
                conexion = DBManager.Instancia.Connection;
                conexion.Open();

                comando = new MySqlCommand();
                comando.Connection = conexion;

                comando.CommandText = "LISTAR_AREAS_TODAS";
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    Area area = new Area();

                    if (!lector.IsDBNull(lector.GetOrdinal("ID")))
                        area.Id = lector.GetInt32("ID");
                    if (!lector.IsDBNull(lector.GetOrdinal("Nombre")))
                        area.Nombre = lector.GetString("Nombre");
                    if (!lector.IsDBNull(lector.GetOrdinal("Descripción")))
                        area.Descripcion = lector.GetString("Descripción");

                    areas.Add(area);
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

            return areas;
        }
    }
}
