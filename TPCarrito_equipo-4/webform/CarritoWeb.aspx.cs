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

            dgvCarrito.DataSource = carrito.Items;
            dgvCarrito.DataBind();
            lblTotal.Text = carrito.ImporteTotalMoneda;
        }

        protected void dgdCarrito_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dgvCarrito_SelectedIndexChanged(object sender, EventArgs e)
        {
            // fila seleccionada
            int id = (int)dgvCarrito.SelectedDataKey.Value;
            Response.Redirect("Detalle?id=" + id.ToString());
        }


    }
}