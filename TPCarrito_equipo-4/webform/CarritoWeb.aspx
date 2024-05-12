<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="CarritoWeb.aspx.cs" Inherits="webform.CarritoWeb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 class="display-3">Mi carrito</h1>

    <% if (carrito.CantidadProductos == 0)

        { %>
    <h3>No hay productos en el carrito</h3>

    <% }
        else
        { %>

    <asp:GridView ID="dgvCarrito" runat="server" AutoGenerateColumns="false" CssClass="table table-dark table-striped"
        OnSelectedIndexChanged="dgvCarrito_SelectedIndexChanged" DataKeyNames="Id">
        <Columns>
            <asp:BoundField HeaderText="Artículo" DataField="Nombre" />
            <asp:BoundField HeaderText="Cantidad" DataField="Cantidad" />
            <asp:BoundField HeaderText="Precio" DataField="PrecioMoneda" />
            <asp:CommandField HeaderText="Detalle" ShowSelectButton="true" SelectText="Ver" ControlStyle-CssClass="btn btn-outline-info fw-bold" />

            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>

                    <asp:LinkButton ID="lnbSubir" OnClick="lnbSubir_Click" CommandName="Subir" CommandArgument='<%# Eval("Id") %>' 
                        CssClass="btn btn-primary mx-1" runat="server" ToolTip="Agregar">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-file-plus-fill" viewBox="0 0 16 16">
                            <path d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2M8.5 6v1.5H10a.5.5 0 0 1 0 1H8.5V10a.5.5 0 0 1-1 0V8.5H6a.5.5 0 0 1 0-1h1.5V6a.5.5 0 0 1 1 0"/>
                        </svg>
                    </asp:LinkButton>
                    <asp:LinkButton ID="lnbBajar" OnClick="lnbBajar_Click" CommandName="Bajar" CommandArgument='<%# Eval("Id") %>' 
                        CssClass="btn btn-secondary mx-1" runat="server" ToolTip="Quitar">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-file-minus-fill" viewBox="0 0 16 16">
                            <path d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2M6 7.5h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1 0-1"/>
                        </svg>
                    </asp:LinkButton>
                    <asp:LinkButton ID="lnbEliminar" OnClick="lnbEliminar_Click" CommandName="Eliminar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-outline-danger fw-bold mx-1" runat="server">Eliminar</asp:LinkButton>

                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Sub-Total" DataField="SubTotalMoneda" ItemStyle-CssClass="fw-semibold"/>

        </Columns>
    </asp:GridView>
    <div class="row justify-content-end">
        <div class="col-4 border text-center border-3 text-white bg-dark border-dark m-3 rounded-1 fw-semibold align-content-center">
            Total de la compra:
            <asp:Label ID="lblTotal" runat="server"></asp:Label>
        </div>
        <div class="col-1 m-3">
            <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modal" onclick="return false;">Comprar</button>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="modal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabel">En este momento no podemos procesar tu pago</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body">
                        "¿Acaso aquí mi dinero no vale?"
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No acepto</button>
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Acepto</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <% } %>
</asp:Content>
