using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;

namespace UTTT.Ejemplo.Persona
{

    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorMessage.Visible = false;
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection("Data Source=persona1.mssql.somee.com;Initial Catalog=persona1;Persist Security Info" +
            "=True;User ID=JairGarciaLuna_SQLLogin_2;Password=fw1lf36at4"))


            {
                string query = "SELECT COUNT(1) FROM Usuarios WHERE nombreUsuario=@nombreUsuario AND constrasenia=@constrasenia AND idCatEstado=1";
                SqlCommand sqlcmd = new SqlCommand(query, sqlCon);

                sqlcmd.Parameters.AddWithValue("@nombreUsuario", txtUser.Text.Trim());

                sqlcmd.Parameters.AddWithValue("@constrasenia", (txtPassword.Text.Trim()));

                sqlCon.Open();
                int count = Convert.ToInt32(sqlcmd.ExecuteScalar());
                if (count == 1)
                {
                    Session["nombreUsuario"] = txtUser.Text.Trim();
                    Response.Redirect("Menu.aspx");

                }
                else
                {
                    lblErrorMessage.Visible = true;
                }
            }
            String mensaje = String.Empty;
            DataContext dcGuardar = new DcGeneralDataContext();
            UTTT.Ejemplo.Linq.Data.Entity.Usuarios us = new Linq.Data.Entity.Usuarios();

           
            if (!this.validacionSQL(ref mensaje))
            {
                this.lblErrorMessage.Text = mensaje;
                this.lblErrorMessage.Visible = true;
                return;
            }
            if (!this.validacionHTML(ref mensaje))
            {
                this.lblErrorMessage.Text = mensaje;
                this.lblErrorMessage.Visible = true;
                return;
            }


        }
        protected void btnRecuperar_Click(object sender, EventArgs e)
        {
            this.Response.Redirect("~/Recuperarcontrasenia.aspx");
        }
        

        public bool validacionHTML(ref String _mensaje)
        {
            CtrlValidaInyeccion valida = new CtrlValidaInyeccion();
            string mensajefuncion = string.Empty;
            if (valida.htmlInyectionValida(this.txtUser.Text.Trim(), ref mensajefuncion, "Username", ref this.txtUser))
            {
                _mensaje = mensajefuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtPassword.Text.Trim(), ref mensajefuncion, "Password", ref this.txtPassword))
            {
                _mensaje = mensajefuncion;
                return false;
            }

            return true;

        }
        public bool validacionSQL(ref String _mensaje)
        {
            CtrlValidaInyeccion valida = new CtrlValidaInyeccion();
            string mensajefuncion = string.Empty;
            if (valida.sqlInyectionValida(this.txtUser.Text.Trim(), ref mensajefuncion, "Username", ref this.txtUser))
            {
                _mensaje = mensajefuncion;
                return false;
            }
            if (valida.sqlInyectionValida(this.txtPassword.Text.Trim(), ref mensajefuncion, "Password", ref this.txtPassword))
            {
                _mensaje = mensajefuncion;
                return false;
            }
            return true;
        }
        }
}
