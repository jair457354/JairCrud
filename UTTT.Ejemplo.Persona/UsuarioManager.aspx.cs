using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using System.Data.Linq;
using System.Linq.Expressions;
using System.Collections;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;
using System.Text.RegularExpressions;
using System.IO;
using System.Diagnostics;
using System.Web.UI.MobileControls;
using EASendMail;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;
using System.Text;

namespace UTTT.Ejemplo.Persona
{
   
    public partial class UsuarioManager : System.Web.UI.Page
    {
        
    
    #region Variables

    private SessionManager sessionk = new SessionManager();
        private int idPersona = 0;
        private UTTT.Ejemplo.Linq.Data.Entity.Usuarios baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();
        private int tipoAccion = 0;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["nombreUsuario"] == null)
            {
                Response.Redirect("Login.aspx");

                lblUserDetails.Text = "nombreUsuario : " + Session["nombreUsuario"];
            }
            try
            {
                this.Response.Buffer = true;
                this.sessionk = (SessionManager)this.Session["SessionManager"];
                this.idPersona = this.sessionk.Parametros["idPersona"] != null ?
                    int.Parse(this.sessionk.Parametros["idPersona"].ToString()) : 0;
                if (this.idPersona == 0)
                {
                    this.baseEntity = new Linq.Data.Entity.Usuarios();
                    this.tipoAccion = 1;
                }
                else
                {
                    this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Usuarios>().First(c => c.id == this.idPersona);
                    this.tipoAccion = 2;
                }

                if (!this.IsPostBack)
                {
                    if (this.sessionk.Parametros["baseEntity"] == null)
                    {
                        this.sessionk.Parametros.Add("baseEntity", this.baseEntity);
                    }
                    //Personaaa
                    List<Linq.Data.Entity.Persona> lista = dcGlobal.GetTable<Linq.Data.Entity.Persona>().ToList();

                    this.ddlPersona.DataTextField = "strNombre";
                    this.ddlPersona.DataValueField = "id";

                    ///status
                    List<Linq.Data.Entity.CatUsuario> listaa = dcGlobal.GetTable<Linq.Data.Entity.CatUsuario>().ToList();

                    this.ddlEstado.DataTextField = "strValor";
                    this.ddlEstado.DataValueField = "id";


                    if (this.idPersona == 0)
                    {
                        Linq.Data.Entity.Persona catTemp = new Linq.Data.Entity.Persona();
                        catTemp.id = -1;
                        catTemp.strNombre = "Seleccionar";
                        lista.Insert(0, catTemp);
                        this.ddlPersona.DataSource = lista;
                        this.ddlPersona.DataBind();

                        Linq.Data.Entity.CatUsuario catTempp = new Linq.Data.Entity.CatUsuario();
                        catTempp.id = -1;
                        catTempp.strValor = "Seleccionar";
                        listaa.Insert(0, catTempp);
                        this.ddlEstado.DataSource = listaa;
                        this.ddlEstado.DataBind();
                        bindtoddl();

                        this.lblAccion.Text = "Agregar";
                        DateTime time = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
                        this.TextBox1.Text = DateTime.Today.ToString("yyyy-MM-dd");                      
                        this.Calendar1.SelectedDate = time;
                        this.Calendar1.EndDate = time;

                     
                         label4.Visible = false;
                         ddlEstado.Visible = false;
                         rfvEstatus.Visible = false;
                       
                        
                    }
                    else
                    {
                        this.lblAccion.Text = "Editar";
                        txtContra.TextMode = TextBoxMode.SingleLine;
                        txtreContra.TextMode = TextBoxMode.SingleLine;

                        this.txtNombre.Text = this.baseEntity.nombreUsuario;
                        this.txtContra.Text =( this.baseEntity.constrasenia);
                        this.txtreContra.Text =( this.baseEntity.constrasenia);
                        this.TextBox1.Text = this.baseEntity.dteFecha;
                       
                         ddlPersona.Enabled = false;
                    
                        this.ddlPersona.DataSource = lista;
                        this.ddlPersona.DataBind();

                   
                        rfvEstatus.Visible = false;

                        this.ddlEstado.DataSource = listaa;
                        this.ddlEstado.DataBind();
                      
                          this.setItem(ref this.ddlEstado, baseEntity.CatUsuario.strValor);
                      ///Cambioooooooooooooooo
                      ////////////////////////////
                        this.setItem(ref this.ddlPersona, baseEntity.Persona.strNombre);
                    }
                    this.ddlPersona.SelectedIndexChanged += new EventHandler(ddlPersona_SelectedIndexChanged);
                    this.ddlPersona.AutoPostBack = false;
                }
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al cargar la página");
                this.Response.Redirect("~/UsuarioPrincipal.aspx", false);
                this.showMessageException(_e.Message);
            }
        } 
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime fechaNacimiento = Convert.ToDateTime(this.TextBox1.Text);
                DateTime fechaHoy = DateTime.Now;
                int edad = fechaHoy.Year - fechaNacimiento.Year;
                if (fechaHoy < fechaNacimiento.AddYears(edad)) edad--;
                if (edad > 1)
                {
                    this.lblMensaje.Visible = true;
                    lblMensaje.Text = "Fecha de Registro no permitido, debe ser un registro actual";
                }
                else
                {
                    if (!Page.IsValid)
                    {
                        return;
                    }
                    DataContext dcGuardar = new DcGeneralDataContext();
                    UTTT.Ejemplo.Linq.Data.Entity.Usuarios persona = new Linq.Data.Entity.Usuarios();
                    UTTT.Ejemplo.Linq.Data.Entity.Persona personaa = new Linq.Data.Entity.Persona();
                    UTTT.Ejemplo.Linq.Data.Entity.CatUsuario personaaa = new Linq.Data.Entity.CatUsuario();
                    if (this.idPersona == 0)
                    {

                        persona.idCatEstado = 1;
                        persona.constrasenia = txtContra.Text.Trim();



                        //encriptamos la cadena inicial       
                        ///  persona.constrasenia= Crypt.cifrar(txtContra.Text);

                        persona.dteFecha = this.TextBox1.Text.Trim();
                        var comprobar = dcGlobal.GetTable<Usuarios>().Where(a => a.nombreUsuario == txtNombre.Text).FirstOrDefault();
                        var comprobare = dcGlobal.GetTable<Usuarios>().Where(a => a.idPersona == int.Parse(ddlPersona.Text)).FirstOrDefault();
                        if (comprobar != null)
                        {


                            this.lblMensaje.Visible = true;
                            this.lblMensaje.Text = "Nombre de Usuario Repetido";

                        }
                        else if (comprobare != null)
                        {


                            this.lblMensaje.Visible = true;
                            this.lblMensaje.Text = "La Persona ya está asignada a otro Usuario ";

                        }
                        else
                        {
                            persona.idPersona = int.Parse(this.ddlPersona.Text);
                            persona.nombreUsuario = this.txtNombre.Text.Trim();
                            String mensaje = String.Empty;
                            if (!this.validacion(persona, ref mensaje))
                            {
                                this.lblMensaje.Text = mensaje;
                                this.lblMensaje.Visible = true;
                                return;
                            }
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


                            dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuarios>().InsertOnSubmit(persona);
                            dcGuardar.SubmitChanges();
                            this.showMessage("El registro se agrego correctamente.");
                            this.Response.Redirect("~/UsuarioPrincipal.aspx", false);
                        }
                    }
                    if (this.idPersona > 0)
                    {
                        persona = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuarios>().First(c => c.id == idPersona);

                        persona.nombreUsuario = this.txtNombre.Text.Trim();
                       
                        

                            //persona.constrasenia = Crypt.Desencriptar(txtContra.Text);
                            //persona.constrasenia = Crypt.Desencriptar(txtreContra.Text);
                            persona.constrasenia = this.txtContra.Text.Trim();
                            persona.constrasenia = this.txtreContra.Text;

                            persona.idCatEstado = int.Parse(this.ddlEstado.Text.Trim());
                            persona.idPersona = int.Parse(this.ddlPersona.Text);
                            persona.dteFecha = this.TextBox1.Text;

                            String mensaje = String.Empty;
                            if (!this.validacion(persona, ref mensaje))
                            {
                                this.lblMensaje.Text = mensaje;
                                this.lblMensaje.Visible = true;
                                return;
                            }
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

                            dcGuardar.SubmitChanges();
                            this.showMessage("El registro se edito correctamente.");
                            this.Response.Redirect("~/UsuarioPrincipal.aspx", false);
                        
                    }
                }
            }

            catch (Exception _e)
            {
                this.showMessageException(_e.Message);
                var mensaje = "Error message: " + _e.Message;
                if (_e.InnerException != null)
                {
                    mensaje = mensaje + " Inner exception: " + _e.InnerException.Message;
                }
                // Mi Correo
                mensaje = mensaje + " Stack trace: " + _e.StackTrace;
                this.Response.Redirect("~/ErrorPage.aspx", false);
                this.Correo("kmg192000@gmail.com", "Exception", mensaje);
            }
        }
        /// Encripta una cadena
       
    

    public bool Existe(int id)
        {
            using (SqlConnection conn = new SqlConnection("Data Source = persona1.mssql.somee.com; Initial Catalog = persona1; User ID =\tJairGarciaLuna_SQLLogin_2; Password = fw1lf36at4"))
            {
                string query = "SELECT COUNT(*) FROM Usuarios WHERE idPersona=@idPersona";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@idPersona", id);
                conn.Open();

                int count = Convert.ToInt32(cmd.ExecuteScalar());
                if (count == 0)
                    return false;
                else
                    return true;


            }
        }
        private void bindtoddl()
        {
            SqlConnection con = new SqlConnection("Data Source = persona1.mssql.somee.com; Initial Catalog = persona1; User ID =\tJairGarciaLuna_SQLLogin_2; Password = fw1lf36at4");
            SqlCommand cmd = new SqlCommand("select strNombre,id from Persona", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            ddlPersona.DataSource = ds;
            ddlPersona.DataTextField = "strNombre";
            ddlPersona.DataValueField = "id";
            ddlPersona.DataBind();
            ddlPersona.Items.Insert(0, new ListItem("Seleccionar", String.Empty));

        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                this.Response.Redirect("~/UsuarioPrincipal.aspx", false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
                this.showMessageException(_e.Message);
            }

        }
        protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public bool validacion(UTTT.Ejemplo.Linq.Data.Entity.Usuarios _persona, ref String _mensaje)
        {

  
          
            return true;
        }
        public bool validacionHTML(ref String _mensaje)
        {
            CtrlValidaInyeccion valida = new CtrlValidaInyeccion();
            string mensajefuncion = string.Empty;
            if (valida.htmlInyectionValida(this.txtNombre.Text.Trim(), ref mensajefuncion, "Nombre de Usuario", ref this.txtNombre))
            {
                _mensaje = mensajefuncion;
                return false;
            }


            if (valida.htmlInyectionValida(this.TextBox1.Text.Trim(), ref mensajefuncion, "Fecha de Registro", ref this.TextBox1))
            {
                _mensaje = mensajefuncion;
                return false;
            }

            //if (valida.htmlInyectionValida(this.txtContra.Text.Trim(), ref mensajefuncion, "Contraseña", ref this.txtContra))
            //{
            //    _mensaje = mensajefuncion;
            //    return false;
            //}
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
            if (valida.sqlInyectionValida(this.txtNombre.Text.Trim(), ref mensajefuncion, "Nombre de Usuario", ref this.txtNombre))
            {
                _mensaje = mensajefuncion;
                return false;
            }

          
            if (valida.sqlInyectionValida(this.TextBox1.Text.Trim(), ref mensajefuncion, "Fecha de Registro", ref this.TextBox1))
            {
                _mensaje = mensajefuncion;
                return false;
            }

            //if (valida.sqlInyectionValida(this.txtContra.Text.Trim(), ref mensajefuncion, "Contraseña", ref this.txtContra))
            //{
            //    _mensaje = mensajefuncion;
            //    return false;
            //}
            if (valida.sqlInyectionValida(this.txtreContra.Text.Trim(), ref mensajefuncion, "Confirmar Contraseña", ref this.txtreContra))
            {
                _mensaje = mensajefuncion;
                return false;
            }
          
          
          

            return true;
        }
        public void setItemEditar(ref DropDownList _control, String _value)
        {
            foreach (ListItem item in _control.Items)
            {
                if (item.Value != _value)
                {
                    item.Enabled = false;

                    break;
                }
            }
            _control.Items.FindByText(_value).Selected = true;
        }
        public void setItem(ref DropDownList _control, String _value)
        {
            foreach (ListItem item in _control.Items)
            {
                if (item.Value == _value)
                {
                    item.Selected = true;
                    break;
                }
            }
            _control.Items.FindByText(_value).Selected = true;
        }
        protected void ddlPersona_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtNombre_TextChanged(object sender, EventArgs e)
        {

        }
        public void Correo(string correoDestino, string asunto, string mensajeCorreo)
        {
            string mensaje = "Error al enviar correo.";

            try
            {
                SmtpMail objetoCorreo = new SmtpMail("TryIt");

                objetoCorreo.From = "kmg192000@gmail.com";
                objetoCorreo.To = correoDestino;
                objetoCorreo.Subject = asunto;
                objetoCorreo.TextBody = mensajeCorreo;

                SmtpServer objetoServidor = new SmtpServer("smtp.gmail.com");

                objetoServidor.User = "kmg192000@gmail.com";
                objetoServidor.Password = "k00iLn99kthe";
                objetoServidor.Port = 587;
                objetoServidor.ConnectType = SmtpConnectType.ConnectSSLAuto;

                SmtpClient objetoCliente = new SmtpClient();
                objetoCliente.SendMail(objetoServidor, objetoCorreo);
                mensaje = "Correo Enviado Correctamente.";


            }
            catch (Exception ex)
            {
                mensaje = "Error al enviar correo." + ex.Message;
            }
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



