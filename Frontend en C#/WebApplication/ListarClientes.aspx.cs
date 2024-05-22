using GestionClientesController.DAO;
using GestionClientesController.MySQL;
using GestionClientesModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class ListarClientes : System.Web.UI.Page
    {
        private ClienteDAO clienteDao;
        private BindingList<Cliente> clientes;

        protected void Page_Load(object sender, EventArgs e)
        {
            clienteDao = new ClienteMySQL();
            clientes = clienteDao.listarTodos();
            gvClientes.DataSource = clientes;
            gvClientes.DataBind();
        }

        protected void gvClientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvClientes.PageIndex = e.NewPageIndex;
            gvClientes.DataBind();
        }

        protected void lbBuscar_Click(object sender, EventArgs e)
        {
            clientes = clienteDao.listarPorNombre(txtNombre.Text);
            gvClientes.DataSource = clientes;
            gvClientes.DataBind();
        }
    }
}