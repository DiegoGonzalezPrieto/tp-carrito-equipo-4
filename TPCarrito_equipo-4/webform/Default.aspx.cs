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
        public List<string> NombresCategorias { get; set; }
        public List<List<Articulo>> ArticulosPorCategoria { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarArticulosPorCategoria();
                repCategorias.DataSource = NombresCategorias;
                repCategorias.DataBind();
            }
        }

        private void CargarArticulosPorCategoria()
        {
            ArticulosNegocio articulosNegocio = new ArticulosNegocio();
            List<Articulo> listaArticulos = articulosNegocio.listar();

            NombresCategorias = new List<string>();
            ArticulosPorCategoria = new List<List<Articulo>>();

            foreach (var articulo in listaArticulos)
            {
                string categoria = articulo.Categoria.Nombre;
                if (!NombresCategorias.Contains(categoria))
                {
                    NombresCategorias.Add(categoria);
                    ArticulosPorCategoria.Add(new List<Articulo>());
                }
                int indice = NombresCategorias.IndexOf(categoria);
                ArticulosPorCategoria[indice].Add(articulo);
                
            }
        }
        protected string ObtenerPrimerUrl(Articulo articulo)
        {
            if (articulo.Imagenes != null && articulo.Imagenes.Any())
            {
                return articulo.Imagenes.First().Url;
            }
            else
            {
                return "https://static.vecteezy.com/system/resources/previews/005/720/408/non_2x/crossed-image-icon-picture-not-available-delete-picture-symbol-free-vector.jpg";
            }
        }

    }
}