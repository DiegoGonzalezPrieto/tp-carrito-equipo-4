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
            ListarArticulos = articulo.listar();

			if (!IsPostBack)
			{
                repRepetidor1.DataSource = ListarArticulos;
                repRepetidor1.DataBind();
                repRepetidor2.DataSource = ListarArticulos;
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
    }
}