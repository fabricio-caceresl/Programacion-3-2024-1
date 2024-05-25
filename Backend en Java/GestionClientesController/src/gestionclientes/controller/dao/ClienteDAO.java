package gestionclientes.controller.dao;

import gestionclientes.model.Cliente;
import java.util.ArrayList;

public interface ClienteDAO {
    int insertar(Cliente cliente);
    ArrayList<Cliente> listarTodos();
    ArrayList<Cliente> listarPorNombre(String nombre);
}