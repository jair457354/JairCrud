<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaManager" Debug="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript">
        function validarFormatoFecha(campo) {
            var RegExPattern = /^\d{1,2}\/\d{1,2}\/\d{2,4}$/;
            if ((campo.match(RegExPattern)) && (campo != '')) {
                return true;
            } else {
                return false;
            }
        }


    </script>
    <script type="text/javascript">

        function soloLetras(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return true;
            return false;
        }
    </script>
    <script type="text/javascript">
        function justNumbers(e) {
            var keynum = window.event ? window.event.keyCode : e.which;
            if ((keynum == 8 || keynum == 48))
                return true;
            if (keynum <= 47 || keynum >= 58) return false;
            return /\d/.test(String.fromCharCode(keynum));

        }
    </script>
      <style type="text/css"> 
#form1 {

  background-color: #FFFFFF;
 font:bold
}
 .login-form .btn {
		font-size: 16px;
		line-height: 26px;
		min-width: 120px;
        font-weight: bold;
		background: #161D8E;
		border: none;
		font-family: 'Lucida Sans Unicode', Lucida Sans Unicode;
    }
	.login-form .btn:hover, .login-form .btn:focus{
		background:  #487AD1;
        outline: none !important;
	}



</style>
 
    <title>Persona Manager</title>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <script src="Scripts/validaciones.js " type="text/javascript"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous"/>
