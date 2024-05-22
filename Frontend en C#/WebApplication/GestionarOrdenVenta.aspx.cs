using GestionClientesController.DAO;
using GestionClientesController.MySQL;
using GestionClientesModel;
using LogisticaController.Almacen.DAO;
using LogisticaController.Almacen.MySQL;
using LogisticaController.Ventas.DAO;
using LogisticaController.Ventas.MySQL;
using LogisticaModel;
using LogisticaModel.Ventas;
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
        private ProductoDAO productoDao;
        private OrdenVentaDAO ordenVentaDao;

        private BindingList<Cliente> clientes;
        private BindingList<Producto> productos;
        private BindingList<LineaOrdenVenta> lineasOrdenVenta;

        protected void Page_Load(object sender, EventArgs e)
        {
            clienteDao = new ClienteMySQL();
            productoDao = new ProductoMySQL();
            ordenVentaDao = new OrdenVentaMySQL();

            clientes = clienteDao.listarPorNombre(txtNombreClienteModal.Text);
            productos = productoDao.listarPorNombre(txtNombreProductoModal.Text);

            lineasOrdenVenta = Session["lineasOrdenVenta"] != null ?
                               (BindingList<LineaOrdenVenta>)Session["lineasOrdenVenta"] :
                               new BindingList<LineaOrdenVenta>();

            gvClientesModal.DataSource = clientes;
            gvProductosModal.DataSource = productos;
            gvLOV.DataSource = lineasOrdenVenta;

            gvClientesModal.DataBind();
            gvProductosModal.DataBind();
            gvLOV.DataBind();
        }

        protected void btnBuscarCliente_Click(object sender, EventArgs e)
        {
            string script = "window.onload = function () { showModalFormCliente() };";
            ClientScript.RegisterStartupScript(GetType(), "", script, true);
        }

        protected void btnBuscarClienteModal_Click(object sender, EventArgs e)
        {
            clientes = clienteDao.listarPorNombre(txtNombreClienteModal.Text);
            gvClientesModal.DataSource = clientes;
            gvClientesModal.DataBind();
        }

        protected void btnSeleccionarClienteModal_Click(object sender, EventArgs e)
        {
            int idPersona = Int32.Parse(((LinkButton)sender).CommandArgument);
            Cliente clienteSeleccionado = clientes.SingleOrDefault(x => x.Id == idPersona);

            txtNombreCliente.Text = clienteSeleccionado.NombreCompleto;
            txtDniCliente.Text = clienteSeleccionado.Dni.ToString();

            Session["clienteSeleccionado"] = clienteSeleccionado;

            ScriptManager.RegisterStartupScript(this, GetType(),
                                                "", "__doPostBack('', '')",
                                                true);
        }

        protected void btnBuscarProducto_Click(object sender, EventArgs e)
        {
            string script = "window.onload = function () { showModalFormProducto() };";
            ClientScript.RegisterStartupScript(GetType(), "", script, true);
        }

        protected void lbBuscarProductoModal_Click(object sender, EventArgs e)
        {
            productos = productoDao.listarPorNombre(txtNombreProductoModal.Text);
            gvProductosModal.DataSource = productos;
            gvProductosModal.DataBind();
        }

        protected void lbSeleccionarProductoModal_Click(object sender, EventArgs e)
        {
            int idProducto = Int32.Parse(((LinkButton)sender).CommandArgument);
            Producto productoSeleccionado = productos.SingleOrDefault(x => x.Id == idProducto);

            txtIdProducto.Text = productoSeleccionado.Id.ToString();
            txtNombreProducto.Text = productoSeleccionado.Nombre;
            txtPrecioUnitarioProducto.Text = productoSeleccionado.Precio.ToString();

            Session["productoSeleccionado"] = productoSeleccionado;

            ScriptManager.RegisterStartupScript(this, GetType(),
                                                "", "__doPostBack('', '')",
                                                true);
        }

        protected void lbAgregarLOV_Click(object sender, EventArgs e)
        {
            if (Session["productoSeleccionado"] == null)
            {
                Response.Write("Debe seleccionar un producto.");
                return;
            }

            if (txtCantidadUnidades.Text.Trim().Equals(""))
            {
                Response.Write("Debe ingresar una cantidad de unidades.");
                return;
            }

            LineaOrdenVenta lineaOrdenVenta = new LineaOrdenVenta();
            lineaOrdenVenta.Producto = (Producto)Session["productoSeleccionado"];
            lineaOrdenVenta.Cantidad = Int32.Parse(txtCantidadUnidades.Text);
            lineaOrdenVenta.Subtotal = lineaOrdenVenta.Producto.Precio * lineaOrdenVenta.Cantidad;

            lineasOrdenVenta.Add(lineaOrdenVenta);
            Session["lineasOrdenVenta"] = lineasOrdenVenta;

            gvLOV.DataSource = lineasOrdenVenta;
            gvLOV.DataBind();

            txtIdProducto.Text = "";
            txtNombreProducto.Text = "";
            txtPrecioUnitarioProducto.Text = "";
            txtCantidadUnidades.Text = "";
        }

        protected void lbEliminarLOV_Click(object sender, EventArgs e)
        {

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Session["clienteSeleccionado"] == null)
            {
                Response.Write("Debe elegir un cliente.");
                return;
            }

            OrdenVenta ordenVenta = new OrdenVenta();
            ordenVenta.LineasOrdenVenta = (BindingList<LineaOrdenVenta>)Session["lineasOrdenVenta"];

            if (ordenVenta.LineasOrdenVenta == null || ordenVenta.LineasOrdenVenta.Count == 0)
            {
                Response.Write("Debe agregar al menos un producto.");
                return;
            }

            ordenVenta.Cliente = (Cliente)Session["clienteSeleccionado"];
            ordenVenta.Total = 0.0;

            foreach (LineaOrdenVenta lineaOrdenVenta in ordenVenta.LineasOrdenVenta)
                ordenVenta.Total += lineaOrdenVenta.Subtotal;

            ordenVentaDao.insertar(ordenVenta);
        }
    }
}