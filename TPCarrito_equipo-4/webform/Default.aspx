<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="webform.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .carousel-control-prev-icon, .carousel-control-next-icon {
            filter: invert(1);
        }

        .alt-text {
            display: block;
            text-align: center;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main id="Inicio">
        <div class="container my-4">
            <asp:Image ID="imgBannerGrande" runat="server" ImageUrl="https://i.imgur.com/PjG18ZK.png" CssClass="img-fluid" alt="Artículo Imagen" />

            <div class="row">
                <h1 class="display-4 m-2">Categorías</h1>
                <asp:Repeater ID="repCategorias" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="card my-4">
                                <div class="card-body">
                                    <h2 style="text-align: center; font-weight: bold;"><%# ((string)Container.DataItem).ToUpper() %></h2>
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

            <hr />

            <div class="row">
                <h1 class="display-4 m-2">Marcas</h1>
                <asp:Repeater ID="repMarcas" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="card my-4">
                                <div class="card-body">
                                    <h2 style="text-align: center; font-weight: bold;"><%# ((string)Container.DataItem).ToUpper() %></h2>
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
            <asp:Image ID="imgBannerChico" runat="server" ImageUrl="https://i.imgur.com/uIslgtf.png" CssClass="img-fluid" alt="Artículo Imagen" />
        </div>
    </main>
</asp:Content>