</head>
<body>    
    <form id="form2" runat="server" class=" form-horizontal"  onsubmit="return camposValid()">
       <div class="container" style="font-family: 'Lucida Sans Unicode'; Font-Bold="True"" >       
       <div id="form1" class=""> 
           <div class="container-fluid">     
          <div runat="server" class="navbar-form navbar-right">
              <br />
          
          <div  style="font-family: 'Lucida Sans Unicode'; font-weight: bold" align="right">     
          <asp:Button ID="btnMenu" runat="server" class="btn btn-primary btn-lg" Text="Menú"  OnClick="btnMenu_Click"  />
          <asp:Button ID="btnLogout" runat="server" class="btn btn-primary btn-lg" Text="Cerrar Sesión"   OnClick="btnLogout_Click"  />
          </div>
          </div>

          </div> 
       <center><h2><b>Persona</b></h2></center>      
       <div  style="font-family: 'Lucida Sans Unicode'; " align="center">
       <asp:Label ID="lblAccion" runat="server" Text="Accion" CssClass="control-label " for="accion"  Font-Size="Large" ></asp:Label>
       </div>
       </div>
           <legend></legend>

          <div id="form1" class="">

          
  

     <fieldset>

       
      
         <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <%--<asp:Button ID="btnLogout" runat="server"  Text="Cerrar Sesión"  class="button"  OnClick="btnLogout_Click" />--%>
       
     

        <div class="form-group"  style="font-family: 'Lucida Sans Unicode'; "   >
        <asp:Label runat="server" Text="Sexo:" Class="control-label col-sm-4" for="sexo" ></asp:Label>
        <div class="col-md-4 inputGroupContainer">
         
        
        <asp:DropDownList ID="ddlSexo" runat="server" Class="form-control border border-secondary"   >
        </asp:DropDownList>
           
        <asp:RequiredFieldValidator  ID="rfvSexo" runat="server" ControlToValidate="ddlSexo" EnableClientScript="False" ErrorMessage="Selecciona un valor*" InitialValue="-1"></asp:RequiredFieldValidator>       
            
            </div>
            </div>
        

       

        <div class="form-group"  style ="font-family: 'Lucida Sans Unicode'; ">
        <asp:Label runat="server" Text="Clave Única:" CssClass="control-label col-sm-4 " for="txtClaveUnica" ></asp:Label> 
            <div class="col-md-4 inputGroupContainer">
         
           
        <asp:TextBox Class="form-control border border-secondary "  ID="txtClaveUnica" onkeypress="return justNumbers(event);" runat="server" ViewStateMode="Disabled" minlength="3" MaxLength="3"   ></asp:TextBox>
            
        <asp:RequiredFieldValidator ID="rfvClave" runat="server" ControlToValidate="txtClaveUnica" EnableClientScript="False" ErrorMessage="Clave Obligatoria*"></asp:RequiredFieldValidator>
        </div>
           </div>

           <div class="form-group" style="font-family: 'Lucida Sans Unicode'; " >
           <asp:Label  runat="server" Text="Nombre:" CssClass="control-label col-sm-4" for="nombre" ></asp:Label>
                 <div class="col-md-4 inputGroupContainer">
        
           <asp:TextBox Class="form-control border border-secondary  " ID="txtNombre" minlength="3" MaxLength="50" onkeypress="return soloLetras(event);" runat="server"  ViewStateMode="Disabled"   ></asp:TextBox>
           
           <asp:RequiredFieldValidator  ID="rfvNombre" runat="server" ControlToValidate="txtNombre" EnableClientScript="False" ErrorMessage="Nombre Obligatorio*"></asp:RequiredFieldValidator>         
           </div>
         </div>

          
          <div class="form-group"  style="font-family: 'Lucida Sans Unicode'; " >
          <asp:Label runat="server" Text="Apellido Paterno:" CssClass="control-label col-sm-4" for="APaterno" ></asp:Label>
                <div class="col-md-4 inputGroupContainer">
       
          <asp:TextBox Class="form-control border border-secondary " ID="txtAPaterno" minlength="3" MaxLength="50" onkeypress="return soloLetras(event);" runat="server" ViewStateMode="Disabled" ></asp:TextBox>
         
          <asp:RequiredFieldValidator ID="rfvAPaterno" runat="server" ControlToValidate="txtAPaterno" EnableClientScript="False" ErrorMessage="Apellido Paterno Obligatorio*"></asp:RequiredFieldValidator>        
          </div>
        </div>
        
           <div class="form-group" style="font-family: 'Lucida Sans Unicode'; " align="left">
           <asp:Label runat="server" Text="Apellido Materno:" CssClass="control-label col-sm-4" for="AMaterno" ></asp:Label>
                <div class="col-md-4 inputGroupContainer">
         
           <asp:TextBox Class="form-control border border-secondary " ID="txtAMaterno" minlength="3" MaxLength="50" onkeypress="return soloLetras(event);" runat="server" ViewStateMode="Disabled"  ></asp:TextBox>
             
           <asp:RequiredFieldValidator ID="rfvAMaterno" runat="server" ControlToValidate="txtAMaterno" EnableClientScript="False" ErrorMessage="Apellido  Materno Obligatorio*"></asp:RequiredFieldValidator>
            </div>
               </div>
           

        <div class="form-group"  style="font-family: 'Lucida Sans Unicode'; " align="left">        
          <asp:Label runat="server" Text="Fecha de Nacimiento:" CssClass="control-label col-sm-4"  for="FechaNac" ></asp:Label>
              <div class="col-md-4 inputGroupContainer">

         <div class="input-group date">
             
             <span class="input-group-addon" ><i > <asp:ImageButton ID="btnCa"   runat="server" Height="20px"  Width="20px" ImageUrl="~/Images/cal7.png" ></asp:ImageButton></i></span>

          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
          <asp:TextBox ID="TextBox1"   runat="server" CssClass="form-control border border-secondary"></asp:TextBox>
             
              </div>
             <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat="server" ControlToValidate="TextBox1" ErrorMessage="Fecha de Nacimiento Obligatoria*" EnableClientScript="True"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="revFechaNacimientoS" runat="server" ControlToValidate="TextBox1" ErrorMessage="Fecha Inválida*" ValidationExpression="(((19|20)([2468][048]|[13579][26]|0[48])|2000)[/-]02[/-]29|((19|20)[0-9]{2}[/-](0[4678]|1[02])[/-](0[1-9]|[12][0-9]|30)|(19|20)[0-9]{2}[/-](0[1359]|11)[/-](0[1-9]|[12][0-9]|3[01])|(19|20)[0-9]{2}[/-]02[/-](0[1-9]|1[0-9]|2[0-8])))"></asp:RegularExpressionValidator>
             
                  <%--^\d{4}([\-/.])(0?[1-9]|1[1-2])\1(3[01]|[12][0-9]|0?[1-9])$--%>
                 <%-- <asp:RangeValidator 
    ID="RangeValidatorFe"
    runat="server" 
    ControlToValidate="TextBox1" 
    ErrorMessage="Introduce una Fecha Válida" EnableClientScript="False" />--%>



          <ajaxToolkit:CalendarExtender   ID="Calendar1" runat="server" Format="yyyy-MM-dd" PopupPosition="BottomRight"  BehaviorID="Calendar1" PopupButtonID="btnCa" TargetControlID="TextBox1" ></ajaxToolkit:CalendarExtender>
