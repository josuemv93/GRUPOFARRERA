<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmAccesosSuc.aspx.cs" Inherits="WebForms_frmAccesosSuc2" EnableEventValidation="false" MasterPageFile="~/WebForms/MasterPage.master" %>

<asp:Content ID="seccion1" ContentPlaceHolderID="Encabezado" runat="server">
   
     <br />
                  
                    <asp:Label ID="lblHora" runat="server" Text=""></asp:Label>                   
    
     <div>
            <div class="messagealert" id="alert_container">
            </div>            
        </div>

   
</asp:Content>

<asp:Content ID="session2" runat="server" ContentPlaceHolderID="Body" >
           <!-- POP UP -->
        <div class="modal fade"  id="Loggear" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >            
            <div class="modal-dialog modal-ms" role="document">
                <div class="modal-content" >

                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
               <ContentTemplate>

                    <header class="w3-container w3-blue"> 
   
       <div class="modal-header">			           
			            <h3 class="modal-title" id="myModalLabelV"><i class='glyphicon glyphicon-log-in'></i> HOLA  <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label>
           <asp:Label ID="lblUsuario" runat="server" Text="Label"></asp:Label> </h3>
		            </div>
      </header>
      <div class="w3-container">
       <div class="form-group">  
           <br />
                                         
<table style="width:100%">
    
    <tr>
        <td style="text-align:right">
            Selecciona la sucursal a ingresar: 
        </td>
        <td>
            <asp:DropDownList ID="DropDownList1" CssClass="form-control"  runat="server"  ForeColor="Black" Style="text-transform: uppercase; top: 0px; left: 0px; display:inline;border:1px Solid Red;">
              </asp:DropDownList>
        </td>
    </tr>
     <tr>
        <td style="text-align:right">
           Que vamos a realizar?: 
        </td>
        <td>
            <asp:DropDownList ID="DropDownList2" CssClass="form-control"  runat="server"  ForeColor="Black" Style="text-transform: uppercase; top: 0px; left: 0px; display:inline;border:1px Solid Red;">
              </asp:DropDownList>
        </td>
    </tr>

</table>
   <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
			                      </div></ContentTemplate> </asp:UpdatePanel>                  
		                         
      </div>
      <footer class="w3-container w3-blue">
        <p> </p>
      </footer>
  <div class="modal-footer">
       <button id="Button36" runat="server" class="btn btn-success" data-loading-text="&lt;i class='fa fa-spinner fa-spin '&gt;&lt;/i&gt; Espere un momento..." onserverclick="btnIngresar_Click" style="width: 180px; border-style: groove; height: 34px; font-size: small; color: #FFFFFF; background-color: #000080;" type="button"> <span class="glyphicon glyphicon-ok"></span> Continuar</button>
 </div>
                         </div>
                     </div>
                    </div>
</asp:Content>
