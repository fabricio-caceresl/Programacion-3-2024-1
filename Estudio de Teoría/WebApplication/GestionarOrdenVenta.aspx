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
            <!-- Campos para escribir los datos -->
            <div class="card-body">

                <div class="mb-3 row">
                    <asp:Label ID="lblNombreCliente" runat="server" Text="Nombre del Cliente:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtNombreCliente" runat="server" Enabled="false" CssClass="form-control" />
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

    <div class="modal" id="form-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Búsqueda de Cliente</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>




