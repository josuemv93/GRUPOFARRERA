<%@ Page Language="C#" AutoEventWireup="true" CodeFile="webExplorerCsolicitud.aspx.cs" Inherits="WebForms_webExplorerCsolicitud"EnableEventValidation="false" MasterPageFile="~/WebForms/MasterPage.master" %>

<asp:Content ID="seccion1" ContentPlaceHolderID="Encabezado" runat="server">
    <div class="title_left" style="font-size: medium">
         Tablero de Control - Solicitudes
     </div>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

     <div class="box box-danger">

    
             <div class="row">
    <div class="col-sm-1"><button id="Button34" runat="server" class="form-control primary" data-target="#AltaR" data-toggle="modal" style="border-color: #C0C0C0; border-style: outset; width: 65px; font-size: small; color: #FFFFFF; background-color: #336699; height: 34px;" type="button" title="Agregar nuevo registro"><span style="color:white" class="fa fa-plus"></span></button> </div>
    
    <div class="col-sm-1" style="font-size: small; top: 0px; left: 0px;"><button id="Button39" runat="server" class="btn btn-success" style="border-color: #C0C0C0; width: 65px; color: #FFFFFF; background-color: #336699; border-style: outset; height: 34px; font-size: small;" type="button" title="Imprimir catálogo"><span style="color:white" class="fa fa-print"></span></button></div>   
       
    </div>
<br /> 
   <div class="row">  
   <fieldset >
    <div class="col-sm-2"><asp:RadioButton ID="RbClave" runat="server" Text="Clave"  GroupName="ax" AutoPostBack="True"/></div>
    <div class="col-sm-2"> <asp:RadioButton ID="RbNombre" runat="server" Text="Nombre"  GroupName="ax" AutoPostBack="True"/></div>
    <div class="col-sm-2"> <asp:RadioButton ID="rbTodos" runat="server" Text="Todos" GroupName="ax" AutoPostBack="True" /></div>
    <div class="col-sm-12"><asp:TextBox ID="txtBusqueda" Style="text-transform: uppercase" runat="server" AutoPostBack="True" placeholder="CONCEPTO DE BÚSQUEDA" CssClass="form-control"></asp:TextBox></div>
