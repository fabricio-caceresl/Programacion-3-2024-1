using RecursosHumanosController;
using RecursosHumanosController.DAO;
using RecursosHumanosController.MySQL;
using RecursosHumanosModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class GestionarEmpleado : System.Web.UI.Page
    {
        private AreaDAO areaDao;
        private BindingList<Area> areas;
        private Empleado empleado;
        private EmpleadoDAO empleadoDao;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            areaDao = new AreaMySQL();
            areas = areaDao.listarTodas();
            ddlAreas.DataTextField = "Nombre";
            ddlAreas.DataValueField = "Id";
            ddlAreas.DataSource = areas;
            ddlAreas.DataBind();
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            empleadoDao = new EmpleadoMySQL();

            empleado = new Empleado();
            empleado.Nombre = txtNombre.Text;
            empleado.ApellidoPaterno = txtApellidoPaterno.Text;
            empleado.Genero = rbMasculino.Checked ? 'M' : 'F';
            empleado.FechaNacimiento = DateTime.Parse(dtpFechaNacimiento.Value);
            empleado.Area = new Area();
            empleado.Area.Id = Int32.Parse(ddlAreas.SelectedValue);
            empleado.Cargo = txtCargo.Text;
            empleado.Sueldo = Double.Parse(txtSueldo.Text);

            empleadoDao.insertarEmpleado(empleado);

            Response.Redirect("Home.aspx");
        }
    }
}