using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Linq;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona
{
    public partial class ChangePassUser : System.Web.UI.Page
    {
        private SessionManager sessionk = new SessionManager();
        private int idPersona = 0;
        private UTTT.Ejemplo.Linq.Data.Entity.Usuarios baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();
        //private int tipoAccion = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            string valor = Convert.ToString(Request.QueryString["token"]);
            var token = valor;
            if (token == null)
            {
                this.Response.Redirect("~/Login.aspx");
            }
            else
            {
                idPersona = 1;
            }
            try
            {
                var por = token.ToString();
                this.Response.Buffer = true;
                this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Usuarios>().First(c => c.token == por.ToString());
                if (!this.IsPostBack)
                {
                    if (this.sessionk.Parametros["baseEntity"] == null)
                    {
                        this.sessionk.Parametros.Add("baseEntity", this.baseEntity);
                    }
                    if (this.idPersona == 0)
                    {
                       
                    }
                    else
                    {
                        this.txtNombre.Text = this.baseEntity.nombreUsuario;
                    }
                }

            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al cargar la página" + _e.Message);
                this.showMessageException(_e.Message);
            }

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtContra.Text == txtreContra.Text && txtContra.Text == txtreContra.Text)
                {

                    string valor = Convert.ToString(Request.QueryString["token"]);
                    var por = valor;
                    this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Usuarios>().First(c => c.token == por.ToString());
                    DataContext dcGuardar = new DcGeneralDataContext();
                    UTTT.Ejemplo.Linq.Data.Entity.Usuarios usuario = new Linq.Data.Entity.Usuarios();
                    if (dcGlobal != null)
                    {
                        usuario = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuarios>().First(c => c.token == por.ToString());
                        var contra = (txtContra.Text);
                        usuario.constrasenia = this.txtContra.Text.Trim();
                        this.showMessage("Sé cambió la Contraseña Correctamente");
                        dcGuardar.SubmitChanges();
                        FormsAuthentication.SignOut();
                        Session.Abandon();
                        this.Response.Redirect("~/Login.aspx");
                    }
                }
                else
                {
                    this.lblMensaje.Text = "Contraseñas no Coinciden";
                }
            }
            catch (Exception ex)
            {
                this.lblMensaje.Text = ex.Message;
            }
            String mensaje = String.Empty;
            if (!this.validacionSQL(ref mensaje))
            {
                this.lblMensaje.Text = mensaje;
                this.lblMensaje.Visible = true;
                return;
            }
            if (!this.validacionHTML(ref mensaje))
            {
                this.lblMensaje.Text = mensaje;
                this.lblMensaje.Visible = true;
                return;
            }
        }
        public bool validacionHTML(ref String _mensaje)
        {
            CtrlValidaInyeccion valida = new CtrlValidaInyeccion();
            string mensajefuncion = string.Empty;
            if (valida.htmlInyectionValida(this.txtContra.Text.Trim(), ref mensajefuncion, "Contraseña", ref this.txtContra))
            {
                _mensaje = mensajefuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtreContra.Text.Trim(), ref mensajefuncion, "Confirmar Contraseña", ref this.txtreContra))
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
            if (valida.sqlInyectionValida(this.txtContra.Text.Trim(), ref mensajefuncion, "Contraseña", ref this.txtContra))
            {
                _mensaje = mensajefuncion;
                return false;
            }
            if (valida.sqlInyectionValida(this.txtreContra.Text.Trim(), ref mensajefuncion, "Confirmar Contraseña", ref this.txtreContra))
            {
                _mensaje = mensajefuncion;
                return false;
            }
            return true;
        }
    }
}