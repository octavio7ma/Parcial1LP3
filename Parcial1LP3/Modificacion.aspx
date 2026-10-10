<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modificacion.aspx.cs" Inherits="Parcial1LP3.Modificacion" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Modificación de Productos</title>
    <link href="estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="font-family: Arial; padding: 20px;">
            <h2>Modificar Producto</h2>
            <hr />
            <br />
            Ingrese el ID del Producto a modificar:<br />
            <asp:TextBox ID="txtId" runat="server" Width="100px"></asp:TextBox>
            &nbsp;
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
            <br /><br />
            
            <%--  panel arranca oculto y se muestra solo si el ID existe --%>
            <asp:Panel ID="PanelEdicion" runat="server" Visible="false">
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
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cambios" OnClick="btnGuardar_Click" />
            </asp:Panel>
            
            <br />
            <asp:Label ID="lblMensaje" runat="server" Font-Bold="true"></asp:Label>
            <br /><br />
            <hr />
            <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/WebForm1.aspx">Volver al menú principal</asp:HyperLink>

            <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server" 
                ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=TiendaOnline;Integrated Security=True" 
                SelectCommand="SELECT idCategoria, descripcion FROM categorias">
            </asp:SqlDataSource>

            <%--  Busca (SELECT) y Actualiza (UPDATE) --%>
            <asp:SqlDataSource ID="SqlDataSourceProducto" runat="server" 
                ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=TiendaOnline;Integrated Security=True" 
                SelectCommand="SELECT nombre, precio, idCategoria FROM productos WHERE idProducto = @idProducto"
                UpdateCommand="UPDATE productos SET nombre = @nombre, precio = @precio, idCategoria = @idCategoria WHERE idProducto = @idProducto">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtId" Name="idProducto" PropertyName="Text" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="precio" Type="Double" />
                    <asp:Parameter Name="idCategoria" Type="Int32" />
                    <asp:ControlParameter ControlID="txtId" Name="idProducto" PropertyName="Text" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>