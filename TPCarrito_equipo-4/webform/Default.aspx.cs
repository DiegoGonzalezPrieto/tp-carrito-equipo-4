﻿using System;
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

        public List<string> NombresMarcas { get; set; }
        public List<List<Articulo>> ArticulosPorMarcas { get; set; }

        private List<Articulo> ListarArticulos;


        protected void Page_Load(object sender, EventArgs e)
        {
            ArticulosNegocio articulo = new ArticulosNegocio();

            ListarArticulos = articulo.listar();
            Session.Add("listaArticulos", articulo.listar());
          
            if (!IsPostBack)
            {
                CargarArticulosPorCategoria();
                repCategorias.DataSource = NombresCategorias;
                repCategorias.DataBind();


                CargarArticulosPorMarcas();
                repMarcas.DataSource = NombresMarcas;
                repMarcas.DataBind();

                repRepetidor1.DataSource = ListarArticulos;
                repRepetidor1.DataBind();
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

        private void CargarArticulosPorMarcas()
        {
            ArticulosNegocio articulosNegocio = new ArticulosNegocio();
            List<Articulo> listaArticulos = articulosNegocio.listar();

            NombresMarcas = new List<string>();
            ArticulosPorMarcas = new List<List<Articulo>>();

            foreach (var articulo in listaArticulos)
            {
                string marca = articulo.Marca.Nombre;
                if (!NombresMarcas.Contains(marca))
                {
                    NombresMarcas.Add(marca);
                    ArticulosPorMarcas.Add(new List<Articulo>());
                }
                int indice = NombresMarcas.IndexOf(marca);
                ArticulosPorMarcas[indice].Add(articulo);

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

        protected void btnVerDetalle_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.CommandArgument;
            Response.Redirect("VerDetalle.aspx?id=" + id);
        }
    }
}