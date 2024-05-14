using GestionClientesController.DAO;
using GestionClientesController.MySQL;
using GestionClientesModel;
using RecursosHumanosController.DAO;
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
    public partial class GestionarOrdenVenta : System.Web.UI.Page
    {
        private ClienteDAO clienteDao;
        private BindingList<Cliente> clientes;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnBuscarCliente_Click(object sender, EventArgs e)
        {
            string script = "window.onload = function () { showModalForm() };";
            ClientScript.RegisterStartupScript(GetType(), "", script, true);
        }

        protected void btnBuscarClienteModal_Click(object sender, EventArgs e)
        {
            clienteDao = new ClienteMySQL();
            clientes = clienteDao.listarPorNombre(txtNombre.Text);
            gvClientes.DataSource = clientes;
            gvClientes.DataBind();
        }

        protected void btnSeleccionarModal_Click(object sender, EventArgs e)
        {
            clienteDao = new ClienteMySQL();
            clientes = clienteDao.listarPorNombre(txtNombre.Text);
            int idPersona = Int32.Parse(((LinkButton)sender).CommandArgument);
            Cliente cliente = clientes.SingleOrDefault(x => x.Id == idPersona);
            txtNombreCliente.Text = cliente.NombreCompleto;
            ScriptManager.RegisterStartupScript(this, GetType(),
                                                "", "__doPostBack('', '')",
                                                true);
        }
    }
}