package empresa.recursoshumanos.services;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.util.ArrayList;
import recursoshumanos.model.Empleado;
import recursoshumanos.controller.dao.EmpleadoDAO;
import recursoshumanos.controller.mysql.EmpleadoMySQL;

@WebService(serviceName="EmpleadoWS")
public class EmpleadoWS {
    
    private EmpleadoDAO empleadoDao;
    
    @WebMethod(operationName="listarTodos")
    public ArrayList<Empleado> listarTodos() {
        ArrayList<Empleado> empleados = null;
        
        try {
            empleadoDao = new EmpleadoMySQL();
            empleados = empleadoDao.listarTodos();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return empleados;
    }
    
}