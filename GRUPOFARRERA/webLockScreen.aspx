<%@ Page Language="C#" AutoEventWireup="true" CodeFile="webLockScreen.aspx.cs" Inherits="webLockScreen" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>ArKaSis.NET | Lockscreen</title>
 <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="../../bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../../bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <style type="text/css">
        #form1 {
            height: 117px;
        }
        .auto-style1 {
            position: relative;
            display: table;
            border-collapse: separate;
            top: -4px;
            left: 54px;
            width: 225px;
            height: 53px;
        }
        .auto-style2 {
            border-radius: 4px;
            position: relative;
            width: 251px;
            top: -6px;
            left: 26px;
            height: 50px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 10px;
            margin-bottom: 30px;
            padding: 0;
            background: #fff;
        }
        .auto-style3 {
            text-align: center;
            color: #3c8dbc;
        }
    </style>
</head>
<body class="hold-transition lockscreen" oncontextmenu="return false">
<!-- Automatic element centering -->
<div class="lockscreen-wrapper">
  <div class="lockscreen-logo">
    <a href="#"><b>
        <asp:Label ID="lblNombreCE" runat="server" Text=""></asp:Label> </b> </a>
  </div>
  <!-- User name -->
  <div class="lockscreen-name">
    <asp:Label ID="lblUsuario" runat="server"></asp:Label></div>

  <!-- START LOCK SCREEN ITEM -->
  <div class="auto-style2">
    <!-- lockscreen image -->
    <div class="lockscreen-image">
        <asp:Image ID="Image1" runat="server" alt="User Image"/>
        <%--<img id="Image5" runat="server" alt="User Image" />--%>
    <%--  <img src="../../dist/img/user1-128x128.jpg" alt="User Image">--%>
    </div>
    <!-- /.lockscreen-image -->

    <!-- lockscreen credentials (contains the form) -->
      <form id="form1" runat="server">
      <div class="auto-style1">
          <br />
&nbsp;<asp:TextBox ID="txtContraseña" CssClass =" btn btn-success"  placeholder="CONTRASEÑA"  runat="server" Width="187px" TextMode="Password" AutoPostBack="True" OnTextChanged="txtContraseña_TextChanged" Visible="False"></asp:TextBox>
          </div>
      </form>
    <!-- /.lockscreen credentials -->

  </div>
  <!-- /.lockscreen-item -->
  <div class="help-block text-center">
      <br />
  </div>
  <div class="auto-style3" style="font-size: 20px">
      <a href="../webLogin.aspx"> Sesion Finalizada     Ingresar Nuevamente</a></div>
  <div class="lockscreen-footer text-center">
   <strong>Copyright © 2006-2025 - SECSA -.</strong> Derechos Reservados
  </div>
</div>
<!-- /.center -->

<!-- jQuery 3 -->
<script src="../../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- PACE -->
<script src="../../bower_components/PACE/pace.min.js"></script>
<!-- SlimScroll -->
<script src="../../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../../bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
<!-- page script -->
<script type="text/javascript"></script>

       
</body>
</html>