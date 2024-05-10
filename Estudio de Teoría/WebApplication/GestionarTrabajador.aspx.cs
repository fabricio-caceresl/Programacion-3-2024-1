using RecursosHumanosController;
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
    public partial class GestionarTrabajador : System.Web.UI.Page
    {
        private TrabajadorDAO trabajadorDao;
        private Trabajador trabajador;
        private Estado estado;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            trabajadorDao = new TrabajadorMySQL();
            trabajador = (Trabajador)Session["trabajador"];
            string accion = Request.QueryString["accion"];

            if (accion == "editar")
            {
                estado = Estado.Editar;
                if (!IsPostBack) cargarDatos();
            }
            else
            {
                estado = Estado.Nuevo;
            }
        }

        public void cargarDatos()
        {
            txtId.Text = trabajador.Id.ToString();
            txtNombre.Text = trabajador.Nombre;
            txtEdad.Text = trabajador.Edad.ToString();
            txtArea.Text = trabajador.Area;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Trabajador trabajador = new Trabajador();
            trabajador.Nombre = txtNombre.Text;
            trabajador.Edad = Int32.Parse(txtEdad.Text);
            trabajador.Area = txtArea.Text;

            int resultado = 0;
            if (estado == Estado.Nuevo)
                resultado = trabajadorDao.insertarTrabajador(trabajador);
            else if (estado == Estado.Editar)
            {
                trabajador.Id = Int32.Parse(txtId.Text);
                resultado = trabajadorDao.modificarTrabajador(trabajador);
            }

            Response.Redirect("ListarTrabajadores.aspx");
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarTrabajadores.aspx");
        }
    }
}