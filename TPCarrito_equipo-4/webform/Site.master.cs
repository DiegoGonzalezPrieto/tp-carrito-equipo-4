using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;

namespace webform
{
    public partial class Site : System.Web.UI.MasterPage
    {
        public Carrito Carrito { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["carrito"] == null)
                {
                    Carrito carrito = new Carrito();
                    Session.Add("carrito", carrito);
                }
            }
            Carrito = (Carrito)Session["carrito"];

            // cambiar negrita navbar
            string url = Request.Url.LocalPath.ToLower();

            if (url.Contains("default.aspx"))
            {
                lblInicio.Attributes["class"] = "nav-link active";

            }
            else if (url.Contains("verdetalle.aspx"))
            {
                lblDetalle.Attributes["class"] = "nav-link active";

            }
            else if (url.Contains("carritoweb.aspx"))
            {
                lblCarrito.Attributes["class"] = "nav-link active";
            }
        }
    }
}