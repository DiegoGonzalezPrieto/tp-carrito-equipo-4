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
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticulosNegocio articulos = new ArticulosNegocio();
            ListaArticulos = articulos.listar();
            int idArticulo;

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int.TryParse(Request.QueryString["id"], out idArticulo);
                    datosArticulo = ListaArticulos.Find(a => a.Id == idArticulo);
                }

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
                    urls.Add("https://media.istockphoto.com/vectors/default-image-icon-vector-missing-picture-page-for-website-design-or-vector-id1357365823?k=20&m=1357365823&s=612x612&w=0&h=ZH0MQpeUoSHM3G2AWzc8KkGYRg4uP_kuu0Za8GFxdFc=");
                }

                return urls;
            }

    }


}
