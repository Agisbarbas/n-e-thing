<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="nthing.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<!-- ################################################################################################ -->

<div class="wrapper row3">
  <div id="container">
     <div class="two_third first">
    <div id="portfolio">
       <div class="panel panel-default">
                        <div class="panel-heading">
                           
                            <i class="fa fa-shopping-cart  fa-fw"></i>  Your Cart 
                        </div>
                        <!-- /.panel-heading -->
                      <div class="panel-body">

                          <div class="list-group">
                             
                              <asp:UpdatePanel ID="UpdatePanel1"  runat="server">
                                   
                                  <ContentTemplate>

                                      <asp:DataList ID="CartItems" runat="server">
                                          <ItemTemplate>
                                              <a href="#" class="list-group-item">
                                                <span><%#Eval("ProductName") %></span> 
                                                   <span>   added on <%#Eval("ModifiedOn") %></span> 
                                                  <span class="pull-right text-muted small"><em>€ <%#Eval("ProductAmount", "{0:N2}") %></em></span>
                                              </a>
                                        
                                          </ItemTemplate>
                                      </asp:DataList>
                                      <asp:SqlDataSource ID="SqlCart" runat="server"
                                          ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                                          ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" 
                                          InsertCommand="INSERT INTO nthing_Store_Order([ProductGui],[UserName],[ProductAmount_F]) VALUES (@guid, @usr, @proamnt)">
                                          <InsertParameters>
                                              <asp:ControlParameter ControlID="prodgui" Name="guid" PropertyName="Value" />
                                              <asp:ControlParameter ControlID="usrname" Name="usr" PropertyName="Value" />
                                              <asp:ControlParameter ControlID="prodAmnt" Name="proamnt" PropertyName="Value" DbType="Int16" />
                                          </InsertParameters>
                                          
                                      </asp:SqlDataSource>
                                       <div style="height: 0px">
                                       <input id="prodgui" type="text" runat="server" value="" style="visibility: hidden" />
                                           <input id="prodId" type="text" runat="server" value="" style="visibility: hidden" />
                                      <input id="usrname" type="text" runat="server" value="" style="visibility: hidden" />
                                      <input id="prodAmnt" type="text" runat="server" style="visibility: hidden" value="0" />
                                   <input id="prodPrice" type="text" runat="server" style="visibility: hidden" value="0" />  
                                              </div>
                                     
                                  </ContentTemplate>
 
                              </asp:UpdatePanel>




                          </div>


                      </div>
                      <!-- /.panel-body -->
                  </div>
    </div>
   </div>
      <div class="one_third">

          <div class="panel panel-default">
              <div class="panel-heading">

                  <i class="fa fa-check-square-o"></i> Procceed to checkout...
                        <a href="#" class="list-group-item">
                                                <span>Checkout with Bank Transfer</span> 
                                                 
                                              </a>
              </div>
              <!-- /.panel-heading -->
              <div class="panel-body">
              </div>

          </div>
      </div>

      <div class="clear"></div>
  </div>
</div>

</asp:Content>