</fieldset>
</div>                  
    
    <div>
            <div class="messagealert" id="alert_container">
            </div>            
        </div>
  
    <div class="row">  
      <div class="col-sm-12" style="overflow-x:scroll">
          <asp:GridView ID="GridView1" runat="server" AllowPaging="True" Width="100%" class="table table-striped jambo_table bulk_action" Font-Size="Small" CellSpacing="7" HorizontalAlign="Left" OnRowCreated="GridView1_RowCreated" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EditRowStyle BackColor="#999999" Font-Size="8pt" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="False" ForeColor="White" Font-Size="8pt" BorderStyle="Outset" BorderColor="#CCCCCC"  />

        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="8pt" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="False" ForeColor="#333333" Font-Size="8pt" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        <EmptyDataTemplate>
             <p class="alert alert-warning"> ¡No existen registros que consultar!</p>
                   
                </EmptyDataTemplate>
      
    </asp:GridView>
      </div>
   </div>

                <div id="X_Paginacion" class="x_panel">
						
						<div class="x_content">
							<div class="row">
								  <div class="col-md-1 col-sm-12  form-group"> <asp:LinkButton ID="lbFirst" runat="server" OnClick="lbFirst_Click">Primero</asp:LinkButton></div>
                                  <div class="col-md-1 col-sm-12  form-group"> <asp:LinkButton ID="lbPrevious" runat="server" OnClick="lbPrevious_Click">Anterior</asp:LinkButton></div>
                                  <div class="col-md-2 col-sm-12  form-group"><asp:DataList ID="rptPaging" runat="server"  OnItemCommand="rptPaging_ItemCommand" OnItemDataBound="rptPaging_ItemDataBound" 

					RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbPaging" runat="server"

                                            CommandArgument='<%# Eval("PageIndex") %>' 

						CommandName="newPage"

                                            Text='<%# Eval("PageText") %> ' Width="20px">
						</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:DataList></div>
                                  <div class="col-md-1 col-sm-12  form-group"> <asp:LinkButton ID="lbNext" runat="server" OnClick="lbNext_Click">Siguiente</asp:LinkButton></div>
							     <div class="col-md-1 col-sm-12  form-group"> <asp:LinkButton ID="lbLast" runat="server" 	OnClick="lbLast_Click">Último</asp:LinkButton></div>
                                <div class="col-md-2 col-sm-12  form-group"><asp:Label ID="lblpage" runat="server" Text=""></asp:Label></div>
                            </div>
						</div>
					</div>          
  
      
         </div>


      <!-- POP UP -->
        <div class="modal fade-static"  id="AltaR" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content" >
                                          <asp:UpdatePanel ID="UpdatePanel25" runat="server" UpdateMode="Conditional">
               <ContentTemplate>
                    <header class="w3-container w3-blue"> 
       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       <div class="modal-header">			           
			            <h4 class="modal-title" id="myModalLabel25"><i class='glyphicon glyphicon-plus'></i> Seguimiento a la solicitud </h4>
		            </div>
      </header>
      <div class="w3-container">
                  		                      
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
                   <asp:DropDownList ID="ddlLtipoSolicitud" Enabled="false" class="form-control" runat="server" ToolTip="Selecciona un registro">
                          
                      </asp:DropDownList>
                  </div>
                    <div class="form-group">
                  <label for="exampleInputNombre1">RFC</label>
                        <asp:TextBox class="form-control" id="txtRfca" Enabled="false" style="text-transform:uppercase" runat="server" placeholder="Ingresa el correo corporativo" ></asp:TextBox>
                      </div>
                                     <div class="form-group">
                  <label for="exampleInputNombre1">Correo</label>
                        <asp:TextBox class="form-control" id="txtEmail" Enabled="false" style="text-transform:lowercase" runat="server" placeholder="Ingresa el correo corporativo" ></asp:TextBox>
                                  </div>
                  <div class="form-group">
                  <label for="exampleInputPassword1">Genero</label>
                   <asp:DropDownList ID="txtCSexo" runat="server" CssClass="form-control" Enabled="false" onkeyup="Operacion();" Height="32px" width="50%" TabIndex="2">
                            <asp:ListItem><-- Selecione --></asp:ListItem>
                             <asp:ListItem>HOMBRE</asp:ListItem>
                            <asp:ListItem>MUJER</asp:ListItem>
                        </asp:DropDownList>
                </div>
                 
                  <div class="form-group">
                  <label for="exampleInputNombre1">Fecha de nacimiento</label>
                        <asp:TextBox ID="txtFechaN" TextMode="Date" Enabled="false" class="form-control" onkeyup="Operacion();" runat="server"></asp:TextBox>
                        
                </div>
                
                    <div class="form-group">
                  <label for="exampleInputNombre1">Nombre Completo</label>
                          <asp:TextBox class="form-control" id="txtNombres" Enabled="false" onkeyup="Operacion();"  runat="server" placeholder="Nombre"></asp:TextBox>
                   </div>
                  <div class="form-group">
                  <label for="exampleInputNombre1">CURP</label>
                      <asp:TextBox class="form-control" id="curp_input" Enabled="false" onkeyup="Operacion();" MaxLength="18"  runat="server" placeholder="Nombre"></asp:TextBox>
                    </div>
               
                    
                    <div class="form-group">
                  <label for="exampleInputNombre1">Telefono</label>
                        <asp:TextBox ID="txtTel" Enabled="false" onkeypress="javascript:return solonumeros(event)" MaxLength="10" class="form-control" runat="server"></asp:TextBox>
                        
                  </div>
                    <div class="form-group">
                  <label for="exampleInputNombre1"># Empleado</label>
                        <asp:TextBox class="form-control" Enabled="false" id="txtIDEmpleado" maxlength="10" runat="server" placeholder="Ingresa el numero de empleado" ></asp:TextBox>
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
                   <asp:DropDownList ID="ddlDepartamento" Enabled="false" class="form-control" runat="server"></asp:DropDownList>
                  </div>
                   <div class="form-group">
                  <label for="exampleInputNombre1">Puesto</label>
                  <asp:DropDownList ID="ddlPuesto" Enabled="false" class="form-control" runat="server"></asp:DropDownList>
                  </div>
                  <br />
                   <br />
                   <br />
                   <div class="form-group">
                  <label for="exampleInputNombre1">Sugerencia de Usuario</label>
                  <asp:TextBox class="form-control" Enabled="false" id="txtSUsuario" runat="server" ></asp:TextBox>
                    </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Sugerencia Password</label>
                      <asp:TextBox class="form-control" Enabled="false" id="txtPassSugerencia" runat="server" ></asp:TextBox>
                     </div>
                  <div class="form-group">
                  <label for="exampleInputNombre1">Copiar permisos de</label>
                  <asp:TextBox class="form-control" Enabled="false" id="txtcopiarPerm" runat="server" ></asp:TextBox>
                  </div>
                  <div class="form-group">
                  <label for="exampleInputNombre1">Observaciones</label>
                       <asp:TextBox class="form-control" Enabled="false" id="txtObserva1" style="text-transform:uppercase" runat="server" placeholder="Ingresa las observaciones que requieras a esta solicitud" ></asp:TextBox>

                </div>
                  
                 <div class="form-group">
                  <label for="exampleInputNombre1">¿Desea otorgar accesos a las Apps Farrera?</label>
                     <asp:ListBox ID="ltApps" Enabled="false" class="form-control" runat="server" SelectionMode="Multiple"></asp:ListBox>
                     
                  
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
                <asp:TextBox class="form-control" Enabled="false" id="txtEmail2" style="text-transform:lowercase" runat="server" placeholder="Ingresa el correo personal" ></asp:TextBox>
              </div>

                  <div class="form-group">
                       <label for="exampleInputNombre1">Numero Telefónico (personal):</label>
                   <asp:TextBox class="form-control" Enabled="false" id="txtTel2" style="text-transform:lowercase" runat="server" onkeypress="javascript:return solonumeros(event)" maxlength="10"></asp:TextBox>
              
              </div>
                  
                     
                   <div class="form-group">
                  <label for="exampleInputNombre1">NSS</label>
                 <asp:TextBox class="form-control" Enabled="false" id="txtNSS" MaxLength="10" runat="server" placeholder="Ingresa el numero de empleado" ></asp:TextBox>
                
                </div>
                      <div class="form-group">
                  <label for="exampleInputNombre1">Código postal</label>
                           <asp:TextBox class="form-control" Enabled="false" id="txtCP" placeholder="Ingresa el cp" runat="server" ></asp:TextBox>

                </div>

               <div class="form-group">
                  <label for="exampleInputNombre1">Estado (Entidad Federativa)</label>
                  <asp:TextBox class="form-control" Enabled="false" id="txtEstado" placeholder="Ingresa el cp" runat="server" ></asp:TextBox>
                  </div>
                   <div class="form-group">
                  <label for="exampleInputNombre1">Dirección</label>
                       <asp:TextBox class="form-control" Enabled="false" id="txtDireccion" placeholder="Ingresa el cp" runat="server" ></asp:TextBox>
                   </div>
                  
               
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                  ¿Desea iniciar operacion de la solicitud?
                  <button type="button" id="btnSolicitud" runat="server" onserverclick="btnSolicitud_ServerClick" class="btn btn-primary">Iniciar Solicitud</button>

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
                                    		                         
      </div>
                   </ContentTemplate> 
                          
                       </asp:UpdatePanel>       
      <footer class="w3-container w3-blue">
        <p> </p>
      </footer>
  <div class="modal-footer">
<button id="btLogin" runat="server" class="btn btn-success" data-loading-text="&lt;i class='fa fa-spinner fa-spin '&gt;&lt;/i&gt; Espere un momento..." onserverclick="btLogin_ServerClick" style="width: 180px; border-style: groove; height: 34px; font-size: small; color: #FFFFFF; background-color: #000080;" type="button"> <span class="glyphicon glyphicon-ok"></span> Continuar</button>                   
		                          </div>
                
                         </div>
                     </div>
                    </div>
          <!-- Default box -->

    
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="Pie" runat="server">
</asp:Content>