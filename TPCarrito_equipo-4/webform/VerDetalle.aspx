<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="VerDetalle.aspx.cs" Inherits="webform.VerDetalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <asp:Repeater ID="repIndicadores" runat="server">
                <ItemTemplate>
                    <button type="button" data-bs-target="#carouselExampleControls" data-bs-slide-to='<%# Container.ItemIndex %>'
                        class='<%# Container.ItemIndex == 0 ? "active" : "" %>' aria-current="true" aria-label="Slide <%# Container.ItemIndex %>"></button>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        
        <div class="carousel-inner">

            <asp:Repeater ID="repRepetidor1" runat="server">
                <ItemTemplate>
                    <div class='<%# Container.ItemIndex == 0 ? "carousel-item active" : "carousel-item" %>'>
                        <div class="card bg-dark text-white">
                            <img src='<%# Container.DataItem %>' class="card-img-top" alt="..."
                                style="max-height: 300px; width: auto;">
                            <a class="carousel-control-prev" href="#carouselExampleControls" role="button"
                                data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleControls" role="button"
                                data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>
</div>


        <div id="tarjetas" class="container my-4 w-50 float-end">

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
    </main>
    <div class="clearfix"></div>
     <% } %>
</asp:Content>
