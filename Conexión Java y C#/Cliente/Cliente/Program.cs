using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cliente
{
    internal class Program
    {
        static void Main(string[] args)
        {
            ServicioWS.PrimerWebServiceClient objDao = new ServicioWS.PrimerWebServiceClient();
            int resultado = objDao.sumar(10, 20);
            string cadena = objDao.hello("Fabricio");

            System.Console.WriteLine(resultado);
            System.Console.WriteLine(cadena);

            System.Console.ReadLine();
        }
    }
}
