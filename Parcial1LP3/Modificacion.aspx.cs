using System;
using System.Data;

namespace Parcial1LP3
{
    public partial class Modificacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtId.Text))
            {
                lblMensaje.Text = "Por favor, ingrese un ID válido.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                // Ejecutamos el Select del SqlDataSource para ver si el ID existe
                DataView dv = (DataView)SqlDataSourceProducto.Select(System.Web.UI.DataSourceSelectArguments.Empty);

                if (dv != null && dv.Count > 0)
                {
                    // Si encontró el producto, llenamos los campos
                    txtNombre.Text = dv[0]["nombre"].ToString();
                    txtPrecio.Text = dv[0]["precio"].ToString();
                    ddlCategorias.SelectedValue = dv[0]["idCategoria"].ToString();

                    // Mostramos el panel para que el usuario pueda editar
                    PanelEdicion.Visible = true;
                    lblMensaje.Text = "Producto encontrado. Puede editar los datos.";
                    lblMensaje.ForeColor = System.Drawing.Color.Blue;
                }
                else
                {
                    PanelEdicion.Visible = false;
                    lblMensaje.Text = "No se encontró ningún producto con el ID " + txtId.Text;
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al buscar: " + ex.Message;
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                // Pasamos los nuevos valores a los parámetros del UPDATE
                SqlDataSourceProducto.UpdateParameters["nombre"].DefaultValue = txtNombre.Text;
                SqlDataSourceProducto.UpdateParameters["precio"].DefaultValue = txtPrecio.Text;
                SqlDataSourceProducto.UpdateParameters["idCategoria"].DefaultValue = ddlCategorias.SelectedValue;

                // Ejecutamos la actualización
                SqlDataSourceProducto.Update();

                lblMensaje.Text = "¡Producto modificado con éxito!";
                lblMensaje.ForeColor = System.Drawing.Color.Green;

                // Ocultamos el panel y limpiamos la caja de búsqueda
                PanelEdicion.Visible = false;
                txtId.Text = "";
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al modificar: " + ex.Message;
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}