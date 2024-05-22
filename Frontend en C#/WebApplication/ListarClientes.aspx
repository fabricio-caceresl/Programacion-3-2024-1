<%@ Page Title=""
    Language="C#"
    MasterPageFile="~/Empresa.Master"
    AutoEventWireup="true"
    CodeBehind="ListarClientes.aspx.cs"
    Inherits="WebApplication.ListarClientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    Listado de Clientes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container">
        <h2>Listado de Clientes</h2>
        <div class="container row">
            <div class="row align-items-center">

                <div class="col-auto">
                    <asp:Label CssClass="form-label" runat="server" Text="Ingresar el nombre:"></asp:Label>
                </div>
                <div class="col-sm-3">
                    <asp:TextBox CssClass="form-control" ID="txtNombre" runat="server"></asp:TextBox>
                </div>

                <div class="col-sm-2">
                    <asp:LinkButton ID="lbBuscar" runat="server" CssClass="btn btn-info" Text="<i class='fa-solid fa-magnifying-glass pe-2'></i> Buscar" OnClick="lbBuscar_Click" />
                </div>
                <div class="col text-end p-3">
                    <asp:LinkButton ID="lbRegistrarArea" runat="server" CssClass="btn btn-success" Text="<i class='fa-solid fa-plus pe-2'></i> Registrar Cliente" />
                </div>

            </div>
        </div>
        <div class="container row">
            <asp:GridView ID="gvClientes" runat="server"
                AllowPaging="true" PageSize="5" 
                AutoGenerateColumns="false"
                CssClass="table table-hover table-responsive table-striped"
                OnPageIndexChanging="gvClientes_PageIndexChanging">
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="Id" />
                    <asp:BoundField HeaderText="DNI" DataField="Dni" />
                    <asp:BoundField HeaderText="Nombre Completo" DataField="NombreCompleto" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server"
                                Text="<i class='fa-solid fa-edit ps-2'></i>"/>
                            <asp:LinkButton runat="server"
                                Text="<i class='fa-solid fa-trash ps-2'></i>"   />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
