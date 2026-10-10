<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Baja.aspx.cs" Inherits="Parcial1LP3.Baja" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Baja de Productos</title>
    <link href="estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="font-family: Arial; padding: 20px;">
            <h2>Dar de Baja un Producto</h2>
            <hr />
            <br />
            Ingrese el ID del Producto a eliminar:<br />
            <asp:TextBox ID="txtId" runat="server" Width="100px"></asp:TextBox>
            &nbsp;
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
            <br /><br />
            
            <asp:Panel ID="PanelEliminacion" runat="server" Visible="false" BackColor="#FFF3F3" Padding="15" BorderColor="Red" BorderStyle="Solid" BorderWidth="1px" Width="400px">
                <h3 style="color: red; margin-top: 0;">¿Está seguro que desea eliminar este producto?</h3>
                Producto: <asp:Label ID="lblNombre" runat="server" Font-Bold="true"></asp:Label>
                <br /><br />
                Precio: $<asp:Label ID="lblPrecio" runat="server" Font-Bold="true"></asp:Label>
                <br /><br />
                <asp:Button ID="btnEliminar" runat="server" Text="Confirmar Eliminación" OnClick="btnEliminar_Click" BackColor="Red" ForeColor="White" Font-Bold="true" />
            </asp:Panel>
            
            <br />
            <asp:Label ID="lblMensaje" runat="server" Font-Bold="true"></asp:Label>
            <br /><br />
            <hr />
            <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/WebForm1.aspx">Volver al menú principal</asp:HyperLink>

            <%-- conexion: Busca y Elimina --%>
            <asp:SqlDataSource ID="SqlDataSourceProducto" runat="server" 
                ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=TiendaOnline;Integrated Security=True" 
                SelectCommand="SELECT nombre, precio FROM productos WHERE idProducto = @idProducto"
                DeleteCommand="DELETE FROM productos WHERE idProducto = @idProducto">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtId" Name="idProducto" PropertyName="Text" Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:ControlParameter ControlID="txtId" Name="idProducto" PropertyName="Text" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>