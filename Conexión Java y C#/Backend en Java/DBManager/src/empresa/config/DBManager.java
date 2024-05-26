package empresa.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBManager {
    private static DBManager instance;
    private Connection connection;
    
    private final String url = "jdbc:mysql://" +
                               "base-de-datos-personal.cr94q8u6tnjv." +
                               "us-east-1.rds.amazonaws.com" +
                               ":3306/Programacion_3?useSSL=false";
    private final String user = "admin";
    private final String password = "base-de-datos-personal.,";
    
    private static void createInstance() {
        instance = new DBManager();
    }
    
    public static DBManager getInstance() {
        if (instance == null) createInstance();
        return instance;
    }

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException ex){
            System.out.println(ex.getMessage());
        }
        
        return connection;
    }
}