using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;

namespace webform
{
    public partial class VerProductos : System.Web.UI.Page
    { 
    private List<Articulo> ListarArticulos;
    protected void Page_Load(object sender, EventArgs e)
    {

        ArticulosNegocio articulo = new ArticulosNegocio();
        List<Marca> marcas = MarcasNegocio.ListaMarcas();
        List<Categoria> categorias = CategoriasNegocio.ListaCategorias();
        //ListarArticulos = articulo.listarConSP();
        ListarArticulos = articulo.listar();
        Session.Add("listaArticulos", articulo.listar());




        if (!IsPostBack)
        {
            Random random = new Random();
            repRepetidor1.DataSource = ListarArticulos.OrderBy(x => random.Next()).Take(4);
            repRepetidor1.DataBind();
            repRepetidor2.DataSource = Session["listaArticulos"];
            repRepetidor2.DataBind();
        }

        if (!IsPostBack)
        {

            ddlMarca.DataSource = marcas;
            ddlMarca.DataTextField = "Nombre";
            ddlMarca.DataValueField = "Id";
            ddlMarca.DataBind();

            ddlMarca.Items.Insert(0, new ListItem(String.Empty, String.Empty));

            ddlCategoria.DataSource = categorias;
            ddlCategoria.DataTextField = "Nombre";
            ddlCategoria.DataValueField = "Id";
            ddlCategoria.DataBind();

            ddlCategoria.Items.Insert(0, new ListItem(String.Empty, String.Empty));
        }


        btnVolver.Visible = false;
        btnFiltrar.Visible = false;

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

    protected void btnVerDetalle_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string id = btn.CommandArgument;
        Response.Redirect("VerDetalle.aspx?id=" + id);
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        string textoBusqueda = txtBuscar.Text.ToUpper();

        List<Articulo> listaFiltrada = ((List<Articulo>)Session["listaArticulos"]).FindAll
        (x => x.Nombre.ToUpper().Contains(textoBusqueda)
        || x.Descripcion.ToUpper().Contains(textoBusqueda));

        filtrado(listaFiltrada);
        txtAvanzado.Text = textoBusqueda;
        comprobacion();


    }

    protected void btnBuscarAvanzado_Click(object sender, EventArgs e)
    {
        string textoBusqueda = txtAvanzado.Text.ToUpper();
        string marcaSeleccionada = ddlMarca.SelectedValue;
        string categoriaSeleccionada = ddlCategoria.SelectedValue;
        decimal precioMayor = string.IsNullOrEmpty(txtPrecioMayor.Text) ? 0 : decimal.Parse(txtPrecioMayor.Text);
        decimal precioMenor = string.IsNullOrEmpty(txtPrecioMenor.Text) ? decimal.MaxValue : decimal.Parse(txtPrecioMenor.Text);

        List<Articulo> listaArticulos = (List<Articulo>)Session["listaArticulos"];
        List<Articulo> listaFiltrada = listaArticulos.FindAll(x => (string.IsNullOrEmpty(textoBusqueda) || x.Nombre.ToUpper().Contains(textoBusqueda.ToUpper())
        || x.Descripcion.ToUpper().Contains(textoBusqueda.ToUpper())) &&
        (string.IsNullOrEmpty(marcaSeleccionada) || x.Marca.Id.ToString() == marcaSeleccionada) &&
        (string.IsNullOrEmpty(categoriaSeleccionada) || x.Categoria.Id.ToString() == categoriaSeleccionada) &&
        (x.Precio >= precioMayor && x.Precio <= precioMenor)).ToList();

        filtrado(listaFiltrada);

        comprobacion();

    }

    private void filtrado(List<Articulo> listaFiltrada)
    {
        if (listaFiltrada.Count == 0)
        {
            repRepetidor2.DataSource = listaFiltrada;
            repRepetidor2.DataBind();
            lblCabezera.Text = "Resultados encontrados";
            lblMensaje.Text = "No se encontraron resultados.";
            lblMensaje.Attributes.Add("style", "margin: 50px 0px;");
        }
        else
        {
            lblCabezera.Text = "Resultados encontrados";
            repRepetidor2.DataSource = listaFiltrada;
            repRepetidor2.DataBind();
            lblMensaje.Text = "";
            lblMensaje.Attributes.Add("style", "margin: 0px;");
        }

        btnFiltrar.Visible = true;
        btnVolver.Visible = true;
    }

    private void comprobacion()
    {
        if (string.IsNullOrEmpty(txtBuscar.Text))
        {
            lblCabezera.Text = "";
            btnVolver.Visible = false;
            btnFiltrar.Visible = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(),
                "ocultarCarrusel", "document.getElementById('carouselExampleAutoplaying').style.display = 'block';", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(),
                "ocultarCarrusel", "document.getElementById('carouselExampleAutoplaying').style.display = 'none';", true);
        }
    }
    protected void btnVolver_Click(object sender, EventArgs e)
    {
        txtBuscar.Text = "";
        txtAvanzado.Text = "";
        ddlMarca.Text = "";
        ddlCategoria.Text = "";
        txtPrecioMayor.Text = "";
        txtPrecioMenor.Text = "";

        repRepetidor2.DataSource = ((List<Articulo>)Session["listaArticulos"]);
        repRepetidor2.DataBind();

        comprobacion();

        btnVolver.Visible = false;
        btnFiltrar.Visible = false;
    }
}
}