<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="VerDetalle.aspx.cs" Inherits="webform.VerDetalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main id="VerDetalle">


        <div class="container my-4 text-center">
            <p class="fs-1 fw-bold"><%= datosPrimerArticulo.Nombre %></p>
        </div>


        <div class="container my-4 w-50 float-start">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <asp:Repeater ID="repIndicadores" runat="server">
                        <ItemTemplate>
                            <li data-target="#carouselExampleControls" data-slide-to='<%# Container.ItemIndex %>'
                                class='<%# Container.ItemIndex == 0 ? "active" : "" %>'></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ol>

                <div class="carousel-inner">

                    <asp:Repeater ID="repRepetidor1" runat="server">
                        <ItemTemplate>
                            <div class='<%# Container.ItemIndex == 0 ? "carousel-item active" : "carousel-item" %>'>
                                <div class="card bg-dark text-white">
                                    <div class="row justify-content-center align-items-center">
                                        <img src='<%# Container.DataItem %>' class="card-img-top" alt="..."
                                            style="max-height: 300px; width: auto;">
                                        <a class="carousel-control-prev" href="#carouselExampleControls" role="button"
                                            data-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleControls" role="button"
                                            data-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
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
                            <dd>- <%= datosPrimerArticulo.Nombre %></dd>
                            <dt>Precio:</dt>
                            <dd>- <%= datosPrimerArticulo.Precio %></dd>
                            <dt>Marca:</dt>
                            <dd>- <%= datosPrimerArticulo.Marca %></dd>
                            <dt>Categoria:</dt>
                            <dd>- <%= datosPrimerArticulo.Categoria %></dd>
                            <dt>Descripcion:</dt>
                            <dd>- <%= datosPrimerArticulo.Descripcion %></dd>
                        </dl>
                    </div>
                </div>
            </div>
    </main>
    <div class="clearfix"></div>

</asp:Content>
