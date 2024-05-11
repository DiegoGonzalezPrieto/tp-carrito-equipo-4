using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace webform
{
	public partial class Default : System.Web.UI.Page
	{
		private List<Articulo> ListarArticulos;
        protected void Page_Load(object sender, EventArgs e)
		{

			ArticulosNegocio articulo = new ArticulosNegocio();
            //ListarArticulos = articulo.listarConSP();
            Session.Add("listaArticulos", articulo.listar());
            ListarArticulos = articulo.listar();

            if (!IsPostBack)
            {
                repRepetidor1.DataSource = ListarArticulos.Take(3);
                repRepetidor1.DataBind();
                repRepetidor2.DataSource = Session["listaArticulos"];
                repRepetidor2.DataBind();
            }


        }

        public string UrlImagen(object urlImagen)
        {
            List<Imagen> imagenes = urlImagen as List<Imagen>;

            if (imagenes != null)
            {
                return imagenes[0].Url;
            }
            else
            {
                return "Error de carga.";
            }
        }

        protected void btnVerDetalle_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.CommandArgument;
            Response.Redirect("VerDetalle.aspx?id=" + id);
        }

        private void iniciadorScript()
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "recortarDescripcion", "recortarDescripcion();", true);
            ScriptManager.RegisterStartupScript(this, GetType(), "iniciarCarousel", "iniciarCarousel();", true);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

            List<Articulo> listaFiltrada = ((List<Articulo>)Session["listaArticulos"]).FindAll
                (x => x.Nombre.ToUpper().Contains(txtBuscar.Text.ToUpper()) 
                || x.Descripcion.ToUpper().Contains(txtBuscar.Text.ToUpper()));

            if (listaFiltrada.Count == 0)
            {
                repRepetidor2.DataSource = listaFiltrada;
                repRepetidor2.DataBind();
                lblMensaje.Text = "Resultados no encontrados";
            }
            else
            {      
                repRepetidor2.DataSource = listaFiltrada;
                repRepetidor2.DataBind();
                lblMensaje.Text = "";
                iniciadorScript();
            }
        }
    }
}