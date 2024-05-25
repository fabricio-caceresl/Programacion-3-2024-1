package gestionclientes.model;

import java.util.Date;
import recursoshumanos.model.Persona;

public class Cliente extends Persona {
    private double lineaCredito;
    private Categoria categoria;
    
    public Cliente() {}
    
    public Cliente(String dni, String nombre, String apellidoPaterno,
                   char genero, Date fechaNacimiento, double lineaCredito,
                   Categoria categoria) {
        super(dni, nombre, apellidoPaterno, genero, fechaNacimiento);
        this.lineaCredito = lineaCredito;
        this.categoria = categoria;
    }
    
    public double getLineaCredito() {
        return lineaCredito;
    }

    public void setLineaCredito(double lineaCredito) {
        this.lineaCredito = lineaCredito;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }
}
