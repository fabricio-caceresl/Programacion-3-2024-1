using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace EmpresaDBManager
{
    public class DBManager
    {
        private static DBManager instancia;
        private MySqlConnection conn;

        private string servidor = "server=base-de-datos-personal.cr94q8u6tnjv.us-east-1.rds.amazonaws.com;";
        private string user     = "user=admin;";
        private string database = "database=Programacion_3;";
        private string port     = "port=3306;";
        private string password = "password=base-de-datos-personal.,;";

        public MySqlConnection Connection
        {
            get
            {
                string cadenaConexion = servidor + user + database + port + password;
                conn = new MySqlConnection(cadenaConexion);
                return conn;
            }
        }

        private static void crearInstancia()
        {
            if (instancia == null)
                instancia = new DBManager();
        }

        public static DBManager Instancia
        {
            get
            {
                if (instancia == null)
                    crearInstancia();
                return instancia;
            }
        }
    }
}
