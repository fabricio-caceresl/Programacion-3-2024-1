<%@ Page Title=""
    Language="C#"
    MasterPageFile="~/Empresa.Master"
    AutoEventWireup="true"
    CodeBehind="ListarAreas.aspx.cs"
    Inherits="WebApplication.ListarAreas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    Listado de Áreas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container">
        <h2>Listado de Áreas</h2>
        <div class="container row">
            <div class="text-end p-3">
                <asp:LinkButton ID="lbRegistrarArea" runat="server"
                    CssClass="btn btn-success"
                    Text="<i class='fa-solid fa-plus pe-2'></i> Registrar Area" OnClick="lbRegistrarArea_Click" />
            </div>
        </div>
        <div class="container row">
            <asp:Label ID="lblSinAreasRegistradas" runat="server"></asp:Label>
            <asp:GridView ID="gvAreas" runat="server"
                AllowPaging="true" PageSize="5"
                OnPageIndexChanging="gvAreas_PageIndexChanging"
                AutoGenerateColumns="false"
                CssClass="table table-hover table-responsive table-striped">
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="id" />
                    <asp:BoundField HeaderText="Nombre" DataField="nombre" />
                    <asp:BoundField HeaderText="Descripción" DataField="descripcion" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server"
                                Text="<i class='fa-solid fa-edit ps-2'></i>"
                                CommandArgument='<%# Eval("ID") %>'
                                OnClick="lbModificarArea_Click" />
                            <asp:LinkButton runat="server"
                                Text="<i class='fa-solid fa-trash ps-2'></i>"
                                CommandArgument='<%# Eval("ID") %>'
                                OnClick="lbEliminarArea_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
