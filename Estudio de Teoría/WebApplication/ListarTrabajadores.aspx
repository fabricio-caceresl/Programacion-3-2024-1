<%@ Page Title="" Language="C#" MasterPageFile="~/Empresa.Master" AutoEventWireup="true" CodeBehind="ListarTrabajadores.aspx.cs" Inherits="WebApplication.ListarTrabajadores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <h2>Listado de Trabajadores</h2>
    <div class="container row">
        <div class="text-end p-3">
            <asp:LinkButton ID="lbRegistrarTrabajador" runat="server"
                class="btn btn-success"
                Text="<i class='fa-solid fa-plus pe-2'></i> Registrar Area" />
        </div>
    </div>
    <div class="container row">
        <asp:GridView ID="gvTrabajadores" runat="server"
            AutoGenerateColumns="false"
            CssClass="table table-hover table-responsive table-striped">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="Id"/>
                <asp:BoundField HeaderText="Nombre" DataField="Nombre"/>
                <asp:BoundField HeaderText="Edad" DataField="Edad"/>
                <asp:BoundField HeaderText="Área" DataField="Area"/>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton runat="server" Text="<i class='fa-solid fa-edit ps-2'></i>"/>
                        <asp:LinkButton runat="server" Text="<i class='fa-solid fa-trash ps-2'></i>"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>