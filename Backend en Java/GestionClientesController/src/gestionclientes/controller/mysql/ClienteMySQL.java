package gestionclientes.controller.mysql;

import empresa.config.DBManager;
import gestionclientes.controller.dao.ClienteDAO;
import gestionclientes.model.Categoria;
import gestionclientes.model.Cliente;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ClienteMySQL implements ClienteDAO {
private Connection connection;
    private CallableStatement statement;
    private ResultSet resultSet;
    
    @Override
    public int insertar(Cliente cliente) {
        int resultado = 0;
        
        try {
            connection = DBManager.getInstance().getConnection();
            
            statement = connection.prepareCall("{CALL INSERTAR_CLIENTE" +
                                               "(?,?,?,?,?,?,?,?)}");
            
            statement.registerOutParameter("_id", java.sql.Types.INTEGER);
            
            statement.setString("_dni", cliente.getDni());
            statement.setString("_nombre", cliente.getNombre());
            statement.setString("_apellidoPaterno",
                                cliente.getApellidoPaterno());
            statement.setString("_genero",
                                String.valueOf(cliente.getGenero()));
            statement.setDate("_fechaNacimiento",
                              new java.sql.Date(cliente.
                                      getFechaNacimiento().getTime()));
            statement.setDouble("_lineaCredito", cliente.getLineaCredito());
            statement.setString("_categoria",
                                cliente.getCategoria().toString());

            statement.executeUpdate();
            
            cliente.setId(statement.getInt("_id"));
            resultado = cliente.getId();
            
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
    public ArrayList<Cliente> listarTodos() {
        ArrayList<Cliente> clientes = new ArrayList<>();
        
        try {
            connection = DBManager.getInstance().getConnection();
            
            statement = connection.prepareCall(
                    "{CALL LISTAR_CLIENTES_TODOS()}");
            
            resultSet = statement.executeQuery();
            
            while(resultSet.next()){
                Cliente cliente = new Cliente();
                
                cliente.setId(resultSet.getInt("ID"));
                cliente.setDni(resultSet.getString("DNI"));
                cliente.setNombre(resultSet.getString("Nombre"));
                cliente.setApellidoPaterno(
                        resultSet.getString("Apellido Paterno"));
                cliente.setGenero(resultSet.getString("Género").charAt(0));
                cliente.setFechaNacimiento(
                        resultSet.getDate("Fecha de Nacimiento"));
                cliente.setLineaCredito(
                        resultSet.getDouble("Línea de Crédito"));
                cliente.setCategoria(Categoria.valueOf(
                        resultSet.getString("Categoría")));
                
                clientes.add(cliente);
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
        return clientes;
    }

    @Override
    public ArrayList<Cliente> listarPorNombre(String nombre) {
        ArrayList<Cliente> clientes = new ArrayList<>();
        
        try {
            connection = DBManager.getInstance().getConnection();
            
            statement = connection.prepareCall(
                    "{CALL LISTAR_CLIENTES_POR_NOMBRE()}");
            
            resultSet = statement.executeQuery();
            
            while(resultSet.next()){
                Cliente cliente = new Cliente();
                
                cliente.setId(resultSet.getInt("ID"));
                cliente.setDni(resultSet.getString("DNI"));
                cliente.setNombre(resultSet.getString("Nombre"));
                cliente.setApellidoPaterno(
                        resultSet.getString("Apellido Paterno"));
                cliente.setGenero(resultSet.getString("Género").charAt(0));
                cliente.setFechaNacimiento(
                        resultSet.getDate("Fecha de Nacimiento"));
                cliente.setLineaCredito(
                        resultSet.getDouble("Línea de Crédito"));
                cliente.setCategoria(Categoria.valueOf(
                        resultSet.getString("Categoría")));
                
                clientes.add(cliente);
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
        return clientes;
    }

}
