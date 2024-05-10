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
        int insertarArea(Area area);
        int modificarArea(Area area);
        int eliminarArea(int idArea);
        BindingList<Area> listarTodas();
    }
}
