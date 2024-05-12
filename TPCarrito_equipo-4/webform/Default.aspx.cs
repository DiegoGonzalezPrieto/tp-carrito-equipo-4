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
                Random random = new Random();
                repRepetidor1.DataSource = ListarArticulos.OrderBy(x => random.Next()).Take(4);
                repRepetidor1.DataBind();
                repRepetidor2.DataSource = Session["listaArticulos"];
                repRepetidor2.DataBind();
            }

            btnVolver.Visible = false;

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

            filtrado(listaFiltrada);

            comprobacion();

        }

        private void filtrado(List<Articulo> listaFiltrada)
        {
            if (listaFiltrada.Count == 0)
            {
                repRepetidor2.DataSource = listaFiltrada;
                repRepetidor2.DataBind();
                lblCabezera.Text = "Resultados encontrados";
                lblMensaje.Text = "No se encontraron resultados.";
                lblMensaje.Attributes.Add("style", "margin: 50px 0px;");
            }
            else
            {
                lblCabezera.Text = "Resultados encontrados";
                repRepetidor2.DataSource = listaFiltrada;
                repRepetidor2.DataBind();
                lblMensaje.Text = "";
                lblMensaje.Attributes.Add("style", "margin: 0px;");
                iniciadorScript();
            }

            btnVolver.Visible = true;
        }

        private void comprobacion()
        {
            if (string.IsNullOrEmpty(txtBuscar.Text))
            {
                lblCabezera.Text = "";
                btnVolver.Visible = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "ocultarCarrusel", "document.getElementById('carouselExampleAutoplaying').style.display = 'block';", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "ocultarCarrusel", "document.getElementById('carouselExampleAutoplaying').style.display = 'none';", true);
            }
        }
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            txtBuscar.Text = "";

            List<Articulo> listaFiltrada = ((List<Articulo>)Session["listaArticulos"]).FindAll
           (x => x.Nombre.ToUpper().Contains(txtBuscar.Text.ToUpper())
           || x.Descripcion.ToUpper().Contains(txtBuscar.Text.ToUpper()));

            filtrado(listaFiltrada);

            comprobacion();

            btnVolver.Visible = false;
        }
    }
}