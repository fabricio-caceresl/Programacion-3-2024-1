<%@ Page Title="" Language="C#" MasterPageFile="~/Empresa.Master" AutoEventWireup="true" CodeBehind="GestionarTrabajador.aspx.cs" Inherits="WebApplication.GestionarTrabajador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2>Registrar Trabajador</h2>
            </div>
            <div class="card-body">

                <div class="mb-3 row">
                    <asp:Label ID="lblId" runat="server" Text="ID: "></asp:Label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtId" runat="server" Enabled="false"></asp:TextBox>
                    </div>
                </div>

                <div class="mb-3 row">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre: "></asp:Label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="mb-3 row">
                    <asp:Label ID="lblEdad" runat="server" Text="Edad: "></asp:Label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtEdad" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="mb-3 row">
                    <asp:Label ID="lblArea" runat="server" Text="Área: "></asp:Label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtArea" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="card-footer clearfix">
                <asp:Button ID="btnRegresar" runat="server" Text="Regresar"
                    CssClass="float-end btn btn-secondary m-1" OnClick="btnRegresar_Click"/>
                <asp:Button ID="btnRegistrar" runat="server" Text="Registrar"
                    CssClass="float-end btn btn-primary m-1" OnClick="btnRegistrar_Click"/>
            </div>

        </div>
    </div>
</asp:Content>
