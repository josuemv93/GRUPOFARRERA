<%@ Page Language="C#" AutoEventWireup="true" CodeFile="webRegistraUsuario.aspx.cs" Inherits="WebForms_webRegistraUsuario" Debug="true" MasterPageFile="~/WebForms/MasterPage.master" %>


<asp:Content ID="seccion1" ContentPlaceHolderID="Encabezado" runat="server">


    <div class="row">
        <div class="col-md-6">

          <div class="box box-danger">
             <div class="col-md-12">
          <!-- Custom Tabs -->
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_1" data-toggle="tab">Generales</a></li>
              <li><a href="#tab_2" data-toggle="tab">Datos de Usuario</a></li>
                <li><a href="#tab_3" data-toggle="tab">Otros datos</a></li>
             
             
              <li class="pull-right"><a href="#" class="text-muted"><i class="fa fa-gear"></i></a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_1">
                <form role="form" class="col-xs-6" >
              <div class="box-body">
               <div class="form-group">
                  <label for="exampleInputNombre1">Solicitud de usuario</label>
                   <asp:DropDownList ID="ddlLtipoSolicitud" class="form-control" runat="server" ToolTip="Selecciona un registro">
                          
                      </asp:DropDownList>
                  </div>
                    <div class="form-group">
                  <label for="exampleInputNombre1">RFC</label>
                    <input type="text" id="txtRfca"  runat="server" class="form-control" MaxLength="13" style="text-transform: uppercase" enableviewstate="True"/>
                </div>
                   


                  <div class="form-group">
                <button type="button" id="Button1" runat="server" onserverclick="Button1_ServerClick" class="btn btn-primary">Validar!</button>

              </div>
                  <br />
                  
                   <div class="form-group">
                  <label for="exampleInputNombre1">Correo</label>
                        <asp:TextBox class="form-control" id="txtEmail" style="text-transform:lowercase" runat="server" placeholder="Ingresa el correo corporativo" ></asp:TextBox>
                                  </div>
                  <div class="form-group">
                  <label for="exampleInputPassword1">Genero</label>
                   <asp:DropDownList ID="txtCSexo" runat="server" CssClass="form-control" onkeyup="Operacion();" Height="32px" width="50%" TabIndex="2">
                            <asp:ListItem><-- Selecione --></asp:ListItem>
                             <asp:ListItem>HOMBRE</asp:ListItem>
                            <asp:ListItem>MUJER</asp:ListItem>
                        </asp:DropDownList>
                </div>
                 
                  <div class="form-group">
                  <label for="exampleInputNombre1">Fecha de nacimiento</label>
                        <asp:TextBox ID="txtFechaN" TextMode="Date" class="form-control" onkeyup="Operacion();" runat="server"></asp:TextBox>
                        
                </div>
                
                  <div class="form-group">
                  <label for="exampleInputNombre1">Apellido Paterno</label>
                      <asp:TextBox class="form-control" id="txtApaterno" onkeyup="Operacion();"  runat="server" placeholder="Apellido Paterno"></asp:TextBox>
                </div>
                  <div class="form-group">
                  <label for="exampleInputNombre1">Apellido Materno</label>
                      <asp:TextBox class="form-control" id="txtAmaterno" onkeyup="Operacion();"  runat="server" placeholder="Apellido Paterno"></asp:TextBox>
                    </div>
                  <div class="form-group">
                  <label for="exampleInputPassword1">Nombre</label>
                      <asp:TextBox class="form-control" id="txtNombre" onkeyup="Operacion();"  runat="server" placeholder="Nombre"></asp:TextBox>
                   </div>
                    <div class="form-group">
                  <label for="exampleInputNombre1">Nombre Completo</label>
                          <asp:TextBox class="form-control" id="txtNombres" onkeyup="Operacion();"  runat="server" placeholder="Nombre"></asp:TextBox>
                   </div>
                  <div class="form-group">
                  <label for="exampleInputNombre1">CURP</label>
                      <asp:TextBox class="form-control" id="curp_input" onkeyup="Operacion();" MaxLength="18"  runat="server" placeholder="Nombre"></asp:TextBox>
                    </div>
               
                    
                    <div class="form-group">
                  <label for="exampleInputNombre1">Telefono</label>
                        <asp:TextBox ID="txtTel" onkeypress="javascript:return solonumeros(event)" MaxLength="10" class="form-control" runat="server"></asp:TextBox>
                        
                  </div>
                    <div class="form-group">
                  <label for="exampleInputNombre1"># Empleado</label>
                        <asp:TextBox class="form-control" id="txtIDEmpleado" maxlength="10" runat="server" placeholder="Ingresa el numero de empleado" ></asp:TextBox>
                </div>

               
              </div>
              <!-- /.box-body -->

             <%-- <div class="box-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>--%>
            </form>
              </div>

                 

              <!-- /.tab-pane -->
              <div class="tab-pane" id="tab_2">
                <form role="form" class="col-xs-12" >
               <div class="box-body">
               <div class="form-group">
                  <label for="exampleInputNombre1">Departamento</label>
                   <asp:DropDownList ID="ddlDepartamento" class="form-control" runat="server"></asp:DropDownList>
                  </div>
                   <div class="form-group">
                  <label for="exampleInputNombre1">Puesto</label>
                  <asp:DropDownList ID="ddlPuesto" class="form-control" runat="server"></asp:DropDownList>
                  </div>
                  <br />
                   <br />
                   <br />
                   <div class="form-group">
                  <label for="exampleInputNombre1">Sugerencia de Usuario</label>
                  <input type="text" class="form-control" id="txtSUsuario" maxlength="8" runat="server" placeholder="Ingresa una sugerencia de usuario">
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Sugerencia Password</label>
                  <input type="password" class="form-control" maxlength="8" id="txtPassSugerencia" runat="server" placeholder="Password">
                </div>
                  <div class="form-group">
                  <label for="exampleInputNombre1">Copiar permisos de</label>
                  <input type="text" class="form-control" id="txtcopiarPerm" maxlength="60" runat="server" placeholder="Nombre/Usuario de quien copiar permisos">
                </div>
                  <div class="form-group">
                  <label for="exampleInputNombre1">Observaciones</label>
                       <asp:TextBox class="form-control" id="txtObserva1" style="text-transform:uppercase" runat="server" placeholder="Ingresa las observaciones que requieras a esta solicitud" ></asp:TextBox>

                </div>
                  
                 <div class="form-group">
                  <label for="exampleInputNombre1">¿Desea otorgar accesos a las Apps Farrera?</label>
                     <asp:ListBox ID="ltApps" class="form-control" runat="server" SelectionMode="Multiple"></asp:ListBox>
                     
                  
                </div>
              </div>
              <!-- /.box-body -->

             <%-- <div class="box-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>--%>
            </form>
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="tab_3">
                <form role="form" class="col-xs-12" >
              <div class="box-body">
                  <div class="form-group">
                       <label for="exampleInputNombre1">Email personal</label>
                <asp:TextBox class="form-control" id="txtEmail2" style="text-transform:lowercase" runat="server" placeholder="Ingresa el correo personal" ></asp:TextBox>
              </div>

                  <div class="form-group">
                       <label for="exampleInputNombre1">Numero Telefónico (personal):</label>
                   <asp:TextBox class="form-control" id="txtTel2" style="text-transform:lowercase" runat="server" onkeypress="javascript:return solonumeros(event)" maxlength="10"></asp:TextBox>
              
              </div>
                  
                     
                   <div class="form-group">
                  <label for="exampleInputNombre1">NSS</label>
                 <asp:TextBox class="form-control" id="txtNSS" MaxLength="10" runat="server" placeholder="Ingresa el numero de empleado" ></asp:TextBox>
                
                </div>
                      <div class="form-group">
                  <label for="exampleInputNombre1">Código postal</label>
                           <asp:TextBox class="form-control" id="txtCP" placeholder="Ingresa el cp" runat="server" ></asp:TextBox>

                </div>

               <div class="form-group">
                  <label for="exampleInputNombre1">Estado (Entidad Federativa)</label>
                  <asp:TextBox class="form-control" id="txtEstado" placeholder="Ingresa el cp" runat="server" ></asp:TextBox>
                  </div>
                   <div class="form-group">
                  <label for="exampleInputNombre1">Dirección</label>
                       <asp:TextBox class="form-control" id="txtDireccion" placeholder="Ingresa el cp" runat="server" ></asp:TextBox>
                   </div>
                  
               
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                  <button type="button" id="btnSolicitud" runat="server" onserverclick="btnSolicitud_ServerClick" class="btn btn-primary">Generar Solicitud</button>

              </div>
            </form>
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- nav-tabs-custom -->
        </div>
