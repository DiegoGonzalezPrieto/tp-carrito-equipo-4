<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="webform.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main id="homePage">
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
    <div id="tarjetas" class="row row-cols-1 row-cols-md-4 g-6">
        <asp:Repeater runat="server" ID="repRepetidor2">
            <ItemTemplate>
                <div class="col">
                    <div class="card" id="card">
                        <img src='<%# UrlImagen(Eval("Imagenes")) %>' class="card-img-top" alt="..." onerror="this.onerror=null; this.src='https://static.vecteezy.com/system/resources/previews/005/720/408/non_2x/crossed-image-icon-picture-not-available-delete-picture-symbol-free-vector.jpg';">
                        <div class="cardbody">
                            <h5 class="card-title"><%#Eval("Nombre") %></h5>
                            <p class="card-text descripcion"><span class="texto"><%#Eval("Descripcion") %></span><span class="verMas">... <a id="verMas" data-bs-toggle="modal" data-bs-target="#VerMas<%# Container.ItemIndex %>">Ver más</a></span></p>
                            <a href="#" class="btn btn-primary">Ver Detalle</a>
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

    </main>

</asp:Content>
