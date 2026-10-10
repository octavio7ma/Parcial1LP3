using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial1LP3
{
    public partial class Alta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            // Validamos que los campos no estén vacíos
            if (string.IsNullOrEmpty(txtNombre.Text) || string.IsNullOrEmpty(txtPrecio.Text))
            {
                lblMensaje.Text = "Por favor, complete todos los campos.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                // Le pasamos los valores a los parámetros del SqlDataSource
                SqlDataSourceProductos.InsertParameters["nombre"].DefaultValue = txtNombre.Text;
                SqlDataSourceProductos.InsertParameters["precio"].DefaultValue = txtPrecio.Text;
                SqlDataSourceProductos.InsertParameters["idCategoria"].DefaultValue = ddlCategorias.SelectedValue;

                // Ejecutamos el INSERT en la base de datos
                SqlDataSourceProductos.Insert();

                lblMensaje.Text = "¡Producto cargado con éxito!";
                lblMensaje.ForeColor = System.Drawing.Color.Green;

                // Limpiamos los TextBox para cargar otro
                txtNombre.Text = "";
                txtPrecio.Text = "";
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al guardar: " + ex.Message;
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}