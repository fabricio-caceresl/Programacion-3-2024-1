package recursoshumanos.model;

import java.util.Date;

public class Empleado extends Persona {
    private Area area;
    private String cargo;
    private double sueldo;
    private boolean activo;
    
    public Empleado() {}

    public Empleado(String dni, String nombre, String apellidoPaterno,
                    char genero, Date fechaNacimiento, Area area,
                    String cargo, double sueldo) {
        super(dni, nombre, apellidoPaterno, genero, fechaNacimiento);
        this.area = area;
        this.cargo = cargo;
        this.sueldo = sueldo;
    }

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }
}
