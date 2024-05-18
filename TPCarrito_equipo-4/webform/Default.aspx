<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="webform.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .carousel-control-prev-icon,
        .carousel-control-next-icon {
            filter: invert(1);
        }

        .alt-text {
            display: block;
            text-align: center;
            font-weight: bold;
        }

        #myTab .nav-link.active {
            color: cyan !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main id="Inicio">
        <div class="container my-4">
            <!--- IMG banner grande -->
            <asp:Image ID="imgBannerGrande" runat="server" ImageUrl="https://i.imgur.com/C8mdnQS.png" CssClass="img-fluid" alt="Artículo Imagen" />

            <!--- Collapse ver todos los productos -->

            <p class="my-4 d-grid gap-2">
                <button class="btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" style="font-size: xx-large; text-align: center; font-weight: bold; color: white; background-color: black;">
                    - VER TODOS LOS PRODUCTOS -
                </button>

            </p>
            <div class="collapse" id="collapseExample">
                <div class="card card-body">

                    <!--- Repeater con cards de articulos -->

                    <div id="tarjetas" class="row row-cols-1 row-cols-md-4 g-6">
                        <asp:Repeater runat="server" ID="repRepetidor1">
                            <ItemTemplate>
                                <div class="col">
                                    <div class="card" id="card">
                                        <img src='<%# UrlImagen(Eval("Imagenes")) %>' class="card-img-top" alt="..." onerror="this.onerror=null; this.src='https://static.vecteezy.com/system/resources/previews/005/720/408/non_2x/crossed-image-icon-picture-not-available-delete-picture-symbol-free-vector.jpg';">
                                        <div class="cardbody">
                                            <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                            <p class="card-text descripcion"><span class="texto"><%#Eval("Descripcion") %></span><span class="verMas">... <a id="verMas" data-bs-toggle="modal" data-bs-target="#VerMas<%# Container.ItemIndex %>">Ver más</a></span></p>
                                            <asp:Button Text="Ver Detalle" CssClass="btn btn-primary" ID="btnVerDetalle" runat="server" OnClick="btnVerDetalle_Click" CommandArgument='<%# Eval("Id") %>' />
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                </div>
            </div>

            <!--- Pestanias Categorias/Marcas -->

            <ul class="nav nav-tabs  my-4" id="myTab" role="tablist">
                <li class="nav-item col-md-6" role="presentation">
                    <a class="nav-link active" id="categorias-tab" data-bs-toggle="tab" href="#categorias" role="tab" aria-controls="categorias" aria-selected="true" style="font-size: xx-large; text-align: center; font-weight: bold; color: white; background-color: black">- CATEGORÍAS -</a>
                </li>
                <li class="nav-item col-md-6" role="presentation">
                    <a class="nav-link" id="marcas-tab" data-bs-toggle="tab" href="#marcas" role="tab" aria-controls="marcas" aria-selected="false" style="font-size: xx-large; text-align: center; font-weight: bold; color: white; background-color: black">- MARCAS -</a>
                </li>
            </ul>


            <div class="tab-content" id="myTabContent">

                    <!--- Repeater con cards de Categorias -->

                <div class="tab-pane fade show active" id="categorias" role="tabpanel" aria-labelledby="categorias-tab">
                    <div class="row">
                        <asp:Repeater ID="repCategorias" runat="server">
                            <ItemTemplate>
                                <div class="col-md-4">
                                    <div class="card my-4">
                                        <div class="card-body">
                                            <h2 style="text-align: center; font-weight: bold;"><%# ((string)Container.DataItem) %></h2>
                                            <div id="carousel<%# Container.ItemIndex %>" class="carousel slide" data-bs-ride="carousel">
                                                <a href="VerProductos.aspx?categoria=<%# Container.DataItem %>">
                                                    <div class="carousel-inner">
                                                        <asp:Repeater ID="repArticulos" runat="server" DataSource='<%# ArticulosPorCategoria[NombresCategorias.IndexOf((string)Container.DataItem)] %>'>
                                                            <ItemTemplate>
                                                                <div class='<%# Container.ItemIndex == 0 ? "carousel-item active" : "carousel-item" %>'>
                                                                    <img class="d-block w-100" src='<%# ObtenerPrimerUrl(Container.DataItem as dominio.Articulo) %>' alt='<%# ((dominio.Articulo)Container.DataItem).Nombre %>' onerror="this.onerror=null; this.src='https://static.vecteezy.com/system/resources/previews/005/720/408/non_2x/crossed-image-icon-picture-not-available-delete-picture-symbol-free-vector.jpg';" />
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </div>
                                                </a>

                                                <button class="carousel-control-prev" type="button" data-bs-target="#carousel<%# Container.ItemIndex %>" data-bs-slide="prev">
                                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                    <span class="visually-hidden">Previous</span>
                                                </button>
                                                <button class="carousel-control-next" type="button" data-bs-target="#carousel<%# Container.ItemIndex %>" data-bs-slide="next">
                                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                    <span class="visually-hidden">Next</span>
                                                </button>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                    <!--- Repeater con cards de Marcas -->

                <div class="tab-pane fade" id="marcas" role="tabpanel" aria-labelledby="marcas-tab">
                    <div class="row">
                        <asp:Repeater ID="repMarcas" runat="server">
                            <ItemTemplate>
                                <div class="col-md-4">
                                    <div class="card my-4">
                                        <div class="card-body">
                                            <h2 style="text-align: center; font-weight: bold;"><%# ((string)Container.DataItem)%></h2>
                                            <div id="carousel<%# Container.ItemIndex %>" class="carousel slide" data-bs-ride="carousel">
                                                <a href="VerProductos.aspx?marcas=<%# Container.DataItem %>">
                                                    <div class="carousel-inner">
                                                        <asp:Repeater ID="repArticulos" runat="server" DataSource='<%# ArticulosPorMarcas[NombresMarcas.IndexOf((string)Container.DataItem)] %>'>
                                                            <ItemTemplate>
                                                                <div class='<%# Container.ItemIndex == 0 ? "carousel-item active" : "carousel-item" %>'>
                                                                    <img class="d-block w-100" src='<%# ObtenerPrimerUrl(Container.DataItem as dominio.Articulo) %>' alt='<%# ((dominio.Articulo)Container.DataItem).Nombre %>' onerror="this.onerror=null; this.src='https://static.vecteezy.com/system/resources/previews/005/720/408/non_2x/crossed-image-icon-picture-not-available-delete-picture-symbol-free-vector.jpg';" />
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </div>
                                                </a>

                                                <button class="carousel-control-prev" type="button" data-bs-target="#carousel<%# Container.ItemIndex %>" data-bs-slide="prev">
                                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                    <span class="visually-hidden">Previous</span>
                                                </button>
                                                <button class="carousel-control-next" type="button" data-bs-target="#carousel<%# Container.ItemIndex %>" data-bs-slide="next">
                                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                    <span class="visually-hidden">Next</span>
                                                </button>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>

        <!--- IMG Banner chico -->


        <asp:Image ID="imgBannerChico" runat="server" ImageUrl="https://i.imgur.com/P1LufCk.png" CssClass="img-fluid" alt="Artículo Imagen" />
    </main>
</asp:Content>
