using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webform
{
    public partial class VerDetalle : System.Web.UI.Page
    {

        private List<Articulo> ListaArticulos;
        public Articulo datosArticulo { get; set; }
        public Carrito carrito { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ArticulosNegocio articulos = new ArticulosNegocio();
            ListaArticulos = articulos.listar();
            int idArticulo;

            if (Request.QueryString["id"] != null)
            {
                int.TryParse(Request.QueryString["id"], out idArticulo);
                datosArticulo = ListaArticulos.Find(a => a.Id == idArticulo);
            }

            if (Session["carrito"] != null)
            {
                carrito = (Carrito)Session["carrito"];
            }

            if (!IsPostBack)
            {

                if (datosArticulo != null)
                {
                    repRepetidor1.DataSource = UrlImagenes();
                    repRepetidor1.DataBind();
                }

            }
        }

        public List<string> UrlImagenes()
        {
            List<Imagen> imagenes = datosArticulo.Imagenes;
            List<string> urls = new List<string>();

            if (imagenes != null && imagenes.Count > 0)
            {
                foreach (Imagen imagen in imagenes)
                {
                    urls.Add(imagen.Url);
                }
            }
            else
            {
                urls = null;
            }

            return urls;
        }

        protected void btnAgregarAlCarrito_Click(object sender, EventArgs e)
        {
            carrito.agregarItem(datosArticulo);
        }
    }


}