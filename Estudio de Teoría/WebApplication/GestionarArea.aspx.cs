using RecursosHumanosController.DAO;
using RecursosHumanosController.MySQL;
using RecursosHumanosModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class GestionarArea : System.Web.UI.Page
    {
        private AreaDAO areaDao;
        private Area area;
        private Estado estado;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_Init(object sender, EventArgs e)
        {
            areaDao = new AreaMySQL();

            String accion = Request.QueryString["accion"];

            if (accion == "modificar")
            {
                estado = Estado.Modificar;
                area = (Area)Session["area"];
                if (!IsPostBack) cargarDatosAreaExistente();
            }
            else estado = Estado.Nuevo;
        }

        protected void cargarDatosAreaExistente()
        {
            txtId.Text = area.Id.ToString();
            txtNombre.Text = area.Nombre;
            txtDescripcion.Text = area.Descripcion;
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarAreas.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int resultado = 0;
            area = new Area();

            area.Nombre = txtNombre.Text;
            area.Descripcion = txtDescripcion.Text;

            if (estado == Estado.Nuevo) resultado = areaDao.insertarArea(area);
            else
            {
                area.Id = Int32.Parse(txtId.Text);
                resultado = areaDao.modificarArea(area);
            }

            Response.Redirect("ListarAreas.aspx");
        }
    }
}