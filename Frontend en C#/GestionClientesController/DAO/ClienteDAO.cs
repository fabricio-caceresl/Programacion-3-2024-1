using GestionClientesModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestionClientesController.DAO
{
    public interface ClienteDAO
    {
        int insertar(Cliente cliente);
        BindingList<Cliente> listarTodos();
        BindingList<Cliente> listarPorNombre(String nombre);
    }
}
