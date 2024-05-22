using RecursosHumanosModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecursosHumanosController.DAO
{
    public interface AreaDAO
    {
        int insertar(Area area);
        int modificar(Area area);
        int eliminar(int idArea);
        BindingList<Area> listarTodas();
    }
}
