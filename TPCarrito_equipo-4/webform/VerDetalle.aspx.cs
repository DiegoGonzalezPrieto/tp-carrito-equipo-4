﻿using dominio;
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
        public int CantidadEnCarrito { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ArticulosNegocio articulos = new ArticulosNegocio();
            ListaArticulos = articulos.listar();
            int idArticulo;
            CantidadEnCarrito = 0;

            if (Request.QueryString["id"] != null)
            {
                int.TryParse(Request.QueryString["id"], out idArticulo);
                datosArticulo = ListaArticulos.Find(a => a.Id == idArticulo);
            }

            if (Session["carrito"] != null)
            {
                carrito = (Carrito)Session["carrito"];
                CantidadEnCarrito = carrito.ObtenerCantidadEnCarrito(datosArticulo);

            }

            if (!IsPostBack)
            {
                
                if (datosArticulo != null)
                {
                    repRepetidor1.DataSource = UrlImagenes();
                    repRepetidor1.DataBind();
                }

                btnAgregarAlCarrito.Text = $"Agregar al carrito ({CantidadEnCarrito})";
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
           CantidadEnCarrito = carrito.ObtenerCantidadEnCarrito(datosArticulo);
                btnAgregarAlCarrito.Text = $"Agregar al carrito ({CantidadEnCarrito})";
        }

        protected void btnQuitarDelCarrito_Click(object sender, EventArgs e)
        {
            if (carrito.Items.Any(item => item.Id == datosArticulo.Id))
            {
                carrito.quitarItem(datosArticulo);
            CantidadEnCarrito = carrito.ObtenerCantidadEnCarrito(datosArticulo);
                    btnAgregarAlCarrito.Text = $"Agregar al carrito ({CantidadEnCarrito})";

            }
        }
    }

}