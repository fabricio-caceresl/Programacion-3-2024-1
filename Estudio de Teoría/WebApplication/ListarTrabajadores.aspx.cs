using RecursosHumanosController.MySQL;
using RecursosHumanosController;
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
    public partial class ListarTrabajadores : System.Web.UI.Page
    {
        private TrabajadorDAO trabajadorDao;

        protected void Page_Load(object sender, EventArgs e)
        {
            trabajadorDao = new TrabajadorMySQL();
            BindingList<Trabajador> trabajadores = trabajadorDao.listarTodos();
            gvTrabajadores.DataSource = trabajadores;
            gvTrabajadores.DataBind();
        }

        protected void lbRegistrarTrabajador_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionarTrabajador.aspx");
        }

        protected void lbEditarTrabajador_Click(object sender, EventArgs e)
        {
            int id = Int32.Parse(((LinkButton) sender).CommandArgument);
        }

        protected void lbEliminarTrabajador_Click(object sender, EventArgs e)
        {
            int id = Int32.Parse(((LinkButton)sender).CommandArgument);
            trabajadorDao.eliminarTrabajador(id);
            Response.Redirect("ListarTrabajadores.aspx");
        }
    }
}