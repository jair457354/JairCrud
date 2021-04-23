<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.UsuarioManager" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
      
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
    

         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Usuario Manager</title>
</head>

<body>
    <form  runat="server" class=" form-horizontal"  onsubmit="return camposValid()">
 <div class="container" style="font-family: 'Lucida Sans Unicode'; Font-Bold:'True'" >
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
    <center><h2><b>Usuario</b></h2></center>
          
        <div  style="font-family: 'Lucida Sans Unicode'; " align="center">
        <asp:Label ID="lblAccion" runat="server" Text="Accion" CssClass="control-label " for="accion"  Font-Size="Large" Font-Bold="True"></asp:Label>
        </div>
</div>
      <legend></legend>
       <div id="form1" class="">
     <fieldset>
        
           <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
           
           
         <br />
          <div class="form-group"  style="font-family: 'Lucida Sans Unicode'; "   >
        <asp:Label ID="lblPersona" runat="server" Text="Persona:" Class="control-label col-sm-4" for="per" ></asp:Label>
        <div class="col-md-4 inputGroupContainer">
        
        <asp:DropDownList ID="ddlPersona" runat="server" Class="form-control border border-secondary" OnSelectedIndexChanged="ddlPersona_SelectedIndexChanged"   >
        </asp:DropDownList>
           
        <asp:RequiredFieldValidator  ID="rfvPersona" runat="server" ControlToValidate="ddlPersona" EnableClientScript="False" ErrorMessage="Selecciona un valor*" InitialValue="-1"></asp:RequiredFieldValidator>       
            
            </div>
            </div>








           <div class="form-group" style="font-family: 'Lucida Sans Unicode'; " >
           <asp:Label  runat="server" Text="Nombre de Usuario:" CssClass="control-label col-sm-4" for="nombre" ></asp:Label>
                 <div class="col-md-4 inputGroupContainer">
       
           <asp:TextBox Class="form-control border border-secondary  " ID="txtNombre" minlength="3" MaxLength="15" onkeypress="return soloLetras(event);" runat="server"  ViewStateMode="Disabled" OnTextChanged="txtNombre_TextChanged"   ></asp:TextBox>
              
            
           <asp:RequiredFieldValidator  ID="rfvNombre" runat="server" ControlToValidate="txtNombre" EnableClientScript="False" ErrorMessage="Nombre Obligatorio*"></asp:RequiredFieldValidator>         
           </div>
         </div>

          <div class="form-group"  style="font-family: 'Lucida Sans Unicode'; " >
          <asp:Label runat="server" Text="Contraseña:" CssClass="control-label col-sm-4"  for="contra" ></asp:Label>
                <div class="col-md-4 inputGroupContainer">
        
          <asp:TextBox Class="form-control border border-secondary " type="Password" ID="txtContra" minlength="8" MaxLength="16" onkeypress="return soloLetras(event);" runat="server" ViewStateMode="Disabled"  ValidationGroup="edit"  ></asp:TextBox>            
      
          <asp:RequiredFieldValidator ID="rfvContra" runat="server" ControlToValidate="txtContra" EnableClientScript="False" ErrorMessage="Contraseña Obligatoria*"></asp:RequiredFieldValidator>        
          </div>
        </div>

          <div class="form-group" style="font-family: 'Lucida Sans Unicode'; " align="left">
           <asp:Label ID="lblRecontra" runat="server" Text="Confirmar Contraseña:" CssClass="control-label col-sm-4" for="reContras" ></asp:Label>
                <div id="k2" class="col-md-4 inputGroupContainer">
       
           <asp:TextBox Class="form-control border border-secondary " type="Password" ID="txtreContra" onkeypress="return soloLetras(event);" runat="server" ViewStateMode="Disabled"   ></asp:TextBox>
        
           <asp:RequiredFieldValidator ID="rfvreContra" runat="server" ControlToValidate="txtreContra" EnableClientScript="False" ErrorMessage="Campo Obligatorio*"></asp:RequiredFieldValidator>
<asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="txtContra" ControlToValidate="txtreContra" 
            ErrorMessage="No coinciden las contraseñas"></asp:CompareValidator>
               </div>
         </div>
          

          <div class="form-group"  style="font-family: 'Lucida Sans Unicode'; ">        
          <asp:Label runat="server" Text="Fecha de Registro:" CssClass="control-label col-sm-4"  for="FechaNac" ></asp:Label>
              <div class="col-md-4 inputGroupContainer">

         <div class="input-group date">
             
             <span class="input-group-addon" ><i > <asp:ImageButton ID="btnCa"   runat="server" Height="20px"  Width="20px" ImageUrl="~/Images/cal7.png" ></asp:ImageButton></i></span>

          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
          <asp:TextBox ID="TextBox1"   runat="server" CssClass="form-control border border-secondary"></asp:TextBox>
             
              </div>
             <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat="server" ControlToValidate="TextBox1" ErrorMessage="Fecha de registro Obligatoria*" EnableClientScript="True"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="revFechaNacimientoS" runat="server" ControlToValidate="TextBox1" ErrorMessage="Fecha Inválida*" ValidationExpression="(((19|20)([2468][048]|[13579][26]|0[48])|2000)[/-]02[/-]29|((19|20)[0-9]{2}[/-](0[4678]|1[02])[/-](0[1-9]|[12][0-9]|30)|(19|20)[0-9]{2}[/-](0[1359]|11)[/-](0[1-9]|[12][0-9]|3[01])|(19|20)[0-9]{2}[/-]02[/-](0[1-9]|1[0-9]|2[0-8])))"></asp:RegularExpressionValidator>
             
          <ajaxToolkit:CalendarExtender   ID="Calendar1" runat="server" Format="yyyy-MM-dd" PopupPosition="BottomRight"  BehaviorID="Calendar1" PopupButtonID="btnCa" TargetControlID="TextBox1" ></ajaxToolkit:CalendarExtender>
      <ajaxToolkit:TextBoxWatermarkExtender  
    ID="WatermarkExtender1"
    runat="server" 
   TargetControlID="TextBox1" 
   WatermarkCssClass="watermarked" 
   
   WatermarkText="yyyy-mm-dd" />
                  
            </div>

          </div>

         <div class="form-group"  style="font-family: 'Lucida Sans Unicode'; "   >
        <asp:Label ID="label4" runat="server" Text="Status:" Class="control-label col-sm-4" for="estatus" Font-Bold="True"></asp:Label>
        <div class="col-md-4 inputGroupContainer">
        
         
        <asp:DropDownList ID="ddlEstado" runat="server" Class="form-control border border-secondary" OnSelectedIndexChanged="ddlEstado_SelectedIndexChanged"   >
        </asp:DropDownList>
           
        <asp:RequiredFieldValidator  ID="rfvEstatus" runat="server" ControlToValidate="ddlEstado" EnableClientScript="False" ErrorMessage="Selecciona un valor*" InitialValue="-1"></asp:RequiredFieldValidator>       
           </div> 
        
            </div>

           <div class="form-group" style="font-family: 'Lucida Sans Unicode';  ">
         <div  style="font-family: 'Century Gothic'; font-weight: bold" align="center">     
         <asp:Label Visible="false" CssClass="alert alert-danger" ID="lblMensaje" runat="server"  
             Font-Size="Medium" ForeColor="Red"     Width="500px"></asp:Label>
         </div>
        </div> 
         <br />
          <div runat="server" class="navbar-form navbar-right">
          <div  style="font-family: 'Century Gothic'; font-weight: bold" align="right">     
         
          <asp:Button CssClass="btn btn-success btn-lg" ID="btnAceptar" runat="server" Text="Guardar"
              OnClick="btnAceptar_Click" ViewStateMode="Disabled"   Height="46px" Width="123px" >          </asp:Button>
                       
                        <asp:Button CssClass="btn btn-primary btn-lg" ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" ViewStateMode="Disabled"   Height="46px" Width="123px"/>
               <br />
           <br />
              
         </div>
          </div>
         
         </fieldset>
        </div>
     
         <br />
       </div>
    
        </form>
</body>
</html>
