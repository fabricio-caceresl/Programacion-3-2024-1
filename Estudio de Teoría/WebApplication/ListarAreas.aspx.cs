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
    public partial class ListarAreas : System.Web.UI.Page
    {
        private AreaDAO areaDao;
        private BindingList<Area> areas;

        protected void Page_Load(object sender, EventArgs e)
        {
            areaDao = new AreaMySQL();
            areas = areaDao.listarTodas();
            if (areas.Count != 0)
            {
                gvAreas.DataSource = areas;
                gvAreas.DataBind();
            }
            else lblSinAreasRegistradas.Text = "No hay áreas registradas.";
        }

        protected void lbRegistrarArea_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionarArea.aspx");
        }

        protected void lbModificarArea_Click(object sender, EventArgs e)
        {
            int id = Int32.Parse(((LinkButton)sender).CommandArgument);
            Area area = areas.SingleOrDefault(x => x.Id == id);
            Session["area"] = area;
            Response.Redirect("GestionarArea.aspx?accion=modificar");
        }

        protected void lbEliminarArea_Click(object sender, EventArgs e)
        {
            int idArea = Int32.Parse(((LinkButton)sender).CommandArgument);
            areaDao.eliminar(idArea);
            Response.Redirect("ListarAreas.aspx");
        }

        protected void gvAreas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAreas.PageIndex = e.NewPageIndex;
            gvAreas.DataBind();
        }
    }
}