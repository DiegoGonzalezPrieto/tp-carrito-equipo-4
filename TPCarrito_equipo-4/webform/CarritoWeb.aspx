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
            <asp:CommandField HeaderText="Detalle" ShowSelectButton="true" SelectText="Ver" ControlStyle-CssClass="btn btn-outline-info" />
            <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>

                            <asp:LinkButton ID="lnbSubir" OnClick="lnbSubir_Click" CommandName="Subir" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-outline-primary fw-bold" runat="server">+</asp:LinkButton>
                            <asp:LinkButton ID="lnbBajar" OnClick="lnbBajar_Click" CommandName="Bajar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-outline-secondary fw-bold" runat="server">-</asp:LinkButton>
                            <asp:LinkButton ID="lnbEliminar" OnClick="lnbEliminar_Click" CommandName="Eliminar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-outline-danger fw-bold" runat="server">x</asp:LinkButton>

                        </ItemTemplate>
                    </asp:TemplateField>
        </Columns>
    </asp:GridView>
    Total de la compra: <asp:Label ID="lblTotal" runat="server"></asp:Label>


</asp:Content>
