<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaPrincipal"  debug=false%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Persona Principal</title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous"/>
    <script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
          <form id="form2" class=" form-horizontal" runat="server">

      <div class="container" style="font-family: 'Lucida Sans Unicode'; ">
          <div id="form1" class="">
                  <div class="container-fluid">     
          <div runat="server" class="navbar-form navbar-right">
              <br />
              <br />

          <div  style="font-family: 'Lucida Sans Unicode'; font-weight: bold" align="left">     
          <asp:Button ID="btnMenu" runat="server" class="btn btn-primary btn-lg" Text="Menú"  OnClick="btnMenu_Click"  />
          <asp:Button ID="btnLogout" runat="server" class="btn btn-danger btn-lg" Text="Cerrar Sesión"   OnClick="btnLogout_Click"  />
          </div>
          </div>

          </div> 
                  <center><h2><b>Persona Principal </b></h2></center><br>
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
         <asp:Label runat="server" Text="Nombre:" CssClass="control-label col-sm-2" for="nombre" ></asp:Label>
         <asp:TextBox CssClass="form-control border border-secondary " ID="txtNombre"   runat="server" ViewStateMode="Disabled" Width="211px"   AutoPostBack="True"  ></asp:TextBox>
         </div>

      


       <div class="form-group" style="font-family: 'Lucida Sans Unicode'; " align="left">
       <asp:Label runat="server" Text="Sexo:" CssClass="control-label col-sm-2" for="sexo" ></asp:Label>   
       <asp:DropDownList ID="ddlSexo" CssClass="form-control form-select border border-secondary " runat="server" Width="209px" >  </asp:DropDownList> 
</div>

       <div class="form-group" style="font-family: 'Lucida Sans Unicode'; " align="left">
           <asp:Label runat="server" Text="Estado Civil:" CssClass="control-label col-sm-2" for="estadoCivil" ></asp:Label>
           <asp:DropDownList runat="server" ID="ddlEstadoCivil" CssClass="form-control form-select border border-secondary " Width="209px" ></asp:DropDownList>
           </div>

          &nbsp;<br />
 <div  style="font-family: 'Lucida Sans Unicode'; font-weight: bold">         
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;         
       <asp:Button ID="Button1" class="btn btn-primary"  runat="server" Text="Buscar" onclick="btnBuscar_Click" ViewStateMode="Disabled" Height="42px" Width="95px" />
       &nbsp;&nbsp;
       <asp:Button ID="Button2" class="btn btn-primary"  runat="server" Text="Agregar " onclick="btnAgregar_Click" ViewStateMode="Disabled" Height="42px" Width="95px" />     
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
                <AlternatingRowStyle BackColor="#C7EFEC" />
                <Columns>
                    <asp:BoundField DataField="strClaveUnica" HeaderText="Clave Unica" ReadOnly="True" SortExpression="strClaveUnica" />
                    <asp:BoundField DataField="strNombre" HeaderText="Nombre" ReadOnly="True" SortExpression="strNombre" />
                    <asp:BoundField DataField="strAPaterno" HeaderText="Apellido Paterno" ReadOnly="True" SortExpression="strAPaterno" />
                    <asp:BoundField DataField="strAMaterno" HeaderText="Apellido Materno" ReadOnly="True" SortExpression="strAMaterno" />                
                    <asp:BoundField DataField="strCorreo" HeaderText="E-Mail" ReadOnly="True" SortExpression="strCorreo" />
                    <asp:BoundField DataField="CatEstadoCivil" HeaderText="Edo. Civil" ReadOnly="True" SortExpression="CatEstadoCivil" />
                   <%-- <asp:BoundField DataField="strRFC" HeaderText="RFC" ReadOnly="True" SortExpression="strRFC" />
                    <asp:BoundField DataField="dteFechaNac" HeaderText="Fecha Nacimiento" ReadOnly="True" SortExpression="dteFechaNac" />--%>     
                    <asp:BoundField DataField="CatSexo" HeaderText="Sexo" SortExpression="CatSexo" />
                 
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



        <asp:LinqDataSource ID="DataSourcePersona" runat="server" 
        ContextTypeName="UTTT.Ejemplo.Linq.Data.Entity.DcGeneralDataContext" 
        onselecting="DataSourcePersona_Selecting" 
        Select="new (strNombre, strAPaterno, strAMaterno, CatSexo, strClaveUnica,id,strCorreo, CatEstadoCivil)" 
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
              </div>
    </form>
    </body>
    </html>
