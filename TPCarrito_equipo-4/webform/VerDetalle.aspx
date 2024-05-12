<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="VerDetalle.aspx.cs" Inherits="webform.VerDetalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
        .carousel-control-prev-icon, .carousel-control-next-icon {
            filter: invert(1);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main id="VerDetalle">

            <% if (datosArticulo == null)

        { %>
    <h3>Seleccione un articulo</h3>

    <% }
        else
        { %>
               <div class="container my-4 text-center">
    <p class="fs-1 fw-bold"><%= datosArticulo.Nombre %></p>
</div>

<div class="container my-4">
    <div class="row">
        <div class="col-md-6">
            <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <asp:Repeater ID="repRepetidor1" runat="server">
                        <ItemTemplate>
                            <div class='<%# Container.ItemIndex == 0 ? "carousel-item active" : "carousel-item" %>'>
                                <img class="d-block" src="<%# Container.DataItem %>" alt="Slide <%# Container.ItemIndex + 1 %>" onerror="this.onerror=null; this.src='https://static.vecteezy.com/system/resources/previews/005/720/408/non_2x/crossed-image-icon-picture-not-available-delete-picture-symbol-free-vector.jpg';">
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <div class="col-md-6">
            <div id="cardInfoArticulo" class="card shadow-sm">
                <div class="card-body">
                    <h1>Detalles del artículo:</h1>
                    <dl>
                        <dt>Nombre:</dt>
                        <dd>- <%= datosArticulo.Nombre %></dd>
                        <dt>Precio:</dt>
                        <dd>- <%= datosArticulo.Precio %></dd>
                        <dt>Marca:</dt>
                        <dd>- <%= datosArticulo.Marca %></dd>
                        <dt>Categoría:</dt>
                        <dd>- <%= datosArticulo.Categoria %></dd>
                        <dt>Descripción:</dt>
                        <dd>- <%= datosArticulo.Descripcion %></dd>
                    </dl>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container my-4">
    <div class="row">
        <div class="col">
            <div class="d-grid gap-2"> 
                <asp:Button ID="btnAgregarAlCarrito" CssClass="btn btn-primary fw-bold" runat= "server" OnClick="btnAgregarAlCarrito_Click" Text="Agregar al carrito"/>
            </div>
        </div>
    </div>
</div>

    </main>
    
    <div class="clearfix"></div>
     <% } %>
</asp:Content>