<ajaxToolkit:TextBoxWatermarkExtender  
    ID="WatermarkExtender1"
    runat="server" 
   TargetControlID="TextBox1" 
   WatermarkCssClass="watermarked" 
   
   WatermarkText="yyyy-mm-dd" />
                  
            </div>

          </div>



            <div class="form-group" style="font-family: 'Lucida Sans Unicode'; " align="left" >
            <asp:Label runat="server" Text="Email:" CssClass="control-label col-sm-4"  for="email"></asp:Label>
                <div class="col-md-4 inputGroupContainer">
        
            <asp:TextBox CssClass="form-control border border-secondary" ID="txtCorreo" runat="server" MaxLength="50" TextMode="Email" ></asp:TextBox>
           
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCorreo" EnableClientScript="False" ErrorMessage="Correo Inválido!*" ValidationExpression="^[a-zA-Z0-9.!#$%&amp;'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreo" EnableClientScript="False" ErrorMessage="E-Mail Obligatorio*"></asp:RequiredFieldValidator>
            </div>
        </div>
  
            <div class="form-group"  style="font-family: 'Lucida Sans Unicode'; " align="left">
            <asp:Label runat="server" Text="Código Postal:" CssClass="control-label col-sm-4" for="cp" ></asp:Label>
                   <div class="col-md-4 inputGroupContainer">
        
            <asp:TextBox CssClass="form-control border border-secondary " ID="txtCP" onkeypress="return justNumbers(event);" runat="server" MaxLength="5" minlength="5" ></asp:TextBox>
           
            <asp:RequiredFieldValidator ID="rfvCP" onkeypress="return justNumbers(event);" runat="server" ControlToValidate="txtCP" EnableClientScript="False" ErrorMessage="Código Postal Obligatorio*"></asp:RequiredFieldValidator>                
            </div>
                </div>
           

             <div class="form-group"  style="font-family: 'Lucida Sans Unicode'; " align="left">
             <asp:Label runat="server" Text="RFC:" CssClass="control-label col-sm-4" for="rfc" ></asp:Label>       
                    <div class="col-md-4 inputGroupContainer">
         
             <asp:TextBox CssClass="form-control border border-secondary " ID="txtRFC" runat="server"  ></asp:TextBox>
           
             <asp:RequiredFieldValidator ID="rfvRFC"  runat="server" ControlToValidate="txtRFC" EnableClientScript="False" ErrorMessage="RFC  Obligatorio*"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="revRFCi" runat="server" ControlToValidate="txtRFC" ErrorMessage="RFC inválido!" ValidationExpression="(([A-Z]|\s){1})(([A-Z]){3})([0-9]{6})((([A-Z]|[0-9]){3}))" EnableClientScript="False"></asp:RegularExpressionValidator>
             </div>
                 </div>

                     <div class="form-group"  style="font-family: 'Lucida Sans Unicode'; " align="left">
                   <asp:Label runat="server" Text="Estado Civil:" CssClass="control-label col-sm-4" for="estadoCivil"></asp:Label>       
                   <div class="col-md-4 inputGroupContainer">
               
             <asp:DropDownList ID="ddlEstadoCivil" runat="server" Class="form-control border border-secondary" >
        </asp:DropDownList>
           
                    
           <asp:RequiredFieldValidator  ID="rfvEstadoCivil" runat="server" ControlToValidate="ddlEstadoCivil" EnableClientScript="False" ErrorMessage="Selecciona un valor*" InitialValue="-1"></asp:RequiredFieldValidator>       

                    </div>
                     </div>


        <div class="form-group" style="font-family: 'Century Gothic';  ">
         <div  style="font-family: 'Century Gothic'; font-weight: bold" align="center">     
         <asp:Label Visible="false" CssClass="alert alert-danger" ID="lblMensaje" runat="server"  
             Font-Size="Medium" ForeColor="Red"     Width="500px"></asp:Label>
         </div>
        </div> 
           
      
      <div runat="server" class="navbar-form navbar-right">
          <div  style="font-family: 'Lucida Sans Unicode'; font-weight: bold" align="right">     
         
          <asp:Button CssClass="btn btn-success btn-lg" ID="btnAceptar" runat="server" Text="Guardar"
              OnClick="btnAceptar_Click" ViewStateMode="Disabled"   Height="46px" Width="123px" >          </asp:Button>
                       
                        <asp:Button CssClass="btn btn-primary btn-lg" ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" ViewStateMode="Disabled"   Height="46px" Width="123px"/>
               <br />
           <br />
        
          </div>
        </div>
        
              </fieldset>
              </div>
      </div>
        
    </form>
         
      
</body>
</html>
