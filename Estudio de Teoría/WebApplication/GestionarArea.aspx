<%@ Page Title=""
    Language="C#"
    MasterPageFile="~/Empresa.Master"
    AutoEventWireup="true"
    CodeBehind="GestionarArea.aspx.cs"
    Inherits="WebApplication.GestionarArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    Gestionar Área
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2>Registrar Area</h2>
            </div>
            <div class="card-body">

                <div class="mb-3 row">
                    <asp:Label ID="lblId" runat="server" Text="ID:" CssClass="col-sm-2 col-form-label"/>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtId" runat="server" Enabled="false" CssClass="form-control"/>
                    </div>
                </div>

                <div class="mb-3 row">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre:" CssClass="col-sm-2 col-form-label"/>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"/>
                    </div>
                </div>

                <div class="mb-3 row">
                    <asp:Label ID="lblDescripcion" runat="server" Text="Descripción:" CssClass="col-sm-2 col-form-label"/>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"/>
                    </div>
                </div>

            </div>
            <div class="card-footer clearfix">
                <asp:Button ID="btnRegresar" runat="server" Text="Regresar" 
                    CssClass="float-start btn btn-secondary" OnClick="btnRegresar_Click"/>
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" 
                    CssClass="float-end btn btn-primary" OnClick="btnGuardar_Click"/>
            </div>
        </div>
    </div>
</asp:Content>