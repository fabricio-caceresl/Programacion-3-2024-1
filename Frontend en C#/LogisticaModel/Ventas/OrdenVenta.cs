using GestionClientesModel;
using RecursosHumanosModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogisticaModel.Ventas
{
    public class OrdenVenta
    {
        private int id;
        private BindingList<LineaOrdenVenta> lineasOrdenVenta;
        private Cliente cliente;
        private Empleado empleado;
        private double total;
        private DateTime fechaHora;
        private bool activo;

        public int Id { get => id; set => id = value; }
        public Cliente Cliente { get => cliente; set => cliente = value; }
        public Empleado Empleado { get => empleado; set => empleado = value; }
        public double Total { get => total; set => total = value; }
        public DateTime FechaHora { get => fechaHora; set => fechaHora = value; }
        public bool Activo { get => activo; set => activo = value; }
        public BindingList<LineaOrdenVenta> LineasOrdenVenta { get => lineasOrdenVenta; set => lineasOrdenVenta = value; }
    }
}
