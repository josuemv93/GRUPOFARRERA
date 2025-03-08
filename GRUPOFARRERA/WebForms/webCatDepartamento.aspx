<%@ Page Language="C#" AutoEventWireup="true" CodeFile="webCatDepartamento.aspx.cs" Inherits="WebForms_webCatDepartamento"EnableEventValidation="false" MasterPageFile="~/WebForms/MasterPage.master" %>

<asp:Content ID="seccion1" ContentPlaceHolderID="Encabezado" runat="server">
     Catálogo de Departamentos
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div class="row">  
      <div class="col-sm-12" style="overflow-x:scroll">
          <asp:GridView ID="GridView1" runat="server" AllowPaging="True" Width="100%" class="table table-striped jambo_table bulk_action" OnDataBound="GridView1_DataBound1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" Font-Size="Small" OnRowDataBound="GridView1_RowDataBound" CellSpacing="7" HorizontalAlign="Left">
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
</asp:Content>




<asp:Content ID="Content3" ContentPlaceHolderID="Pie" runat="server">
</asp:Content>