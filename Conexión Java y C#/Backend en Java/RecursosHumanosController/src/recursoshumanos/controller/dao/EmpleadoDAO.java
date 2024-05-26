package recursoshumanos.controller.dao;

import java.util.ArrayList;
import recursoshumanos.model.Empleado;

public interface EmpleadoDAO {
    int insertar(Empleado empleado);
    ArrayList<Empleado> listarTodos();
}
