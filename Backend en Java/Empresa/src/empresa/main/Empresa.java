package empresa.main;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import recursoshumanos.controller.dao.AreaDAO;
import recursoshumanos.controller.mysql.AreaMySQL;
import recursoshumanos.model.Area;
import recursoshumanos.model.Empleado;
import recursoshumanos.controller.dao.EmpleadoDAO;
import recursoshumanos.controller.mysql.EmpleadoMySQL;
import gestionclientes.model.Cliente;
import gestionclientes.controller.dao.ClienteDAO;
import gestionclientes.controller.mysql.ClienteMySQL;
import gestionclientes.model.Categoria;

public class Empresa {

    public static void main(String[] args) throws Exception {
        // Formato para las Fechas
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        
        // Insertar un Área
        AreaDAO areaDao = new AreaMySQL();
        Area nuevaArea = new Area("Seguridad", "Área de Seguridad");
        int resultado = areaDao.insertar(nuevaArea);
        if (resultado != 0) System.out.println("Área registrada.");
        else System.out.println("Error en el registro.");
        
        // Listar las Áreas
        ArrayList<Area> areas = areaDao.listarTodas();
        for(Area area : areas){
            System.out.println(area.getId() + ". " +
                               area.getNombre());
        }
        
        // Insertar un Empleado
        EmpleadoDAO empleadoDao = new EmpleadoMySQL();
        Empleado nuevoEmpleado = new Empleado("71535132", "Fabricio",
                                              "Cáceres", 'M',
                                              sdf.parse("06-12-2003"),
                                              areas.get(0), "Gerente", 5000.00);
        resultado = empleadoDao.insertar(nuevoEmpleado);
        if (resultado != 0) System.out.println("Empleado registrada.");
        else System.out.println("Error en el registro.");
        
        // Insertar un Cliente
        ClienteDAO clienteDao = new ClienteMySQL();
        Cliente nuevoCliente = new Cliente("84758493", "Jorge", "Almendariz",
                                           'M', sdf.parse("12-10-1998"), 30.45,
                                           Categoria.CLASICO);
        resultado = clienteDao.insertar(nuevoCliente);
        if (resultado != 0) System.out.println("Cliente registrada.");
        else System.out.println("Error en el registro.");
        
        // Listar los Clientes
        ArrayList<Cliente> clientes = clienteDao.listarTodos();
        for(Cliente cliente : clientes)
            System.out.println(cliente.getId() + ". " +
                               cliente.getNombre());
    }
    
}
