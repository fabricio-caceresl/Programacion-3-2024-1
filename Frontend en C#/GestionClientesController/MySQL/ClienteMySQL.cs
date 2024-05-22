using EmpresaDBManager;
using GestionClientesController.DAO;
using GestionClientesModel;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestionClientesController.MySQL
{
    public class ClienteMySQL : ClienteDAO
    {
        private MySqlConnection conexion;
        private MySqlCommand comando;
        private MySqlDataReader lector;

        public int insertar(Cliente cliente)
        {
            int resultado = 0;

            try
            {
                conexion = DBManager.Instancia.Conexion;
                conexion.Open();

                comando = new MySqlCommand();
                comando.Connection = conexion;

                comando.CommandText = "INSERTAR_CLIENTE";
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                comando.Parameters.Add("_id", MySqlDbType.Int32).Direction =
                                       System.Data.ParameterDirection.Output;

                comando.Parameters.AddWithValue("_dni", cliente.Dni);
                comando.Parameters.AddWithValue("_nombre", cliente.Nombre);
                comando.Parameters.AddWithValue("_apellidoPaterno", cliente.ApellidoPaterno);
                comando.Parameters.AddWithValue("_genero", cliente.Genero);
                comando.Parameters.AddWithValue("_fechaNacimiento", cliente.FechaNacimiento);
                comando.Parameters.AddWithValue("_lineaCredito", cliente.LineaCredito);
                comando.Parameters.AddWithValue("_categoria", cliente.Categoria);

                comando.ExecuteNonQuery();
                cliente.Id = Int32.Parse(comando.Parameters["_id"].Value.ToString());
                resultado = cliente.Id;
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

        public BindingList<Cliente> listarTodos()
        {
            BindingList<Cliente> clientes = new BindingList<Cliente>();

            try
            {
                conexion = DBManager.Instancia.Conexion;
                conexion.Open();

                comando = new MySqlCommand();
                comando.Connection = conexion;

                comando.CommandText = "LISTAR_CLIENTES_TODOS";
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    Cliente cliente = new Cliente();

                    if (!lector.IsDBNull(lector.GetOrdinal("ID")))
                        cliente.Id = lector.GetInt32("ID");
                    if (!lector.IsDBNull(lector.GetOrdinal("DNI")))
                        cliente.Dni = lector.GetString("DNI");
                    if (!lector.IsDBNull(lector.GetOrdinal("Nombre")))
                        cliente.Nombre = lector.GetString("Nombre");
                    if (!lector.IsDBNull(lector.GetOrdinal("Apellido Paterno")))
                        cliente.ApellidoPaterno = lector.GetString("Apellido Paterno");
                    if (!lector.IsDBNull(lector.GetOrdinal("Género")))
                        cliente.Genero = lector.GetChar("Género");
                    if (!lector.IsDBNull(lector.GetOrdinal("Fecha de Nacimiento")))
                        cliente.FechaNacimiento = lector.GetDateTime("Fecha de Nacimiento");
                    if (!lector.IsDBNull(lector.GetOrdinal("Línea de Crédito")))
                        cliente.LineaCredito = lector.GetDouble("Línea de Crédito");
                    if (!lector.IsDBNull(lector.GetOrdinal("Categoría")))
                        cliente.Categoria = (Categoria)
                                            Enum.Parse(typeof(Categoria),
                                                       lector.GetString("Categoría"));

                    clientes.Add(cliente);
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

            return clientes;
        }

        public BindingList<Cliente> listarPorNombre(string nombre)
        {
            BindingList<Cliente> clientes = new BindingList<Cliente>();

            try
            {
                conexion = DBManager.Instancia.Conexion;
                conexion.Open();

                comando = new MySqlCommand();
                comando.Connection = conexion;

                comando.CommandText = "LISTAR_CLIENTES_POR_NOMBRE";
                comando.CommandType = System.Data.CommandType.StoredProcedure;

                comando.Parameters.AddWithValue("_nombre", nombre);

                lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    Cliente cliente = new Cliente();

                    if (!lector.IsDBNull(lector.GetOrdinal("ID")))
                        cliente.Id = lector.GetInt32("ID");
                    if (!lector.IsDBNull(lector.GetOrdinal("DNI")))
                        cliente.Dni = lector.GetString("DNI");
                    if (!lector.IsDBNull(lector.GetOrdinal("Nombre")))
                        cliente.Nombre = lector.GetString("Nombre");
                    if (!lector.IsDBNull(lector.GetOrdinal("Apellido Paterno")))
                        cliente.ApellidoPaterno = lector.GetString("Apellido Paterno");
                    if (!lector.IsDBNull(lector.GetOrdinal("Género")))
                        cliente.Genero = lector.GetChar("Género");
                    if (!lector.IsDBNull(lector.GetOrdinal("Fecha de Nacimiento")))
                        cliente.FechaNacimiento = lector.GetDateTime("Fecha de Nacimiento");
                    if (!lector.IsDBNull(lector.GetOrdinal("Línea de Crédito")))
                        cliente.LineaCredito = lector.GetDouble("Línea de Crédito");
                    if (!lector.IsDBNull(lector.GetOrdinal("Categoría")))
                        cliente.Categoria = (Categoria)
                                            Enum.Parse(typeof(Categoria),
                                                       lector.GetString("Categoría"));
                    clientes.Add(cliente);
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

            return clientes;
        }
    }
}