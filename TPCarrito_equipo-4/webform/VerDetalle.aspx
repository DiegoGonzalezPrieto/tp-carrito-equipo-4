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

<div class="container my-4 w-50 float-start">
<div>
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
</div>


        <div id="cardInfoArticulo" class="container my-4 w-50 float-end">

            <div class="col">
                <div class="card shadow-sm" id="card">
                    <div class="cardbody">
                        <h1>Detalles del articulo:</h1>
                        <dl>
                            <dt>Nombre:</dt>
                            <dd>- <%= datosArticulo.Nombre %></dd>
                            <dt>Precio:</dt>
                            <dd>- <%= datosArticulo.Precio %></dd>
                            <dt>Marca:</dt>
                            <dd>- <%= datosArticulo.Marca %></dd>
                            <dt>Categoria:</dt>
                            <dd>- <%= datosArticulo.Categoria %></dd>
                            <dt>Descripcion:</dt>
                            <dd>- <%= datosArticulo.Descripcion %></dd>
                        </dl>
                    </div>
                </div>
            </div>
            </div>
    </main>
    
    <div class="clearfix"></div>
     <% } %>
</asp:Content>

