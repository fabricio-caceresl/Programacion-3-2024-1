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
    public class EmpleadoMySQL : EmpleadoDAO
    {
        private MySqlConnection conexion;
        private MySqlCommand comando;
        private MySqlDataReader lector;

        public int insertarEmpleado(Empleado empleado)
        {
            int resultado = 0;

            try
            {
                conexion = DBManager.Instancia.Connection;
                conexion.Open();

                comando = new MySqlCommand();
                comando.Connection = conexion;

                comando.CommandText = "INSERTAR_EMPLEADO";
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                comando.Parameters.Add("_id", MySqlDbType.Int32).Direction =
                                       System.Data.ParameterDirection.Output;

                comando.Parameters.AddWithValue("_dni", empleado.Dni);
                comando.Parameters.AddWithValue("_nombre", empleado.Nombre);
                comando.Parameters.AddWithValue("_apellidoPaterno", empleado.ApellidoPaterno);
                comando.Parameters.AddWithValue("_genero", empleado.Genero);
                comando.Parameters.AddWithValue("_fechaNacimiento", empleado.FechaNacimiento);
                comando.Parameters.AddWithValue("_fidArea", empleado.Area.Id);
                comando.Parameters.AddWithValue("_cargo", empleado.Cargo);
                comando.Parameters.AddWithValue("_sueldo", empleado.Sueldo);

                comando.ExecuteNonQuery();
                empleado.Id = Int32.Parse(comando.Parameters["_id"].Value.ToString());
                resultado = empleado.Id;
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