<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UTTT.Ejemplo.Persona.Login" %>

<!DOCTYPE html>
<%--<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">--%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    .login-form h1 {
        margin: 0;
        padding: 30px 0;
        font-size: 34px;
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
    
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <link href="StyleSheet1.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
</head>
<body>
     
   <div class="login-form">
	   <br />
	   <br />
	<h1 class="text-center"></h1>
	   <h1 class="text-center"></h1>
    <form id="form1" runat="server">
		        <h1 class="text-center">Login</h1>
        <div class="form-group">
        	<asp:TextBox runat="server" id="txtUser" type="text" class="form-control input-lg" name="username" placeholder="Ingresa tu Usuario" required="required">	</asp:TextBox>
        </div>
        
		<div class="form-group">
            <asp:TextBox runat="server" id="txtPassword" type="password" class="form-control input-lg" name="password" placeholder="Ingresa tu Contraseña" required="required"></asp:TextBox>
        </div>
		<br />

        <div class="form-group clearfix">
			<%--<label class="pull-left checkbox-inline"><input type="checkbox"> Remember me</label>--%>
            <asp:Button runat="server" ID="btnLogin" OnClick="btnLogin_Click" Text="Ingresar" type="submit" class="btn btn-primary btn-lg pull-right" />
        </div>		
    </form>
	<div class="hint-text">Olvidaste tu Contraseña <a href="#"  OnClick="window.open('Recuperarcontrasenia.aspx','FP','width=800,height=400,top=300,left=500,fullscreen=no,resizable=0');"> Cambiar Contraseña </a>
</div>
	   <%--<div>--%>
                    <%--<asp:Literal ID="LitMsg" runat="server"></asp:Literal>--%>
                <%--</div>--%>
	    <div class="form-group" style="font-family: 'Lucida Sans Unicode';  ">
         <div  style="font-family: 'Lucida Sans Unicode'; font-weight: bold" align="center">     
         <asp:Label Visible="false" CssClass="alert alert-info" Text="La Contraseña o Usuario Incorrectos o Usuario Inactivo" ID="lblErrorMessage" runat="server"  
             Font-Size="Medium" ForeColor="Black"   Width="450px"></asp:Label>
		
			 
         </div>
        </div> 

</div>
</body>
</html>
