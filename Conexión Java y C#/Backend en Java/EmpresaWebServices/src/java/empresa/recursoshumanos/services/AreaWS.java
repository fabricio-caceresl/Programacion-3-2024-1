package empresa.recursoshumanos.services;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.util.ArrayList;
import recursoshumanos.controller.dao.AreaDAO;
import recursoshumanos.controller.mysql.AreaMySQL;
import recursoshumanos.model.Area;

@WebService(serviceName="AreaWS")
public class AreaWS {
    
    private AreaDAO areaDao;
    
    @WebMethod(operationName="insertar")
    public int insertar(@WebParam(name = "area") Area area) {
        int resultado = 0;
        
        try {
            areaDao = new AreaMySQL();
            resultado = areaDao.insertar(area);
            area.setId(resultado);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return resultado;
    }
    
    @WebMethod(operationName="modificar")
    public int modificar(@WebParam(name = "area") Area area) {
        int resultado = 0;
        
        try {
            areaDao = new AreaMySQL();
            resultado = areaDao.modificar(area);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return resultado;
    }
    
    @WebMethod(operationName="eliminar")
    public int eliminar(@WebParam(name = "idArea") int idArea) {
        int resultado = 0;
        
        try {
            areaDao = new AreaMySQL();
            resultado = areaDao.eliminar(idArea);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return resultado;
    }
    
    @WebMethod(operationName="listarTodas")
    public ArrayList<Area> listarTodas() {
        ArrayList<Area> areas = null;
        
        try {
            areaDao = new AreaMySQL();
            areas = areaDao.listarTodas();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return areas;
    }
    
}