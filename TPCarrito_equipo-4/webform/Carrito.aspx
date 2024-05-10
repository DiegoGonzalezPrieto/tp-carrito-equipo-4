<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="webform.Carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="display-3">Mi carrito</h1>
    <asp:DataGrid ID="dgdCarrito" runat="server" CssClass="table table-dark table-striped">

    </asp:DataGrid>
</asp:Content>
