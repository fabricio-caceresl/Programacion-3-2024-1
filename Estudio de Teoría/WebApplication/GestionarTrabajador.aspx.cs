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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            TrabajadorDAO trabajadorDao = new TrabajadorMySQL();

            Trabajador trabajador = new Trabajador();
            trabajador.Nombre = txtNombre.Text;
            trabajador.Edad = Int32.Parse(txtEdad.Text);
            trabajador.Area = txtArea.Text;

            trabajador.Id = trabajadorDao.insertarTrabajador(trabajador);

            txtId.Text = trabajador.Id != 0 ?
                         "Registrado con ID: " + trabajador.Id.ToString() :
                         "Error registrando el trabajador.";
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarTrabajadores.aspx");
        }
    }
}