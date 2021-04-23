<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recuperarcontrasenia.aspx.cs" Inherits="UTTT.Ejemplo.Persona.Recuperarcontrasenia" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Cambiar Contraseña</title>
         <style type="text/css">
		#form1 {

  background-color: #A3E5DE;
 font:bold
}
	body {
		color: #4e4e4e;
		background: #e2e2e2;
		font-family: 'Lucida Sans Unicode', Lucida Sans Unicode;
	}
    .form-control {
		background: #f2f2f2;
        font-size: 16px;
		border-color: transparent;
		box-shadow: none !important;
	}
	.form-control:focus {
		border-color: #91d5a8;
        background: #e9f5ee;
	}
    .form-control, .btn {        
        border-radius: 2px;
    }
	.login-form {
		width: 550px;
		height:550px;
		margin: 0 auto;
	}
    .login-form h2 {
        margin: 0;
        padding: 30px 0;
        font-size: 28px;
		font: bold;
		color: #020202;
		font-family: 'Lucida Sans Unicode', Lucida Sans Unicode;
    }
	.login-form .avatar {
		margin: 0 auto 30px;
		width: 100px;
		height: 100px;
		border-radius: 50%;
		z-index: 9;
		background:  #FFFFFF;
		padding: 15px;
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
	}
	.login-form .avatar img {
		width: 100%;
	}
    .login-form form {
		color: #7a7a7a;
		border-radius: 4px;
    	margin-bottom: 40px;
        background: #F3D0E5 ;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;		
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
	.checkbox-inline {
		margin-top: 14px;
	}
	.checkbox-inline input {
		margin-top: 3px;
	}
    .login-form a {
		color: #4aba70;
	}	
	.login-form a:hover {
		text-decoration: underline;
	}
	.hint-text {
		color: #020202;
        text-align: center;
		padding-bottom: 22px;
		font-size: 16px;
		font-family: 'Lucida Sans Unicode', Lucida Sans Unicode;
	}
</style>
   
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous"/>
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
	  <div class="login-form">
   
     
 <br />
	   <br />
    
    

        <form id="form1" runat="server"  >
    
				<h2 class="text-center">Ingresa tu E-Mail</h2>      
           <div class="form-group" style="font-family: 'Lucida Sans Unicode'; " align="left" >
			   <br />
			   <br />


	
     
            <asp:TextBox CssClass="form-control border input-lg border-secondary" ID="txtCorreo" runat="server" placeholder="Correo Electrónico" MaxLength="50" TextMode="Email" ></asp:TextBox>
         
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCorreo" EnableClientScript="False" ErrorMessage="Correo Inválido!*" ValidationExpression="^[a-zA-Z0-9.!#$%&amp;'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreo" EnableClientScript="False" ErrorMessage="E-Mail Obligatorio*"></asp:RequiredFieldValidator>
           
        </div>

            <div class="form-group clearfix">
        <asp:Button  ID="ButPwd" runat="server" class="btn btn-primary btn-lg pull-right" Text="Enviar contraseña" OnClick="ButPwd_Click" />
				 </div>
        
      
            </form>

		  <div class="form-group" style="font-family: 'Lucida Sans Unicode';  ">
			  <div  style="font-family: 'Lucida Sans Unicode'; font-weight: bold" align="center">    
            <asp:Label   Font-Size="Medium" ForeColor="#1B4F72"  Width="450px" CssClass="alert alert-dismissable" ID="lblAlert" runat="server" ></asp:Label>
				</div>
			  </div>
        </div>
	
</body>
</html>
