
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Linq;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Model;

namespace UTTT.Ejemplo.Persona
{
    public partial class Recuperarcontrasenia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        persona1Entities db = new persona1Entities();
        DataContext dcGuardar = new DcGeneralDataContext();
        UTTT.Ejemplo.Linq.Data.Entity.Usuarios usuario = new Linq.Data.Entity.Usuarios();
        private UTTT.Ejemplo.Linq.Data.Entity.Usuarios baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();

        /// <summary>
        /// /boton 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ButPwd_Click(object sender, EventArgs e)
        {
            try
            {
                var user = db.Persona.FirstOrDefault(p => p.strCorreo == txtCorreo.Text);
                if (user != null)
                {
                    var user2 = db.Usuarios.FirstOrDefault(p => p.idPersona == user.id);
                    string correo = user.strCorreo.ToString();
                    MD5("123456");
                    string tak = Token();
                    Error(tak, correo);
                    this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Usuarios>().First(c => c.id == user2.id);
                    DataContext dcGuardar = new DcGeneralDataContext();
                    UTTT.Ejemplo.Linq.Data.Entity.Usuarios usuario = new Linq.Data.Entity.Usuarios();
                    if (dcGlobal != null)
                    {
                        usuario = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuarios>().First(c => c.id == user2.id);
                        var por = tak;
                        Session["abc"] = por.ToString().Trim();
                        usuario.token = por.ToString().Trim();
                        var net = Session["abc"].ToString();
                        dcGuardar.SubmitChanges();
                        this.lblAlert.Text = "Se envió un correo electrónico ";
                    }
                }
                else
                {
                    this.lblAlert.Text = "Correo No Registrado en el Sistema";
                }
            }
            catch (Exception ex)
            {
                this.lblAlert.Text = ex.Message;
            }
            String mensaje = String.Empty;
            UTTT.Ejemplo.Linq.Data.Entity.Persona per = new Linq.Data.Entity.Persona();
            if (!this.validacion(per, ref mensaje))
            {
                this.lblAlert.Text = mensaje;
                this.lblAlert.Visible = true;
                return;
            }

            if (!this.validacionSQL(ref mensaje))
            {
                this.lblAlert.Text = mensaje;
                this.lblAlert.Visible = true;
                return;
            }
            if (!this.validacionHTML(ref mensaje))
            {
                this.lblAlert.Text = mensaje;
                this.lblAlert.Visible = true;
                return;
            }

        }
        public bool validacion(UTTT.Ejemplo.Linq.Data.Entity.Persona _persona, ref String _mensaje)
        {
           
            return true;
        }

        public bool validacionHTML(ref String _mensaje)
        {
            CtrlValidaInyeccion valida = new CtrlValidaInyeccion();
            string mensajefuncion = string.Empty;
            if (valida.htmlInyectionValida(this.txtCorreo.Text.Trim(), ref mensajefuncion, "E-Mail", ref this.txtCorreo))
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
            if (valida.sqlInyectionValida(this.txtCorreo.Text.Trim(), ref mensajefuncion, "E-Mail", ref this.txtCorreo))
            {
                _mensaje = mensajefuncion;
                return false;
            }
          
            return true;
        }
        public static string MD5(string word)
        {
            MD5 md5 = MD5CryptoServiceProvider.Create();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] stream = null;
            StringBuilder sb = new StringBuilder();
            stream = md5.ComputeHash(encoding.GetBytes(word));
            for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
            return sb.ToString();
        }
        public static string Token()
        {
            long i = 1;
            foreach (byte b in Guid.NewGuid().ToByteArray()) i *= ((int)b + 1);
            return MD5(string.Format("{0:x}", i - DateTime.Now.Ticks));
        }
        public new void Error(string error, string correo)
        {
            string EmailOrigen = "jairlunagarcia45@gmail.com";
            string EmailDestino = correo;
            string contra = "Jgarcia81";

            MailMessage oMailMessage = new MailMessage(EmailOrigen, EmailDestino, "Cambiar Contraseña: Ingrese a este link", "http://appJairLuna.somee.com/appj/ChangePassUser.aspx" + "?token=" + error);

            oMailMessage.IsBodyHtml = true;
            SmtpClient oSmtpClient = new SmtpClient("smtp.gmail.com");
            oSmtpClient.EnableSsl = true;
            oSmtpClient.UseDefaultCredentials = false;
           
            
            oSmtpClient.Credentials = new System.Net.NetworkCredential(EmailOrigen, contra);
            oSmtpClient.Port = 587;
            oSmtpClient.Send(oMailMessage);

            oMailMessage.Dispose();
        }
    }
}


