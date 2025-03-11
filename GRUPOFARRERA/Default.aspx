<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>

    
</head>
<body>
    <form id="form1" runat="server">
        <asp:ListBox runat="server" ID="lstBoxTest" SelectionMode="Multiple">
           
        </asp:ListBox>
     <asp:Button Text="Submit Students" CssClass="btn btn-default btn-success" runat="server" OnClick="btnGetSelectedValues_Click" />
      
        
    </form>
     <script type="text/javascript">
         $(function () {
             $('[id*=lstBoxTest]').multiselect
                 ({
                     includeSelectAllOption: true,
                     nonSelectedText: 'Select Students' // Here you can change with your desired text as per your requirement.
                 });
         });
     </script>
</body>
</html>
