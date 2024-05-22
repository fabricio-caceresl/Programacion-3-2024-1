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
        private MySqlConnection conexion;

        private string servidor   = "server=base-de-datos-personal.cr94q8u6tnjv.us-east-1.rds.amazonaws.com;";
        private string usuario    = "user=admin;";
        private string baseDatos  = "database=Programacion_3;";
        private string puerto     = "port=3306;";
        private string contrasena = "password=base-de-datos-personal.,;";

        public MySqlConnection Conexion
        {
            get
            {
                string cadenaConexion = servidor + usuario + baseDatos + puerto + contrasena;
                conexion = new MySqlConnection(cadenaConexion);
                return conexion;
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