<%--    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmail" ForeColor="Red">Ingresar Email Corporativo</asp:RequiredFieldValidator>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="ddlLtipoSolicitud">Verifica el tipo de solicitud</asp:RequiredFieldValidator>--%>

            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          
          <!-- /.box -->

        </div>
        <!-- /.col (left) -->
                <!-- /.col (right) -->
      </div>
    


    <script>
    function solonumeros(e)
    {
         var key;

         if (window.event) // IE
         {
             key = e.keyCode;
         }
         else if (e.which) // Netscape/Firefox/Opera
         {
             key = e.which;
         }
         if (key < 48 || key > 57) {
             return false;
         }
         return true;
    }
 </script>
 
 <script>
     //Función para validar una CURP
     function curpValida(curp) {
         var re = /^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/,
             validado = curp.match(re);

         if (!validado)  //Coincide con el formato general?
             return false;

         //Validar que coincida el dígito verificador
         function digitoVerificador(curp17) {
             //Fuente https://consultas.curp.gob.mx/CurpSP/
             var diccionario = "0123456789ABCDEFGHIJKLMNÑOPQRSTUVWXYZ",
                 lngSuma = 0.0,
                 lngDigito = 0.0;
             for (var i = 0; i < 17; i++)
                 lngSuma = lngSuma + diccionario.indexOf(curp17.charAt(i)) * (18 - i);
             lngDigito = 10 - lngSuma % 10;
             if (lngDigito == 10) return 0;
             return lngDigito;
         }

         if (validado[2] != digitoVerificador(validado[1]))
             return false;

         return true; //Validado
     }


     //Handler para el evento cuando cambia el input
     //Lleva la CURP a mayúsculas para validarlo
     function validarInput(input) {
         var curp = input.value.toUpperCase(),
             resultado = document.getElementById("resultado"),
             valido = "Incorrecto";

         if (curpValida(curp)) { // ⬅️ Acá se comprueba
             valido = "Correcto";
             resultado.classList.add("ok");
         } else {
             resultado.classList.remove("ok");
         }

         resultado.innerText = "CURP: " + curp + "\nFormato: " + valido;
     }
 </script>

    <script>
        function rfcValido(rfc, aceptarGenerico = true) {
            const re = /^([A-ZÑ&]{3,4}) ?(?:- ?)?(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])) ?(?:- ?)?([A-Z\d]{2})([A\d])$/;
            var validado = rfc.match(re);

            if (!validado)  //Coincide con el formato general del regex?
                return false;

            //Separar el dígito verificador del resto del RFC
            const digitoVerificador = validado.pop(),
                rfcSinDigito = validado.slice(1).join(''),
                len = rfcSinDigito.length,

                //Obtener el digito esperado
                diccionario = "0123456789ABCDEFGHIJKLMN&OPQRSTUVWXYZ Ñ",
                indice = len + 1;
            var suma,
                digitoEsperado;

            if (len == 12) suma = 0
            else suma = 481; //Ajuste para persona moral

            for (var i = 0; i < len; i++)
                suma += diccionario.indexOf(rfcSinDigito.charAt(i)) * (indice - i);
            digitoEsperado = 11 - suma % 11;
            if (digitoEsperado == 11) digitoEsperado = 0;
            else if (digitoEsperado == 10) digitoEsperado = "A";

            //El dígito verificador coincide con el esperado?
            // o es un RFC Genérico (ventas a público general)?
            if ((digitoVerificador != digitoEsperado)
                && (!aceptarGenerico || rfcSinDigito + digitoVerificador != "XAXX010101000"))
                return false;
            else if (!aceptarGenerico && rfcSinDigito + digitoVerificador == "XEXX010101000")
                return false;
            return rfcSinDigito + digitoVerificador;
        }


        //Handler para el evento cuando cambia el input
        // -Lleva la RFC a mayúsculas para validarlo
        // -Elimina los espacios que pueda tener antes o después
        function validarInputRFC(input) {
            var rfc = input.value.trim().toUpperCase(),
                resultado = document.getElementById("resultado2"),
                valido;

            var rfcCorrecto = rfcValido(rfc);   // ⬅️ Acá se comprueba

            if (rfcCorrecto) {
                valido = "Correcto";
                resultado.classList.add("ok");
            } else {
                valido = "Incorrecto"
                resultado.classList.remove("ok");
            }


            resultado2.innerText = "RFC: " + rfc + "\nFormato: " + valido

        }

    </script>

       <script>
           function rfcValido(rfc, aceptarGenerico = true) {
               const re = /^([A-ZÑ&]{3,4}) ?(?:- ?)?(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])) ?(?:- ?)?([A-Z\d]{2})([A\d])$/;
               var validado = rfc.match(re);

               if (!validado)  //Coincide con el formato general del regex?
                   return false;

               //Separar el dígito verificador del resto del RFC
               const digitoVerificador = validado.pop(),
                   rfcSinDigito = validado.slice(1).join(''),
                   len = rfcSinDigito.length,

                   //Obtener el digito esperado
                   diccionario = "0123456789ABCDEFGHIJKLMN&OPQRSTUVWXYZ Ñ",
                   indice = len + 1;
               var suma,
                   digitoEsperado;

               if (len == 12) suma = 0
               else suma = 481; //Ajuste para persona moral

               for (var i = 0; i < len; i++)
                   suma += diccionario.indexOf(rfcSinDigito.charAt(i)) * (indice - i);
               digitoEsperado = 11 - suma % 11;
               if (digitoEsperado == 11) digitoEsperado = 0;
               else if (digitoEsperado == 10) digitoEsperado = "A";

               //El dígito verificador coincide con el esperado?
               // o es un RFC Genérico (ventas a público general)?
               if ((digitoVerificador != digitoEsperado)
                   && (!aceptarGenerico || rfcSinDigito + digitoVerificador != "XAXX010101000"))
                   return false;
               else if (!aceptarGenerico && rfcSinDigito + digitoVerificador == "XEXX010101000")
                   return false;
               return rfcSinDigito + digitoVerificador;
           }


           //Handler para el evento cuando cambia el input
           // -Lleva la RFC a mayúsculas para validarlo
           // -Elimina los espacios que pueda tener antes o después
           function validarInputRFCPf(input) {
               var rfc = input.value.trim().toUpperCase(),
                   resultado = document.getElementById("resultado"),
                   valido;

               var rfcCorrecto = rfcValido(rfc);   // ⬅️ Acá se comprueba

               if (rfcCorrecto) {
                   valido = "Correcto";
                   resultado.classList.add("ok");
               } else {
                   valido = "Incorrecto"
                   resultado.classList.remove("ok");
               }


               resultado.innerText = "RFC: " + rfc + "\nFormato: " + valido

           }

           function validarInputRFCPX(input) {
               var rfc = input.value.trim().toUpperCase(),
                   resultado = document.getElementById("resultado"),
                   valido;

               var rfcCorrecto = rfcValido(rfc);   // ⬅️ Acá se comprueba

               if (rfcCorrecto) {
                   valido = "Correcto";
                   resultado.classList.add("ok");
               } else {
                   valido = "Incorrecto"
                   resultado.classList.remove("ok");
               }


               resultado.innerText = "RFC: " + rfc + "\nFormato: " + valido

           }

       </script>



</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

      <!-- POP UP -->
        <div class="modal fade"  id="R_RP" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
            <div class="modal-dialog modal-ms" role="document">
                <div class="modal-content" >                  
                    <header class="w3-container w3-blue"> 
       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       <div class="modal-header">			           
			          <h4 class="modal-title" id="myModalLabelA"><i class='glyphicon glyphicon-ok'></i> Hemos encontrato resultados con el correo indicado </h4>
		            </div>
      </header>
      <div class="w3-container">
       <div class="form-group">                                		                                      
          <br />  
                                         
                                               
                        
			                    </div>			           		                      
                                  
      </div>
      <footer class="w3-container w3-blue">
        <p> Desea continuar?</p>
      </footer>
  <div class="modal-footer">
			                        <button type="button" class="btn btn-default btn-lg" data-dismiss="modal"> <span class="fa fa-close" style="left: 0px; top: 0px"></span> Cerrar</button>
                                     

		                          </div>
                         </div>
                     </div>
                    </div>      
          <!-- Default box -->
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="Pie" runat="server">
    
</asp:Content>