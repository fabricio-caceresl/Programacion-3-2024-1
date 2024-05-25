package recursoshumanos.controller.dao;

import java.util.ArrayList;
import recursoshumanos.model.Area;

public interface AreaDAO {
    int insertar(Area area);
    int eliminar(int idArea);
    int modificar(Area area);
    ArrayList<Area> listarTodas();
}
