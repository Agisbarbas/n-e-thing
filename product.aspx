<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="nthing.product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper row3">
        <div id="container">
            <div class="two_third first">
                <div id="portfolio">
                    <ul class="clear">
                    </ul>
                    <asp:FormView ID="ProductView" runat="server">
                        <ItemTemplate>

                            <table>
                                <tr>
                                    <td>
                                        <asp:Image ID="EmployeeImage"
                                            ImageUrl='<%# Eval("prodPhoto") %>'
                                            AlternateText='<%# Eval("Name") %>'
                                            runat="server" />
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <h3><%# Eval("Name") %></h3>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <h3>Price € <%# Eval("Price","{0:N2}") %></h3>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <%# Eval("ShortDescription") %>    
                                                </td>
                                            </tr>

                                            <tr>
                                                
                                                <td><button type="button" runat="server" id="addcartBtn" onserverclick="addcartBtn_ServerClick" class="btn btn-default"><i class="fa fa-cart-plus"></i> Add To Cart</button>
                                                       
                                                    <a href="auction.aspx?pid=<%#Eval("ProductGuid") %>" <button type="button" class="btn btn-default">Auction</button></a></td>
                                            </tr>
                                        </table>
                                </tr>


                            </table>

                        </ItemTemplate>



                    </asp:FormView>
                     <asp:Label ID="MessLabel" runat="server" Text="" ForeColor="#CC0000" Font-Size="14"></asp:Label>
                    <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                        ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>"></asp:SqlDataSource>
                  

                    <div class="clear"></div>
                </div>
            </div>
            <div class="one_third">

     <div class="panel panel-default">
                        <div class="panel-heading">
                           
                            <i class="fa fa-shopping-cart  fa-fw"></i>  Your Cart 
                        </div>
                        <!-- /.panel-heading -->
                      <div class="panel-body">

                          <div class="list-group">
                               <asp:Timer ID="UpdateTimer" runat="server" Interval="2000" OnTick="UpdateTimer_Tick" />
                              <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="UpdateTimer" EventName="Tick" />
                                    </Triggers>
                                  <ContentTemplate>

                                      <asp:DataList ID="CartItems" runat="server">
                                          <ItemTemplate>
                                              <a href="#" class="list-group-item">
                                                <span><%#Eval("ProductName") %></span> 
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
 <div class="panel panel-default">
                        <div class="panel-heading">
                           
                            Check also our related products... 
                        </div>
                        <!-- /.panel-heading -->
                      <div class="panel-body">

                          <div class="list-group">
                              
                              <asp:UpdatePanel ID="UpdatePanel2"  runat="server">
                                   
                                  <ContentTemplate>

                                      <asp:DataList ID="RelatedList" runat="server">
                                          <ItemTemplate>
                                             <a href="product.aspx?pid=<%#Eval("ProductGuid") %>" class="list-group-item">
                                                <span><%#Eval("Name") %></span> 
                                                  <span class="pull-right text-muted small"><em>€ <%#Eval("Price", "{0:N2}") %></em></span>
                                              </a>
                                          </ItemTemplate>
                                      </asp:DataList>
                                      <asp:SqlDataSource ID="SqlRelated" runat="server"
                                          ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                                          ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>">
                                         
                                      </asp:SqlDataSource>
                                       <div style="height: 0px">
                                       
                                              </div>
                                     
                                  </ContentTemplate>
 
                              </asp:UpdatePanel>




                          </div>


                      </div>
                      <!-- /.panel-body -->
                  </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>


</asp:Content>
