using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecursosHumanosModel
{
    public abstract class Persona
    {
        private int id;
        private string dni;
        private string nombre;
        private string apellidoPaterno;
        private char genero;
        private DateTime fechaNacimiento;

        public int Id { get => id; set => id = value; }
        public string Dni { get => dni; set => dni = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string ApellidoPaterno { get => apellidoPaterno; set => apellidoPaterno = value; }
        public char Genero { get => genero; set => genero = value; }
        public DateTime FechaNacimiento { get => fechaNacimiento; set => fechaNacimiento = value; }
        public String NombreCompleto { get => nombre + " " + apellidoPaterno; }
    }
}
