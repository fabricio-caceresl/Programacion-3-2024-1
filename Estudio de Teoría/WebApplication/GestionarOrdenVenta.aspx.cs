using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class GestionarOrdenVenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscarCliente_Click(object sender, EventArgs e)
        {
            string script = "window.onload = function () { showModalForm() };";
            ClientScript.RegisterStartupScript(GetType(), "", script, true);
        }
    }
}