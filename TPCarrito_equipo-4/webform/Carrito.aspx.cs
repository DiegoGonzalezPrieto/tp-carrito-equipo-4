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
    public partial class Carrito : System.Web.UI.Page
    {
        public ModeloCarrito carrito { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            // todo: chequear post-back
            carrito = new ModeloCarrito();
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