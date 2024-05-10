<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="CarritoWeb.aspx.cs" Inherits="webform.CarritoWeb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h1 class="display-3">Mi carrito</h1>

    <asp:GridView ID="dgvCarrito" runat="server" AutoGenerateColumns="false" CssClass="table table-dark table-striped"
        OnSelectedIndexChanged="dgvCarrito_SelectedIndexChanged" DataKeyNames="Id" >
        <Columns>
            <asp:BoundField HeaderText="Artículo" DataField="Nombre" />
            <asp:BoundField HeaderText="Precio" DataField="Precio" />
            <asp:BoundField HeaderText="Cantidad" DataField="Cantidad" />
            <asp:BoundField HeaderText="Sub-Total" DataField="SubTotalMoneda" />
            <asp:CommandField HeaderText="Detalle" ShowSelectButton="true" SelectText="Ver" ControlStyle-CssClass="btn btn-outline-info"/>
        </Columns>
    </asp:GridView>
    Total de la compra: <asp:Label ID="lblTotal" runat="server"></asp:Label>


</asp:Content>
