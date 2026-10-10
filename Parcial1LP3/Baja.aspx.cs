using System;
using System.Data;

namespace Parcial1LP3
{
    public partial class Baja : System.Web.UI.Page
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
                // Buscamos el producto para mostrar sus datos antes de borrarlo
                DataView dv = (DataView)SqlDataSourceProducto.Select(System.Web.UI.DataSourceSelectArguments.Empty);

                if (dv != null && dv.Count > 0)
                {
                    lblNombre.Text = dv[0]["nombre"].ToString();
                    lblPrecio.Text = dv[0]["precio"].ToString();

                    PanelEliminacion.Visible = true;
                    lblMensaje.Text = "Producto encontrado. Verifique los datos antes de proceder.";
                    lblMensaje.ForeColor = System.Drawing.Color.Orange;
                }
                else
                {
                    PanelEliminacion.Visible = false;
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

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                // Ejecutamos el DeleteCommand del SqlDataSource
                SqlDataSourceProducto.Delete();

                lblMensaje.Text = "¡Producto eliminado correctamente de la base de datos!";
                lblMensaje.ForeColor = System.Drawing.Color.Green;

                // Ocultamos el cartel de peligro y limpiamos la caja
                PanelEliminacion.Visible = false;
                txtId.Text = "";
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al eliminar: " + ex.Message;
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}