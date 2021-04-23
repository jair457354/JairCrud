using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UTTT.Ejemplo.Persona
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nombreUsuario"] == null)
            {
                Response.Redirect("Login.aspx");

                lblUserDetails.Text = "nombreUsuario : " + Session["nombreUsuario"];
            }

        }

        protected void btnPersona_Click(object sender, EventArgs e)
        {
            Response.Redirect("PersonaPrincipal.aspx");
        }

        protected void btnUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("UsuarioPrincipal.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
        protected void btnMenu_Click(object sender, EventArgs e)
        {

            Response.Redirect("Menu.aspx");
        }
    }
}