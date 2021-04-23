<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="UTTT.Ejemplo.Persona.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Menu Principal</title>
     <style type="text/css"> 
#form1 {

  background-color: #FFFFFF;
 font:bold
}

</style>
   
 
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous"/>
   
</head>

<body>
        <form id="form" runat="server" class=" form-horizontal"  onsubmit="return camposValid()">

     <div class="container" style="font-family: 'Lucida Sans Unicode'; " >

          <div id="form1" class="">
      <div class="container-fluid">     
          <div runat="server" class="navbar-form navbar-right">
              <br />
          <div  style="font-family: 'Lucida Sans Unicode'; font-weight: bold" align="right">     
          <%--<asp:Button ID="btnMenu" runat="server" class="btn btn-warning" Text="Menú"  OnClick="btnMenu_Click"  />--%>
          <asp:Button ID="btnLogout" runat="server" class="btn btn-danger btn-lg" Text="Cerrar Sesión"   OnClick="btnLogout_Click"  />
          </div>
          </div>

          </div> 
      <center><h2><b>Menú</b></h2></center>
        <div  style="font-family: 'Lucida Sans Unicode'; " align="center">
       <asp:Label  runat="server" Text="" CssClass="control-label " for="accion"  Font-Size="Large" Font-Bold="True"></asp:Label>
       </div>
</div>
         
          <div id="form1" class="well">


       <fieldset>
          
     
        <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
            
            <br />
         
           <div class="login-form">
           
        <br />
        <br />
        
            <div align="center">
              <asp:ImageButton CssClass="botonk" ID="ImageButton1" ImageUrl="~/Images/p1.PNG" class="button"  AlternateText="No Image available" OnClick="btnPersona_Click" runat="server" />   
         <center><b>Ingresar a Persona Principal</b></center>
        </div>
           <br />
           <br />
               <legend></legend>
               <br />

           <div  align="center" >

   <asp:ImageButton ID="ImageButton2" ImageUrl="~/Images/p2.PNG"  AlternateText="No Image available" OnClick="btnUsuario_Click" runat="server" />
                        <center><b>Ingresar a Usuario Principal</b></center>

           </div>


               <br />
               <br />
               <br />
           
               </div>

       </fieldset>
 </div>
         </div>
            </form>
</body>
</html>
