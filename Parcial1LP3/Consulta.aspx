<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consulta.aspx.cs" Inherits="Parcial1LP3.Consulta" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Consulta de Productos</title>
    <link href="estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="font-family: Arial; padding: 20px;">
            <h2>Listado de Productos (Consulta con JOIN)</h2>
            <hr />
            <br />
            
            <%--  mostrar los datos --%>
            <asp:GridView ID="GridViewProductos" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSourceConsulta" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="idProducto" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="idProducto" />
                    <asp:BoundField DataField="nombre" HeaderText="Producto" SortExpression="nombre" />
                    <asp:BoundField DataField="precio" HeaderText="Precio" SortExpression="precio" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="categoria" HeaderText="Categoría" SortExpression="categoria" />
                </Columns>
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:GridView>
            
            <%-- JOIN a --%>
            <asp:SqlDataSource ID="SqlDataSourceConsulta" runat="server" 
                ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=TiendaOnline;Integrated Security=True" 
                SelectCommand="SELECT p.idProducto, p.nombre, p.precio, c.descripcion AS categoria FROM productos p INNER JOIN categorias c ON p.idCategoria = c.idCategoria">
            </asp:SqlDataSource>
            
            <br /><br />
            <hr />
            <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/WebForm1.aspx">Volver al menú principal</asp:HyperLink>
        </div>
    </form>
</body>
</html>