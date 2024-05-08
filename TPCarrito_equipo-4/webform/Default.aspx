<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="webform.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- CAROUSEL --%>
    <div>
        <div class="container my-4 w-80">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <!-- Tarjetas Carousel -->
                <div class="carousel-inner">
                    <asp:Repeater ID="repRepetidor1" runat="server">
                        <ItemTemplate>
                            <div class='<%# Container.ItemIndex == 0 ? "carousel-item active" : "carousel-item" %>'>
                                <div class="card bg-dark text-white m-width-100">
                                    <div class="row g-0">
                                        <div class="col-md-6">
                                            <div class="card-body">
                                                <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                                <p class="card-text"><%#Eval("Descripcion") %></p>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <img src='<%# UrlImagen(Eval("Imagenes")) %>' class="card-img-top" alt="..." onerror="this.onerror=null; this.src='https://media.istockphoto.com/vectors/default-image-icon-vector-missing-picture-page-for-website-design-or-vector-id1357365823?k=20&m=1357365823&s=612x612&w=0&h=ZH0MQpeUoSHM3G2AWzc8KkGYRg4uP_kuu0Za8GFxdFc=';" width="100%">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <!-- Controles -->
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>  
    </div>

    <%-- TARJETAS  --%>
    <div id="tarjetas" class="row row-cols-1 row-cols-md-4 g-6">
        <asp:Repeater runat="server" ID="repRepetidor2">
            <ItemTemplate>
                <div class="col">
                    <div class="card" id="card">
                        <img src='<%# UrlImagen(Eval("Imagenes")) %>' class="card-img-top" alt="..." onerror="this.onerror=null; this.src='https://static.vecteezy.com/system/resources/previews/005/720/408/non_2x/crossed-image-icon-picture-not-available-delete-picture-symbol-free-vector.jpg';">
                        <div class="cardbody">
                            <h5 class="card-title"><%#Eval("Nombre") %></h5>
                            <p class="card-text"><%#Eval("Descripcion") %></p>
                            <a href="#">Ver Detalle</a>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
