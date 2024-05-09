<%@ Page Title="" Language="C#" MasterPageFile="~/Empresa.Master" AutoEventWireup="true" CodeBehind="GestionarTrabajador.aspx.cs" Inherits="WebApplication.GestionarTrabajador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <form>
        <div>
            <asp:Label ID="lblNombre" runat="server" Text="Nombre: "></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
        </div>

        <div>
            <asp:Label ID="lblEdad" runat="server" Text="Edad: "></asp:Label>
            <asp:TextBox ID="txtEdad" runat="server"></asp:TextBox>
        </div>

        <div>
            <asp:Label ID="lblArea" runat="server" Text="Area: "></asp:Label>
            <asp:TextBox ID="txtArea" runat="server"></asp:TextBox>
        </div>

        <div>
            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" />
        </div>
    </form>
</asp:Content>