<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Empresa.Master"
    AutoEventWireup="true"
    CodeBehind="GestionarEmpleado.aspx.cs"
    Inherits="WebApplication.GestionarEmpleado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    Gestionar Empleado
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2>Registrar Empleado</h2>
            </div>
            <!-- Campos para escribir los datos -->
            <div class="card-body">

                <div class="mb-3 row">
                    <asp:Label ID="lblId" runat="server" Text="ID:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtId" runat="server" Enabled="false" CssClass="form-control" />
                    </div>
                </div>

                <div class="mb-3 row">
                    <asp:Label ID="lblDni" runat="server" Text="DNI:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <div class="mb-3 row">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <div class="mb-3 row">
                    <asp:Label ID="lblApellidoPaterno" runat="server" Text="Apellido Paterno:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtApellidoPaterno" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <div class="mb-3 row">
                    <asp:Label ID="lblGenero" runat="server" Text="Género:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-8">
                        <asp:RadioButton ID="rbMasculino" runat="server" Text="Masculino" GroupName="gGenero" />
                        <asp:RadioButton ID="rbFemenino" runat="server" Text="Femenino" GroupName="gGenero" />
                    </div>
                </div>

                <div class="mb-3 row">
                    <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de Nacimiento:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-8">
                        <input type="date" id="dtpFechaNacimiento" runat="server" />
                    </div>
                </div>

                <div class="mb-3 row">
                    <asp:Label ID="lblArea" runat="server" Text="Área:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-8">
                        <asp:DropDownList ID="ddlAreas" runat="server"></asp:DropDownList>
                    </div>
                </div>

                <div class="mb-3 row">
                    <asp:Label ID="lblCargo" runat="server" Text="Cargo:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtCargo" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <div class="mb-3 row">
                    <asp:Label ID="lblSueldo" runat="server" Text="Sueldo:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtSueldo" runat="server" CssClass="form-control" />
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
</asp:Content>
