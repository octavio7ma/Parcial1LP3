<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Parcial1LP3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Tienda de Componentes PC - Menú</title>
    <link href="estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="font-family: Arial; padding: 20px;">
            <h2>Menú Principal - Tienda de Componentes PC</h2>
            <br />
            <asp:HyperLink ID="hlAlta" runat="server" NavigateUrl="~/Alta.aspx">1. Alta de productos</asp:HyperLink>
            <br /><br />
            <asp:HyperLink ID="hlConsulta" runat="server" NavigateUrl="~/Consulta.aspx">2. Consulta de productos</asp:HyperLink>
            <br /><br />
            <asp:HyperLink ID="hlModificacion" runat="server" NavigateUrl="~/Modificacion.aspx">3. Modificación de productos</asp:HyperLink>
            <br /><br />
            <asp:HyperLink ID="hlBaja" runat="server" NavigateUrl="~/Baja.aspx">4. Baja de productos</asp:HyperLink>
        </div>
    </form>
</body>
</html>