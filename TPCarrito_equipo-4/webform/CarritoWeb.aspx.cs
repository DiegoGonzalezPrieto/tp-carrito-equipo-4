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
            if (!IsPostBack)
            {
                if (Session["carrito"] == null)
                {
                    // Datos de simulación
                    carrito = new Carrito();
                    ArticulosNegocio articulosNegocio = new ArticulosNegocio();

                    List<Articulo> articulos = articulosNegocio.listar();
                    carrito.agregarItem(articulos[0]);
                    carrito.agregarItem(articulos[1]);
                    carrito.agregarItem(articulos[1]);
                    carrito.agregarItem(articulos[1]);
                    carrito.agregarItem(articulos[2]);

                    Session.Add("carrito", carrito);
                }


            }
            carrito = (Carrito)Session["carrito"];
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
            Response.Redirect("VerDetalle.aspx?id=" + id.ToString());
        }

        protected void lnbBajar_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            int id = int.Parse(lb.CommandArgument);
            carrito.quitarItem(id);
            dgvCarrito.DataBind();
            lblTotal.Text = carrito.ImporteTotalMoneda;

        }

        protected void lnbSubir_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            int id = int.Parse(lb.CommandArgument);
            carrito.aumentarItemExistente(id);
            dgvCarrito.DataBind();
            lblTotal.Text = carrito.ImporteTotalMoneda;
        }

        protected void lnbEliminar_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            int id = int.Parse(lb.CommandArgument);
            carrito.eliminarItem(id);
            dgvCarrito.DataBind();
            lblTotal.Text = carrito.ImporteTotalMoneda;
        }
    }
}