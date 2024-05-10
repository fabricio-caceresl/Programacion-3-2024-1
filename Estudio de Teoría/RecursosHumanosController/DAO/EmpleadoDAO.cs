using RecursosHumanosModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecursosHumanosController
{
    public interface EmpleadoDAO
    {
        int insertarEmpleado(Empleado trabajador);
    }
}
