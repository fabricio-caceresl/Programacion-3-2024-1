using LogisticaModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogisticaController.Almacen.DAO
{
    public interface ProductoDAO
    {
        BindingList<Producto> listarTodos();
        BindingList<Producto> listarPorNombre(string nombre);
    }
}
