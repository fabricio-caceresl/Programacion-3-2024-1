using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogisticaModel
{
    public class Producto
    {
        private int id;
        private string nombre;
        private string unidadMedida;
        private double precio;
        private bool activo;

        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string UnidadMedida { get => unidadMedida; set => unidadMedida = value; }
        public double Precio { get => precio; set => precio = value; }
        public bool Activo { get => activo; set => activo = value; }
    }
}
