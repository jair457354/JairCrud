<!DOCTYPE html>
<script runat="server">


</script>

<html>
<head>
    
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <title>Ejemplo</title>
  <style type="text/css">
  
    </style>
</head>

<body>
    <form id="form1" runat="server">
    <h3>EJEMPLO</h3>


        <div>
            <asp:LinkButton ID="GenerateKeyCommand" runat="server" OnClick="LinkButton1_Click">GENERAR KEY</asp:LinkButton>
            <br />
            STEP 1: GENERATE ENCRIPTION KEY<br />
            <textarea id="PublicKeyText" name="S1" rows="2"></textarea>
            <asp:TextBox ID="PublicKeyText1" runat="server"></asp:TextBox>
            <br />
        </div>
        <div>
            STEP 2: CLEAR TEXT DATA<br />
            <textarea id="TextArea2" cols="20" name="S2" rows="2"></textarea><br />
        </div>
        <div>
            STEP 3:&nbsp; ENCRYPTED DATA<br />
            <textarea id="TextArea3" cols="20" name="S3" rows="2"></textarea><br />
        </div>
        <div>
            <asp:LinkButton ID="LinkButton2" runat="server">ENCRYPT</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton3" runat="server">DECRYPT</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton4" runat="server">CLEAR</asp:LinkButton>
        </div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </form>


</body>
</html>

