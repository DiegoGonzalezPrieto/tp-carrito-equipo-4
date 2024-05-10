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
    public partial class CarritoWeb : System.Web.UI.Page
    {
        public Carrito carrito { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            // todo: chequear post-back
            carrito = new Carrito();
            ArticulosNegocio articulosNegocio = new ArticulosNegocio();

            List<Articulo> articulos = articulosNegocio.listar();
            carrito.agregarItem(articulos[0]);
            carrito.agregarItem(articulos[1]);
            carrito.agregarItem(articulos[1]);
            carrito.agregarItem(articulos[1]);
            carrito.agregarItem(articulos[2]);

            dgdCarrito.DataSource = carrito.Items;
            dgdCarrito.DataBind();
        }
    }
}