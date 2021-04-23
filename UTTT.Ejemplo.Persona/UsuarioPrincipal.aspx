<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.UsuarioPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Usuario Principal</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous"/>
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
    
</head>
<body>
        <form id="form2" runat="server" class=" form-horizontal"  onsubmit="return camposValid()">

   <div class="container" style="font-family: 'Lucida Sans Unicode'; ">
          <div id="form1" class="">
                <div class="container-fluid">     
          <div runat="server" class="navbar-form navbar-right">
              <br />
              <br />
          <div  style="font-family: 'Lucida Sans Unicode'; font-weight: bold" align="right">     
          <asp:Button ID="btnMenu" runat="server" class="btn btn-primary btn-lg" Text="Menú"  OnClick="btnMenu_Click"  />
          <asp:Button ID="btnLogout" runat="server" class="btn btn-danger btn-lg" Text="Cerrar Sesión"   OnClick="btnLogout_Click"  />
          </div>
          </div>

          </div> 
                   <center><h2><b>Usuario Principal </b></h2></center><br>
           
                     </div>

       <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
            <legend></legend>
          <div >
                <asp:ScriptManager runat="server" />   
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <input type="submit" name="btnTrick" value="" id="btnTrick" style="display: none;" />
            </ContentTemplate>
                </asp:UpdatePanel>


                 <div >

                </div>
            </div>

                  <div id="form1" class="">
                   
         <div class="form-group" style="font-family: 'Lucida Sans Unicode'; " align="left">
         <asp:Label runat="server" Text="Nombre de Usuario:" CssClass="control-label col-sm-2" for="nombre" ></asp:Label>
         <asp:TextBox CssClass="form-control border border-secondary " ID="txtNombre"   runat="server" ViewStateMode="Disabled" Width="211px"   AutoPostBack="True"  ></asp:TextBox>
         </div>

      


       <div class="form-group" style="font-family: 'Lucida Sans Unicode'; " align="left">
       <asp:Label runat="server" Text="Status:" CssClass="control-label col-sm-2" for="sexo" ></asp:Label>   
       <asp:DropDownList ID="ddlSexo" CssClass="form-control form-select border border-secondary " runat="server" Width="209px" >  </asp:DropDownList> 
</div>

      
          &nbsp;<br />
 <div  style="font-family: 'Lucida Sans Unicode'; font-weight: bold">         
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;         
       <asp:Button ID="Button1" CssClass="btn btn-primary " runat="server" Text="Buscar" onclick="btnBuscar_Click" ViewStateMode="Disabled" Height="42px" Width="95px" />
       &nbsp;&nbsp;&nbsp;
       <asp:Button ID="Button2" CssClass="btn btn-primary " runat="server" Text="Agregar" onclick="btnAgregar_Click" ViewStateMode="Disabled" Height="42px" Width="95px" />     
           </div>
         <br />
          <br />
       <div  style="font-family: 'Lucida Sans Unicode'; " align="center">
        <asp:Label ID="lblDetalle" runat="server" Text="Detalle" CssClass="control-label " for="detail"  Font-Size="X-Large"></asp:Label>
        </div>
        <br />

       
       <div  class="table-responsive">
        <asp:UpdatePanel ID="UpdatePanelll" runat="server" UpdateMode="Always">
                                <ContentTemplate>

                <asp:GridView style="font-family: 'Lucida Sans Unicode'" CssClass="table" ID="dgvPersonas" runat="server" 
                AllowPaging="True" AutoGenerateColumns="False" DataSourceID="DataSourcePersona" 
                Width="1100px" CellPadding="3" GridLines="Horizontal" 
                onrowcommand="dgvPersonas_RowCommand" BackColor="White" 
                  
                ViewStateMode="Disabled">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="nombreUsuario" HeaderText="Nombre Usuario" ReadOnly="True" SortExpression="nombreUsuario" />
                 <%--   <asp:BoundField DataField="constrasenia" HeaderText="Contraseña" ReadOnly="True" SortExpression="constrasenia" />--%>
                    <asp:BoundField DataField="CatUsuario" HeaderText="Status" ReadOnly="True" SortExpression="CatUsuario" />                
                    <asp:BoundField DataField="Persona" HeaderText="Persona" ReadOnly="True" SortExpression="Persona" />
                    <asp:BoundField DataField="dteFecha" HeaderText="Fecha de Registro" ReadOnly="True" SortExpression="dteFecha" />
                   
                 
                    <asp:TemplateField HeaderText="Editar">
                    <ItemTemplate>
                    <asp:ImageButton runat="server" ID="imgEditar" CommandName="Editar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/editrecord_16x16.png" />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                    
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar" Visible="True">
                    <ItemTemplate>
                    <asp:ImageButton runat="server" ID="imgEliminar" CommandName="Eliminar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/delrecord_16x16.png" OnClientClick="javascript:return confirm('¿Está seguro de querer eliminar el registro seleccionado?', 'Mensaje de sistema')"/>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="Direccion">
                      <ItemTemplate>
                      <asp:ImageButton runat="server" ID="imgDireccion" CommandName="Direccion" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/editrecord_16x16.png" />
                      </ItemTemplate>
                      <HeaderStyle HorizontalAlign="Center" />
                      <ItemStyle HorizontalAlign="Center" Width="50px" />         
                     </asp:TemplateField>
                </Columns>

                <FooterStyle BackColor="#9ECBC8" ForeColor="#9ECBC8" />
                <HeaderStyle BackColor="#9ECBC8" Font-Bold="False" ForeColor="#020202" />
                <PagerStyle BackColor="Silver" ForeColor="Black" HorizontalAlign="Center" Font-Bold="True" />
                <RowStyle BackColor="#BAE8E2" ForeColor="Black" />
                <SelectedRowStyle BackColor="#BAE8E2" Font-Bold="True" ForeColor="#020202" />
                <SortedAscendingCellStyle BackColor="#C2F4DE" />
                <SortedAscendingHeaderStyle BackColor="#9ECBC8" />
                <SortedDescendingCellStyle BackColor="#9ECBC8" />
                <SortedDescendingHeaderStyle BackColor="#9ECBC8" />
            </asp:GridView>     
                                    </ContentTemplate>
              </asp:UpdatePanel>
        </div>
                      <br />
                      <br />
                      <br />
                      <br />

        <asp:LinqDataSource ID="DataSourcePersona" runat="server" 
        ContextTypeName="UTTT.Ejemplo.Linq.Data.Entity.DcGeneralDataContext" 
        onselecting="DataSourcePersona_Selecting" 
        Select="new (nombreUsuario, constrasenia, CatUsuario, Persona, dteFecha,id)" 
        TableName="Persona" EntityTypeName="">
        </asp:LinqDataSource>
   

        
                


        
         <script type="text/javascript">
             var nombre = document.getElementById("txtNombre").value;
             document.querySelector('#txtNombre').addEventListener('keyup', function () {
                 const btnTrick = document.querySelector('#btnTrick');
                 btnTrick.click();
             });

         </script>
                      </div>
       <br />
    </div>
            </form>
</body>
</html>
