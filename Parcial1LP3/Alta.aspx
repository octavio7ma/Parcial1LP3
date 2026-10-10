<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alta.aspx.cs" Inherits="Parcial1LP3.Alta" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Alta de Productos</title>
    <link href="estilos.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <form id="form1" runat="server">
        <div style="font-family: Arial; padding: 20px;">
            <h2>Alta de Nuevo Producto</h2>
            <br />
            Nombre del Producto:<br />
            <asp:TextBox ID="txtNombre" runat="server" Width="250px"></asp:TextBox>
            <br /><br />
            Precio:<br />
            <asp:TextBox ID="txtPrecio" runat="server" Width="100px"></asp:TextBox>
            <br /><br />
            Categoría:<br />
            <asp:DropDownList ID="ddlCategorias" runat="server" DataSourceID="SqlDataSourceCategorias" DataTextField="descripcion" DataValueField="idCategoria">
            </asp:DropDownList>
            <br /><br />
            
            <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" OnClick="btnConfirmar_Click" />
            <br /><br />
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
            <br /><br />
            <hr />
            <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/WebForm1.aspx">Volver a la página principal</asp:HyperLink>

            <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server" 
                ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=TiendaOnline;Integrated Security=True" 
                SelectCommand="SELECT idCategoria, descripcion FROM categorias">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceProductos" runat="server" 
                ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=TiendaOnline;Integrated Security=True" 
                InsertCommand="INSERT INTO productos (nombre, precio, idCategoria) VALUES (@nombre, @precio, @idCategoria)">
                <InsertParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="precio" Type="Double" />
                    <asp:Parameter Name="idCategoria" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>