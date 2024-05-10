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

        private List<Articulo> ListarArticulos;
        public Articulo datosPrimerArticulo { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticulosNegocio articulos = new ArticulosNegocio();
            ListarArticulos = articulos.listar();
            datosPrimerArticulo = ListarArticulos.FirstOrDefault();


            if (!IsPostBack)
            {
                if (datosPrimerArticulo != null)
                {
                    repRepetidor1.DataSource = UrlImagenes(datosPrimerArticulo.Imagenes);
                    repRepetidor1.DataBind();

                }
            }

        }

        public List<string> UrlImagenes(object urlImagen)
        {
            List<Imagen> imagenes = datosPrimerArticulo.Imagenes;
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
