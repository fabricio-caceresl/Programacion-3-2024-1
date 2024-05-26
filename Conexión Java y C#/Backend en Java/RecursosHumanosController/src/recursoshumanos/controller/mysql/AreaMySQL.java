package recursoshumanos.controller.mysql;

import recursoshumanos.controller.dao.AreaDAO;
import empresa.config.DBManager;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import recursoshumanos.model.Area;

public class AreaMySQL implements AreaDAO {
    private Connection connection;
    private CallableStatement statement;
    private ResultSet resultSet;

    @Override
    public int insertar(Area area) {
        int resultado = 0;
        try {
            DBManager db = DBManager.getInstance();
            connection = db.getConnection();
            
            statement = connection.prepareCall("{CALL INSERTAR_AREA (?,?,?)}");
            
            statement.registerOutParameter("_id", java.sql.Types.INTEGER);

            statement.setString("_nombre", area.getNombre());
            statement.setString("_descripcion", area.getDescripcion());

            statement.executeUpdate();
            
            area.setId(statement.getInt("_id"));
            resultado = area.getId();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try{ connection.close(); }
            catch(Exception ex)
            { System.out.println(ex.getMessage()); }
        }
        
        return resultado;
    }

    @Override
    public int modificar(Area area) {
        int resultado = 0;
        
        try {
            connection = DBManager.getInstance().getConnection();
            
            statement = connection.prepareCall("{CALL MODIFICAR_AREA (?,?,?)}");

            statement.setInt("_id", area.getId());
            statement.setString("_nombre", area.getNombre());
            statement.setString("_descripcion", area.getDescripcion());

            resultado = statement.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try{ connection.close(); }
            catch(Exception ex)
            { System.out.println(ex.getMessage()); }
        }
        
        return resultado;
    }

    @Override
    public int eliminar(int idArea) {
        int resultado = 0;
        
        try {
            connection = DBManager.getInstance().getConnection();
            
            statement = connection.prepareCall("{CALL ELIMINAR_AREA (?)}");

            statement.setInt("_id", idArea);

            resultado = statement.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try{ connection.close(); }
            catch(Exception ex)
            { System.out.println(ex.getMessage()); }
        }
        
        return resultado;
    }

    @Override
    public ArrayList<Area> listarTodas() {
        ArrayList<Area> areas = new ArrayList<>();
        
        try {
            connection = DBManager.getInstance().getConnection();
            
            statement = connection.prepareCall("{CALL LISTAR_AREAS_TODAS()}");
            
            resultSet = statement.executeQuery();
            
            while(resultSet.next()){
                Area area = new Area();
                
                area.setId(resultSet.getInt("ID"));
                area.setNombre(resultSet.getString("Nombre"));
                area.setDescripcion(resultSet.getString("Descripción"));
                
                areas.add(area);
            }
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{ connection.close(); }
            catch(Exception ex)
            { System.out.println(ex.getMessage()); }
            
            try{ resultSet.close(); }
            catch(Exception ex)
            { System.out.println(ex.getMessage()); }
        }
        
        return areas;
    }
}
