#region Using
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
using System.Data;
using System.Data.SqlClient;

#endregion

namespace UTTT.Ejemplo.Persona
{
    public partial class PersonaPrincipal : System.Web.UI.Page
    {
        #region Variables
     public   SqlConnection cn = new SqlConnection("Data Source=persona1.mssql.somee.com;Initial Catalog=persona1;Persist Security Info" +
            "=True;User ID=JairGarciaLuna_SQLLogin_2;Password=fw1lf36at4");
        private SessionManager session = new SessionManager();
        #endregion

        #region Eventos



        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nombreUsuario"] == null)
            {
                Response.Redirect("Login.aspx");

                lblUserDetails.Text = "nombreUsuario : " + Session["nombreUsuario"];
            }

            try
            {

                //this.txtNombre.AutoPostBack /*=*/ false;

                Response.Buffer = true;
                DataContext dcTemp = new DcGeneralDataContext();
                if (!this.IsPostBack)
                {
                    
                    List<CatSexo> lista = dcTemp.GetTable<CatSexo>().ToList();
                    CatSexo catTemp = new CatSexo();
                    catTemp.id = -1;
                    catTemp.strValor = "Todos";
                    lista.Insert(0, catTemp);
                    this.ddlSexo.DataTextField = "strValor";
                    this.ddlSexo.DataValueField = "id";
                    this.ddlSexo.DataSource = lista;
                    this.ddlSexo.DataBind();

                    List<CatEstadoCivil> listaE = dcTemp.GetTable<CatEstadoCivil>().ToList();
                    CatEstadoCivil catTempE = new CatEstadoCivil();
                    catTempE.id = -1;
                    catTempE.strValor = "Todos";
                    listaE.Insert(0, catTempE);
                    this.ddlEstadoCivil.DataTextField = "strValor";
                    this.ddlEstadoCivil.DataValueField = "id";
                    this.ddlEstadoCivil.DataSource = listaE;
                    this.ddlEstadoCivil.DataBind();
                }
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al cargar la página");               
            }

        }

       

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                this.DataSourcePersona.RaiseViewChanged();
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al buscar");
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                this.session.Pantalla = "~/PersonaManager.aspx";
                Hashtable parametrosRagion = new Hashtable();
                parametrosRagion.Add("idPersona", "0");
                this.session.Parametros = parametrosRagion;
                this.Session["SessionManager"] = this.session;
                this.Response.Redirect(this.session.Pantalla, false);               
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al agregar");
            }
        }

        protected void DataSourcePersona_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            try
            {
                DataContext dcConsulta = new DcGeneralDataContext();
                bool nombreBool = false;
                bool sexoBool = false;
                bool ECivilBool = false;
                if (!this.txtNombre.Text.Equals(String.Empty))
                {
                    nombreBool = true;
                }
                if (this.ddlSexo.Text != "-1")
                {
                    sexoBool = true;
                }
                if (this.ddlEstadoCivil.Text != "-1")
                {
                    ECivilBool = true;
                }

                Expression<Func<UTTT.Ejemplo.Linq.Data.Entity.Persona, bool>> 
                    predicate =
                    (c =>
                    ((sexoBool) ? c.idCatSexo == int.Parse(this.ddlSexo.Text) : true) &&
                     ((ECivilBool) ? c.idCatEstadoCivil == int.Parse(this.ddlEstadoCivil.Text) : true) &&
                    ((nombreBool) ? (((nombreBool) ? c.strNombre.Contains(this.txtNombre.Text.Trim()) : false)) : true)
                    );

                predicate.Compile();

                List<UTTT.Ejemplo.Linq.Data.Entity.Persona> listaPersona =
                    dcConsulta.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().Where(predicate).ToList();
                e.Result = listaPersona;        
            }
            catch (Exception _e)
            {
                throw _e;
            }
        }

        protected void dgvPersonas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int idPersona = int.Parse(e.CommandArgument.ToString());
                switch (e.CommandName)
                {
                    case "Editar":
                        this.editar(idPersona);
                        break;
                    case "Eliminar":
                        this.eliminar(idPersona);
                        break;
                    case "Direccion":
                        this.direccion(idPersona);
                        break;
                }
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al seleccionar");
            }
        }

        #endregion 

        #region Metodos

        private void editar(int _idPersona)
        {
            try
            {
                Hashtable parametrosRagion = new Hashtable();
                parametrosRagion.Add("idPersona", _idPersona.ToString());
                this.session.Parametros = parametrosRagion;
                this.Session["SessionManager"] = this.session;
                this.session.Pantalla = String.Empty;
                this.session.Pantalla = "~/PersonaManager.aspx";
                this.Response.Redirect(this.session.Pantalla, false);

            }
            catch (Exception _e)
            {
                throw _e;
            }
        }

        private void eliminar(int _idPersona)
        {
            try
            {
                DataContext dcDelete = new DcGeneralDataContext();
                UTTT.Ejemplo.Linq.Data.Entity.Persona persona = dcDelete.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().First(
                    c => c.id == _idPersona);
                dcDelete.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().DeleteOnSubmit(persona);
                dcDelete.SubmitChanges();
                this.showMessage("El registro se eliminó correctamente.");
                this.DataSourcePersona.RaiseViewChanged();                
            }
            catch (Exception _e)
            {
                throw _e;
            }
        }

        private void direccion(int _idPersona)
        {
            try
            {
                Hashtable parametrosRagion = new Hashtable();
                parametrosRagion.Add("idPersona", _idPersona.ToString());
                this.session.Parametros = parametrosRagion;
                this.Session["SessionManager"] = this.session;
                this.session.Pantalla = String.Empty;
                this.session.Pantalla = "~/DireccionManager.aspx";
                this.Response.Redirect(this.session.Pantalla, false);
            }
            catch (Exception _e)
            {
                throw _e;
            }
        }

        #endregion

        
        protected void txtNombre_TextChanged(object sender, EventArgs e)
        {
            {
                this.txtNombre.AutoPostBack = true;



            }

        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
        protected void btnMenu_Click(object sender, EventArgs e)
        {
            //Session.Abandon();
            Response.Redirect("Menu.aspx");
        }
    }
}