﻿<%@ Page Title=""
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
                <div class="mb-3 row">
                    <asp:Label ID="lblNombreCliente" runat="server" Text="Nombre del Cliente:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtNombreCliente" runat="server" Enabled="False" CssClass="form-control" />
                    </div>
                    <asp:Button ID="btnBuscarCliente" runat="server" Text="Buscar Cliente"
                        CssClass="btn btn-primary col-sm-4" OnClick="btnBuscarCliente_Click" />
                </div>
            </div>

            <!-- Botones de regresar y guardar -->
            <div class="card-footer clearfix">
                <asp:Button ID="btnRegresar" runat="server" Text="Regresar"
                    CssClass="float-start btn btn-secondary" />
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar"
                    CssClass="float-end btn btn-primary" />
            </div>
        </div>
    </div>

    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <div class="modal" id="form-modal">
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
                                                <asp:TextBox CssClass="form-control" ID="txtNombre" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-2">
                                                <asp:LinkButton ID="lbBuscar" runat="server"
                                                    CssClass="btn btn-info"
                                                    Text="<i class='fa-solid fa-magnifying-glass pe-2'></i> Buscar"
                                                    OnClick="btnBuscarClienteModal_Click" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container row">
                                        <asp:GridView ID="gvClientes" runat="server"
                                            AllowPaging="true" PageSize="5"
                                            AutoGenerateColumns="false"
                                            CssClass="table table-hover table-responsive table-striped">
                                            <Columns>
                                                <asp:BoundField HeaderText="ID" DataField="Id" />
                                                <asp:BoundField HeaderText="DNI" DataField="Dni" />
                                                <asp:BoundField HeaderText="Nombre Completo" DataField="NombreCompleto" />
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbBuscar" runat="server"
                                                            Text="<i class='fa-solid fa-edit ps-2'></i>Seleccionar"
                                                            CommandArgument='<%# Eval("Id") %>'
                                                            OnClick="btnSeleccionarModal_Click" />
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




