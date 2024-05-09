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
    }
}