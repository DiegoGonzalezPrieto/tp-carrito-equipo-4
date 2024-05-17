<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="VerProductos.aspx.cs" Inherits="webform.VerProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main id="homePage">

        <!-- BUSQUEDA -->
        <div class="d-flex p-2" role="search" style="width: 25%; margin-left: auto; margin-right: 0;">
            <asp:TextBox placeholder="Buscar..." type="search" CssClass="form-control me-2" ID="txtBuscar" runat="server" Style="margin-right: 10px;"></asp:TextBox>
            <asp:Button Text="Buscar" type="submit" CssClass="btn btn-outline-success" ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" />
        </div>
        <!-- BOTON FILTRADO -->
        <div class="d-flex" role="search" style="width: 25%; margin-left: auto; margin-right: 10px; justify-content: end">
            <asp:Button Text="Filtrar" ID="btnFiltrar" CssClass="btn btn-secondary" OnClientClick="return false;" runat="server" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample" />
        </div>
        <!-- Modal de lado -->
        <div class="offcanvas offcanvas-end d-flex p-2" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasExampleLabel">Búsqueda avanzada</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div class="d-flex flex-column p-2" role="search" style="width: 100%; margin-left: auto; margin-right: 0;">
                    <asp:TextBox type="search" CssClass="form-control me-2" ID="txtAvanzado" runat="server" Style="margin-bottom: 10px;"></asp:TextBox>
                    <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-control me-2" Style="margin-bottom: 10px;"></asp:DropDownList>
                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-control me-2" Style="margin-bottom: 10px;"></asp:DropDownList>
                    <asp:TextBox placeholder="Precio mayor a" type="number" CssClass="form-control me-2" ID="txtPrecioMayor" runat="server" Style="margin-bottom: 10px;" min="0"></asp:TextBox>
                    <asp:TextBox placeholder="Precio menor a" type="number" CssClass="form-control me-2" ID="txtPrecioMenor" runat="server" Style="margin-bottom: 10px;" min="0"></asp:TextBox>
                    <div style="display: flex; justify-content: center;">
                        <asp:Button Text="Aplicar Filtro" type="submit" CssClass="btn btn-outline-success" ID="btnBuscarAvanzado" runat="server" OnClick="btnBuscarAvanzado_Click" />
                    </div>
                </div>
            </div>
        </div>
        <div style="display: flex; justify-content: center;">
            <asp:Label ID="lblCabezera" runat="server" CssClass="text-secondary-emphasis" Style="font-size: 30px;"></asp:Label>
        </div>

        <!-- CAROUSEL -->
        <div>
            <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <asp:Repeater ID="repRepetidor1" runat="server">
                        <ItemTemplate>
                            <div class='<%# Container.ItemIndex == 0 ? "carousel-item active" : "carousel-item" %>'>
                                <img class="d-block" src="<%# UrlImagen(Eval("Imagenes")) %>" alt="Slide <%# Container.ItemIndex + 1 %>" onerror="this.onerror=null; this.src='https://static.vecteezy.com/system/resources/previews/005/720/408/non_2x/crossed-image-icon-picture-not-available-delete-picture-symbol-free-vector.jpg';">
                                <!-- <div class="carousel-caption d-none d-md-block">
                            <h5><%# Eval("Nombre") %></h5>
                            <p><%# Eval("Descripcion") %></p>
                        </div> -->
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

        <!-- TARJETAS  -->
        <% if (Categoria != null)
            { %>
        <h2 class="m-3"><%: Categoria %></h2>
        <% } %>
        <% if (Marca != null)
            { %>
        <h2 class="m-3"><%: Marca %></h2>
        <% } %>
        <div id="tarjetas" class="row row-cols-1 row-cols-md-4 g-6  p-2">
            <asp:Repeater runat="server" ID="repRepetidor2">
                <ItemTemplate>
                    <div class="col">
                        <div class="card" id="card">
                            <a href="VerDetalle.aspx?id=<%#Eval("Id") %>">
                                <img src='<%# UrlImagen(Eval("Imagenes")) %>' class="card-img-top" alt="..." onerror="this.onerror=null; this.src='https://static.vecteezy.com/system/resources/previews/005/720/408/non_2x/crossed-image-icon-picture-not-available-delete-picture-symbol-free-vector.jpg';">
                            </a>
                            <div class="cardbody">
                                <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                <p class="card-text descripcion"><span class="texto"><%#Eval("Descripcion") %></span><span class="verMas">... <a id="verMas" data-bs-toggle="modal" data-bs-target="#VerMas<%# Container.ItemIndex %>">Ver más</a></span></p>
                                <asp:Button Text="Ver Detalle" CssClass="btn btn-primary" ID="btnVerDetalle" runat="server" OnClick="btnVerDetalle_Click" CommandArgument='<%# Eval("Id") %>' />
                            </div>
                        </div>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="VerMas<%# Container.ItemIndex %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel"><%#Eval("Nombre") %></h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <%#Eval("Descripcion") %>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Aceptar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div style="display: flex; justify-content: center;">
            <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger" Style="font-style: italic"></asp:Label>
        </div>
        <div class="d-flex p-2" style="display: flex; justify-content: center;">
            <asp:Button Text="Volver" type="submit" CssClass="btn btn-secondary" ID="btnVolver" runat="server" OnClick="btnVolver_Click" />
        </div>



    </main>

</asp:Content>
