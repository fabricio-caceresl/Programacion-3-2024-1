using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecursosHumanosModel
{
    public class Trabajador : Persona
    {
        private string area;

        public Trabajador()
        {
        }

        public Trabajador(string nombre, int edad, string area)
            : base(nombre, edad)
        {
            this.area = area;
        }

        public string Area { get => area; set => area = value; }

        public override string ToString() => Id + ". " + Nombre + " - " +
                                             Edad + " - " + Area;
    }
}
