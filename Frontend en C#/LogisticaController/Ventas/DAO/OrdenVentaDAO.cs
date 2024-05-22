using LogisticaModel.Ventas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogisticaController.Ventas.DAO
{
    public interface OrdenVentaDAO
    {
        int insertar(OrdenVenta ordenVenta);
    }
}
