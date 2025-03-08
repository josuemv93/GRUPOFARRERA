<%@ Page Language="C#" AutoEventWireup="true" CodeFile="webLogin.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html
<html lang="en">
<head>
	  <title> Grupo Farrera | TI </title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
   
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<!--===============================================================================================-->
   <style type="text/css">
       .flotante {
    display:scroll;
        position:fixed;
        bottom:19px;
        right:0px;
       
}

       .login100-form-btn {
  font-family: Poppins-Medium;
  font-size: 16px;
  color: #555555;
  line-height: 1.2;

  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 20px;
  min-width: 120px;
  height: 50px;
  border-radius: 25px;

  background: #9152f8;
  background: -webkit-linear-gradient(bottom, #51a7f8, #51a7f8);
  background: -o-linear-gradient(bottom, #51a7f8, #51a7f8);
  background: -moz-linear-gradient(bottom, #51a7f8, #51a7f8);
  background: linear-gradient(bottom, #51a7f8, #51a7f8);
  position: relative;
  z-index: 1;

  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
}
       .wrap-login100 {
    padding: 10px 15px 37px 15px;
  }
       .sk-circle {
  margin: 100px auto;
  width: 220px;
  height: 220px;
  position: relative;
}
.sk-circle .sk-circle {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  top: 0;
}
.sk-circle .sk-circle:before {
  content: '';
  display: block;
  margin: 0 auto;
  width: 15%;
  height: 15%;
  background-color: #333;
  border-radius: 100%;
  -webkit-animation: sk-circleBounceDelay 1.2s infinite ease-in-out both;
          animation: sk-circleBounceDelay 1.2s infinite ease-in-out both;
}
.sk-circle .sk-circle2 {
  -webkit-transform: rotate(30deg);
      -ms-transform: rotate(30deg);
          transform: rotate(30deg); }
.sk-circle .sk-circle3 {
  -webkit-transform: rotate(60deg);
      -ms-transform: rotate(60deg);
          transform: rotate(60deg); }
.sk-circle .sk-circle4 {
  -webkit-transform: rotate(90deg);
      -ms-transform: rotate(90deg);
          transform: rotate(90deg); }
.sk-circle .sk-circle5 {
  -webkit-transform: rotate(120deg);
      -ms-transform: rotate(120deg);
          transform: rotate(120deg); }
.sk-circle .sk-circle6 {
  -webkit-transform: rotate(150deg);
      -ms-transform: rotate(150deg);
          transform: rotate(150deg); }
.sk-circle .sk-circle7 {
  -webkit-transform: rotate(180deg);
      -ms-transform: rotate(180deg);
          transform: rotate(180deg); }
.sk-circle .sk-circle8 {
  -webkit-transform: rotate(210deg);
      -ms-transform: rotate(210deg);
          transform: rotate(210deg); }
.sk-circle .sk-circle9 {
  -webkit-transform: rotate(240deg);
      -ms-transform: rotate(240deg);
          transform: rotate(240deg); }
.sk-circle .sk-circle10 {
  -webkit-transform: rotate(270deg);
      -ms-transform: rotate(270deg);
          transform: rotate(270deg); }
.sk-circle .sk-circle11 {
  -webkit-transform: rotate(300deg);
      -ms-transform: rotate(300deg);
          transform: rotate(300deg); }
.sk-circle .sk-circle12 {
  -webkit-transform: rotate(330deg);
      -ms-transform: rotate(330deg);
          transform: rotate(330deg); }
.sk-circle .sk-circle2:before {
  -webkit-animation-delay: -1.1s;
          animation-delay: -1.1s; }
.sk-circle .sk-circle3:before {
  -webkit-animation-delay: -1s;
          animation-delay: -1s; }
.sk-circle .sk-circle4:before {
  -webkit-animation-delay: -0.9s;
          animation-delay: -0.9s; }
.sk-circle .sk-circle5:before {
  -webkit-animation-delay: -0.8s;
          animation-delay: -0.8s; }
.sk-circle .sk-circle6:before {
  -webkit-animation-delay: -0.7s;
          animation-delay: -0.7s; }
.sk-circle .sk-circle7:before {
  -webkit-animation-delay: -0.6s;
          animation-delay: -0.6s; }
.sk-circle .sk-circle8:before {
  -webkit-animation-delay: -0.5s;
          animation-delay: -0.5s; }
.sk-circle .sk-circle9:before {
  -webkit-animation-delay: -0.4s;
          animation-delay: -0.4s; }
.sk-circle .sk-circle10:before {
  -webkit-animation-delay: -0.3s;
          animation-delay: -0.3s; }
.sk-circle .sk-circle11:before {
  -webkit-animation-delay: -0.2s;
          animation-delay: -0.2s; }
.sk-circle .sk-circle12:before {
  -webkit-animation-delay: -0.1s;
          animation-delay: -0.1s; }

@-webkit-keyframes sk-circleBounceDelay {
  0%, 80%, 100% {
    -webkit-transform: scale(0);
            transform: scale(0);
  } 40% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}

@keyframes sk-circleBounceDelay {
  0%, 80%, 100% {
    -webkit-transform: scale(0);
            transform: scale(0);
  } 40% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}
        .messagealert {
            width: 100%;
            position:center;
             top:0px;
            z-index: 100000;
            padding: 0;
            font-size: 15px;
        }
        /*css process modal -  processing-modal*/
        .modal-static { 
            position: fixed;
            top: 50% !important; 
            left: 50% !important; 
            margin-top: -100px;  
            margin-left: -150px; 
            overflow: visible !important;
        }
        .modal-static,
        .modal-static .modal-dialog,
        .modal-static .modal-content {
            width: 300px; 
            height: 90px; 
        }
        .modal-static .modal-dialog,
        .modal-static .modal-content {
            padding: 0 !important; 
            margin: 0 !important;
        }
        .modal-static .modal-content .icon {
        }
        .modal-text{
            text-align:center;
            font-family:Cambria;
            font-weight:bold;
            font-size:medium;
        }
   </style>
     <script type="text/javascript">
        function ShowMessage(message, messagetype) {
            var cssclass;
            switch (messagetype) {
                case 'Success':
                    cssclass = 'alert-success'
                    break;
                case 'Error':
                    cssclass = 'alert-danger'
                    break;
                case 'Warning':
                    cssclass = 'alert-warning'
                    break;
                default:
                    cssclass = 'alert-info'
            }
            $('#alert_container').append('<div id="alert_div" style="margin: 0 0.5%; -webkit-box-shadow: 3px 4px 6px #999;" class="alert fade in ' + cssclass + '"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><strong></strong> <span>' + message + '</span></div>');
        }
    </script>

</head>
   
<body oncontextmenu="return false" >
  

  <form id="form2" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  	
    
	<div class="limiter">
		<div class="container-login100" style="background-image: url('/images/secSsa.jpg');">
            
			<div class="wrap-login100">  
                
                <span class="login100-form-title p-b-34 p-t-27">
						GRUPO FARRERA
					</span>
			
					<span class="login100-form-logo">
					<%--	<i class="zmdi zmdi-account zmdi-hc-2x"></i>--%>
                                    
                         <asp:Image ID="Image2" runat="server" class="login100-form-logo"/>
                       <%-- <img src="images/dotnet.svg" class="login100-form-logo" />--%>
					</span>

					<span class="login100-form-title p-b-34 p-t-27">Iniciar Sesión
                        <button id="Button10" runat="server" class="btn btn-facebook btn-lg" title="Nuevo Registro" data-target="#AltaR" data-toggle="modal" type="button">
                            <span class="glyphicon glyphicon-plus" style="left: 0px; top: 0px"></span>
                        </button>

					</span>

					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" type="text" ID="txtUsuario" runat="server" placeholder="Usuario" Style="text-transform: uppercase">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

                <table style="width:100%">
<tr>
    <td>
        <div class="wrap-input100 validate-input" data-validate="Enter password" >
						<input class="input100" type="password" ID="txtContraseña" runat="server" placeholder="Contraseña">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
    </td>
    <td>
         <button id="show_password" class="btn btn-success" type="button" onclick="mostrarPassword()"> <span class="fa fa-eye-slash icon"></span> </button>
    </td>
</tr>
                </table>				

					<div class="container-login100-form-btn">
                    
						<button class="login100-form-btn" ID="Button1" runat="server"  onserverclick="Button1_Click">
							Ingresar
						</button>
                        

                        
					    <asp:TextBox ID="txtRazon" runat="server" Visible="False" Width="16px"></asp:TextBox>
                        <asp:TextBox ID="txtEncriptado" runat="server" Visible="False" Width="16px"></asp:TextBox>
                        <asp:TextBox ID="txtResultado" runat="server" Visible="False" Width="16px"></asp:TextBox>
					</div>		
                <div id="Csw" runat="server" visible="false" >
                  <%--  <a href="Main.aspx">Ir a otro producto. </a>--%>
                  <a href="webVerificadia.aspx">Apertura del día. </a>
                </div>		
			</div>             
		</div>
    
	</div>

        

	 <div class="modal fade" id="processing-modal2" data-backdrop="static" aria-labelledby="myModalLabel" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                Espere por favor.... Estamos verificando procesos.
                <div class="sk-circle">                    
                    <div class="sk-circle1 sk-circle"></div>
                    <div class="sk-circle2 sk-circle"></div>
                    <div class="sk-circle3 sk-circle"></div>
                    <div class="sk-circle4 sk-circle"></div>
                    <div class="sk-circle5 sk-circle"></div>
                    <div class="sk-circle6 sk-circle"></div>
                    <div class="sk-circle7 sk-circle"></div>
                    <div class="sk-circle8 sk-circle"></div>
                    <div class="sk-circle9 sk-circle"></div>
                    <div class="sk-circle10 sk-circle"></div>
                    <div class="sk-circle11 sk-circle"></div>
                    <div class="sk-circle12 sk-circle"></div>
                </div>
            </div>
        </div>

    <div class="modal fade" id="processing-modal1" data-backdrop="static" aria-labelledby="myModalLabel" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="sk-circle">                    
                    <div class="sk-circle1 sk-circle"></div>
                    <div class="sk-circle2 sk-circle"></div>
                    <div class="sk-circle3 sk-circle"></div>
                    <div class="sk-circle4 sk-circle"></div>
                    <div class="sk-circle5 sk-circle"></div>
                    <div class="sk-circle6 sk-circle"></div>
                    <div class="sk-circle7 sk-circle"></div>
                    <div class="sk-circle8 sk-circle"></div>
                    <div class="sk-circle9 sk-circle"></div>
                    <div class="sk-circle10 sk-circle"></div>
                    <div class="sk-circle11 sk-circle"></div>
                    <div class="sk-circle12 sk-circle"></div>
                </div>
            </div>
        </div>	     

       <div class="modal modal-static fade" id="processing-modal3" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="alert alert-danger alert-dismissible">               
                <h4><i class="icon fa fa-ban"></i> Verifique!</h4>
               Usuario y/o Contraseña incorrecta
              </div>
            </div>
        </div>

        <div class="modal modal-static fade" id="processing-modal4" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="alert alert-danger alert-dismissible">               
                <h4><i class="icon fa fa-ban"></i> Verifique!</h4>
               FALTA EJECUTAR APERTURA DEL DÍA
              </div>
            </div>
        </div>

         <!-- POP UP -->
        <div class="modal fade-static"  id="AltaR" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
            <div class="modal-dialog modal-ms" role="document">
                <div class="modal-content" >
                                         
                    <header class="w3-container w3-blue"> 
       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       <div class="modal-header">			           
			            <h3 class="modal-title" id="myModalLabelV1"><i class='glyphicon glyphicon-plus'></i>  Pasar por alto? </h3>
		            </div>
      </header>
     <br />
                            <asp:TextBox ID="txtPassCer" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
      <footer class="w3-container w3-blue">
        <p> </p>
      </footer>
  <div class="modal-footer">
 
      <asp:Button ID="btLogin" runat="server" class="sdw-hover btn btn-material btn-info ripple-cont" style="font-size: small; color: #FFFFFF; background-color: #000080; border-style: hidden; width: 150px" Text="Continuar" data-target="#processing-modal2" data-toggle="modal"  OnClick="btLogin_Click" UseSubmitBehavior="false"  OnClientClick="this.disabled='true'; this.value='Espere por favor....'; "/>                                                    
	    </div>          
        </div>
        </div>
      </div>
      <!-- Default box -->



        <!-- POP UP -->
        <div class="modal fade-static"  id="CambiaContraseña" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
            <div class="modal-dialog modal-ms" role="document">
                <div class="modal-content" >
                                         
                    <header class="w3-container w3-blue"> 
       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       <div class="modal-header">			           
			            <h3 class="modal-title" id="myModalLabelV"><i class='fa fa-edit'></i>  Cambia tu contraseña </h3>
		            </div>
      </header>
      <div class="w3-container">Ingresa tu nueva Contraseña
          <asp:TextBox ID="txtContaseñanueva" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>	                         
      </div>
                      <div class="w3-container">Verifica Contraseña
          <asp:TextBox ID="txtContaseñanueva2" CssClass="form-control" runat="server"></asp:TextBox>	                         
      </div>
      <footer class="w3-container w3-blue">
        <p> </p>
      </footer>
  <div class="modal-footer">
 
      <asp:Button ID="Button2" runat="server" class="sdw-hover btn btn-material btn-info ripple-cont" style="font-size: small; color: #FFFFFF; background-color: #000080; border-style: hidden; width: 150px" Text="Continuar" data-target="#processing-modal2" data-toggle="modal"  OnClick="Button2_Click" UseSubmitBehavior="false"  OnClientClick="this.disabled='true'; this.value='Espere por favor....'; "/>                                                    
	    </div>          
        </div>
        </div>
      </div>
      <!-- Default box -->

    
	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
<!-- WhatsHelp.io widget -->

<!-- /WhatsHelp.io widget -->
   
      <script>
          setTimeout(function () {
              $('#processing-modal2').modal('hide')
          }, 2000);
      </script>
      <script>
          setTimeout(function () {
              $('#processing-modal3').modal('hide')
          }, 2000);
      </script>
      <script>
          setTimeout(function () {
              $('#processing-modal4').modal('hide')
          }, 2000);
      </script>
       <!-- WhatsHelp.io widget -->
      <script>
          window.onload = function () {
              if (typeof history.pushState === "function") {
                  history.pushState("jibberish", null, null);
                  window.onpopstate = function () {
                      history.pushState('newjibberish', null, null);
                      // Handle the back (or forward) buttons here
                      // Will NOT handle refresh, use onbeforeunload for this.
                  };
              }
              else {
                  var ignoreHashChange = true;
                  window.onhashchange = function () {
                      if (!ignoreHashChange) {
                          ignoreHashChange = true;
                          window.location.hash = Math.random();
                          // Detect and redirect change here
                          // Works in older FF and IE9
                          // * it does mess with your hash symbol (anchor?) pound sign
                          // delimiter on the end of the URL
                      }
                      else {
                          ignoreHashChange = false;
                      }
                  };
              }
          }
      </script>

      <script type="text/javascript">
function mostrarPassword(){
    var cambio = document.getElementById("txtContraseña");
 if(cambio.type == "password"){
 cambio.type = "text";
 $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
 }else{
 cambio.type = "password";
 $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
 }
 } 
 
 $(document).ready(function () {
 //CheckBox mostrar contraseña
 $('#ShowPassword').click(function () {
 $('#Password').attr('type', $(this).is(':checked') ? 'text' : 'password');
 });
});
</script>



<!-- /WhatsHelp.io widget -->
 </form>
</body>
</html>