<%@ Page Title=""
    Language="C#"
    MasterPageFile="~/Empresa.Master"
    AutoEventWireup="true"
    CodeBehind="GestionarOrdenVenta.aspx.cs"
    Inherits="WebApplication.GestionarOrdenVenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
    <script src="Scripts/Empresa/gestionarOrdenVenta.js"></script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2>Registrar Órden de Venta</h2>
            </div>

            <!-- Campos para mostrar el cliente seleccionado -->
            <div class="card-body">
                <div class="card border">
                    <div class="card-header bg-light">
                        <h5 class="card-title mb-0">Información del Cliente</h5>
                    </div>
                    <div class="card-body">
                        <div class="mb-3 row">
                            <asp:Label ID="lblDniCliente" runat="server" Text="DNI del Cliente:" CssClass="col-sm-3 col-form-label" />
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtDniCliente" runat="server" Enabled="False" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label ID="lblNombreCliente" runat="server" Text="Nombre del Cliente:" CssClass="col-sm-3 col-form-label" />
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtNombreCliente" runat="server" Enabled="False" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Button ID="btnBuscarCliente" runat="server" Text="Buscar Cliente"
                                CssClass="btn btn-primary col-sm-2" OnClick="btnBuscarCliente_Click" />
                        </div>
                    </div>
                </div>
                <div class="card border">
                    <div class="card-header bg-light">
                        <h5 class="card-title mb-0">Detalle de la Órden de Venta</h5>
                    </div>
                    <div class="card-body">
                        <div class="mb-3 row">
                            <asp:Label ID="lblIdProducto" runat="server" Text="ID del Producto:" CssClass="col-sm-3 col-form-label" />
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtIdProducto" runat="server" Enabled="False" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label ID="lblNombreProducto" runat="server" Text="Nombre del Producto:" CssClass="col-sm-3 col-form-label" />
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtNombreProducto" runat="server" Enabled="False" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label ID="lblPrecioUnitarioProducto" runat="server" Text="Precio Unitario del Producto:" CssClass="col-sm-3 col-form-label" />
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtPrecioUnitarioProducto" runat="server" Enabled="False" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Button ID="btnBuscarProducto" runat="server" Text="Buscar Producto"
                                CssClass="btn btn-primary col-sm-2" OnClick="btnBuscarProducto_Click"/>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label ID="lblCantidadUnidades" runat="server" Text="Cantidad de Unidades:" CssClass="col-sm-3 col-form-label" />
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtCantidadUnidades" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="col text-end">
                            <asp:LinkButton ID="lbAgregarLOV"
                                runat="server" Text="Agregar Producto"
                                CssClass="btn btn-success"
                                OnClick="lbAgregarLOV_Click" />
                        </div>
                        <%-- GridView para mostrar los productos seleccionados --%>
                        <asp:GridView ID="gvLOV" runat="server"
                            AllowPaging="true" PageSize="5"
                            AutoGenerateColumns="false"
                            CssClass="table table-hover table-responsive table-striped">
                            <Columns>
                                <asp:BoundField HeaderText="Nombre Producto" DataField="NombreProducto" />
                                <asp:BoundField HeaderText="Precio Unitario" DataField="PrecioProducto" />
                                <asp:BoundField HeaderText="Cantidad" DataField="Cantidad" />
                                <asp:BoundField HeaderText="Subtotal" DataField="Subtotal" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server"
                                            Id="lbEliminarLOV"
                                            Text="<i class='fa-solid fa-trash ps-2'></i>"
                                            OnClick="lbEliminarLOV_Click"
                                            CommandArgument='<%# Eval("Id") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <!-- Botones de regresar y guardar -->
            <div class="card-footer clearfix">
                <asp:Button ID="btnRegresar" runat="server" Text="Regresar"
                    CssClass="float-start btn btn-secondary" OnClick="btnRegresar_Click" />
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar"
                    CssClass="float-end btn btn-primary" OnClick="btnGuardar_Click" />
            </div>
        </div>
    </div>

    <%-- ScriptManager para gestionar la actualización de la página --%>
    <asp:ScriptManager runat="server"></asp:ScriptManager>

    <!-- Modal para seleccionar el cliente -->
    <div class="modal" id="form-modal-cliente">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Búsqueda de Cliente</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-content">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="container">
                                <div class="container row">
                                    <div class="container row">
                                        <!-- Listado de Clientes dentro del Modal -->
                                        <div class="row align-items-center">

                                            <div class="col-auto">
                                                <asp:Label CssClass="form-label" runat="server" Text="Ingresar el nombre:"></asp:Label>
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:TextBox CssClass="form-control" ID="txtNombreClienteModal" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-2">
                                                <asp:LinkButton ID="lbBuscarClienteModal" runat="server"
                                                    CssClass="btn btn-info"
                                                    Text="<i class='fa-solid fa-magnifying-glass pe-2'></i> Buscar"
                                                    OnClick="btnBuscarClienteModal_Click" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container row">
                                        <asp:GridView ID="gvClientesModal" runat="server"
                                            AllowPaging="true" PageSize="5"
                                            AutoGenerateColumns="false"
                                            CssClass="table table-hover table-responsive table-striped">
                                            <Columns>
                                                <asp:BoundField HeaderText="ID" DataField="Id" />
                                                <asp:BoundField HeaderText="DNI" DataField="Dni" />
                                                <asp:BoundField HeaderText="Nombre Completo" DataField="NombreCompleto" />
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbSeleccionarClienteModal" runat="server"
                                                            Text="<i class='fa-solid fa-edit ps-2'></i>Seleccionar"
                                                            CommandArgument='<%# Eval("Id") %>'
                                                            OnClick="btnSeleccionarClienteModal_Click" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal para seleccionar el producto -->
    <div class="modal" id="form-modal-producto">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Búsqueda de Producto</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-content">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="container">
                                <div class="container row">
                                    <div class="container row">
                                        <!-- Listado de Clientes dentro del Modal -->
                                        <div class="row align-items-center">

                                            <div class="col-auto">
                                                <asp:Label CssClass="form-label" runat="server" Text="Ingresar el nombre:"></asp:Label>
                                            </div>
                                            <div class="col-sm-3">
                                                <asp:TextBox CssClass="form-control" ID="txtNombreProductoModal" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-2">
                                                <asp:LinkButton ID="lbBuscarProductoModal" runat="server"
                                                    CssClass="btn btn-info"
                                                    Text="<i class='fa-solid fa-magnifying-glass pe-2'></i> Buscar"
                                                    OnClick="lbBuscarProductoModal_Click" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container row">
                                        <asp:GridView ID="gvProductosModal" runat="server"
                                            AllowPaging="true" PageSize="5"
                                            AutoGenerateColumns="false"
                                            CssClass="table table-hover table-responsive table-striped">
                                            <Columns>
                                                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                                                <asp:BoundField HeaderText="Unidad Medida" DataField="UnidadMedida" />
                                                <asp:BoundField HeaderText="Precio Unitario" DataField="Precio" />
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbSeleccionarProductoModal" runat="server"
                                                            Text="<i class='fa-solid fa-edit ps-2'></i>Seleccionar"
                                                            CommandArgument='<%# Eval("Id") %>'
                                                            OnClick="lbSeleccionarProductoModal_Click" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
