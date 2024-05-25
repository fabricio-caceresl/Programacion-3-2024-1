package recursoshumanos.controller.mysql;

import empresa.config.DBManager;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import recursoshumanos.controller.dao.EmpleadoDAO;
import recursoshumanos.model.Empleado;

public class EmpleadoMySQL implements EmpleadoDAO {
    private Connection connection;
    private CallableStatement statement;
    private ResultSet resultSet;
    
    @Override
    public int insertar(Empleado empleado) {
        int resultado = 0;
        
        try {
            connection = DBManager.getInstance().getConnection();
            
            statement = connection.prepareCall("{CALL INSERTAR_EMPLEADO" +
                                               "(?,?,?,?,?,?,?,?,?)}");
            
            statement.registerOutParameter("_id", java.sql.Types.INTEGER);
            
            statement.setString("_dni", empleado.getDni());
            statement.setString("_nombre", empleado.getNombre());
            statement.setString("_apellidoPaterno",
                                empleado.getApellidoPaterno());
            statement.setString("_genero",
                                String.valueOf(empleado.getGenero()));
            statement.setDate("_fechaNacimiento",
                              new java.sql.Date(empleado.
                                      getFechaNacimiento().getTime()));
            statement.setInt("_fidArea", empleado.getArea().getId());
            statement.setString("_cargo", empleado.getCargo());
            statement.setDouble("_sueldo", empleado.getSueldo());

            statement.executeUpdate();
            
            empleado.setId(statement.getInt("_id"));
            resultado = empleado.getId();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try{ connection.close(); }
            catch(Exception ex)
            { System.out.println(ex.getMessage()); }
        }
        
        return resultado;
    }

}
