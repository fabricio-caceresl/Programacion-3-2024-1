using RecursosHumanosModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecursosHumanosController
{
    public interface TrabajadorDAO
    {
        int insertarTrabajador(Trabajador trabajador);
        int modificarTrabajador(Trabajador trabajador);
        int eliminarTrabajador(int idTrabajador);
        BindingList<Trabajador> listarTodos();
    }
}
