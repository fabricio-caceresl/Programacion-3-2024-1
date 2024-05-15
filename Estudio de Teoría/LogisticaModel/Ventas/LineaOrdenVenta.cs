using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogisticaModel.Ventas
{
    public class LineaOrdenVenta
    {
        private int id;
        private Producto producto;
        private int cantidad;
        private double subtotal;
        private bool activo;

        public int Id { get => id; set => id = value; }
        public Producto Producto { get => producto; set => producto = value; }
        public int Cantidad { get => cantidad; set => cantidad = value; }
        public double Subtotal { get => subtotal; set => subtotal = value; }
        public bool Activo { get => activo; set => activo = value; }
        public string NombreProducto {  get => Producto.Nombre; }
        public double PrecioProducto {  get => Producto.Precio; }
    }
}
