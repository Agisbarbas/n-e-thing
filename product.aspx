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
                                                    <%# Eval("ShortDescription") %>    
                                                </td>
                                            </tr>

                                            <tr>
                                                
                                                <td><button type="button" class="btn btn-default">Add To Cart</button>
                                                       
                                                    <a href="auction.aspx?pid=<%#Eval("ProductGuid") %>" <button type="button" class="btn btn-default">Auction</button></a></td>
                                            </tr>
                                        </table>
                                </tr>


                            </table>

                        </ItemTemplate>



                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                        ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>"></asp:SqlDataSource>
                  

                    <div class="clear"></div>
                </div>
            </div>
            <div class="one_third">

     <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-gavel  fa-fw"></i> Auction Panel <p id="timetoend" style="font-size: 16px; color: #FF0000; font-family: Verdana;"></p>
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

                                      <asp:DataList ID="CartItems" DataSourceID="SqlAuction" runat="server" DataKeyField="id" DataMember="DefaultView">
                                          <ItemTemplate>
                                              <a href="#" class="list-group-item">
                                                  <i class="fa fa-user-o fa-fw"></i><%#Eval("bid", "{0:N2}") %>
                                                   <asp:Label ID="listmess" runat="server" Text="Label"></asp:Label>
                                                  <span class="pull-right text-muted small"><em><%#Eval("bidTime") %></em></span>
                                              </a>
                                        <input id="BidUser" type="text" runat="server" style="visibility: hidden" value='<%#Eval("usrid") %>' />
                                          </ItemTemplate>
                                      </asp:DataList>
                                      <asp:SqlDataSource ID="SqlCart" runat="server"
                                          SelectCommand="SELECT * FROM [dbo].[nthing_Store_Order] where UserName = @apid order by bidTime desc"
                                          ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                                          ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" 
                                          InsertCommand="INSERT INTO nthing_Auction_Trans(productGuid, usrid, bidF) VALUES (@guid, @usr, @bid)">
                                          <InsertParameters>
                                              <asp:ControlParameter ControlID="prodgui" Name="guid" PropertyName="Value" />
                                              <asp:ControlParameter ControlID="usrgui" Name="usr" PropertyName="Value" />
                                              <asp:ControlParameter ControlID="bidbid" Name="bid" PropertyName="Value" DbType="Int16" />
                                          </InsertParameters>
                                          <SelectParameters>
                                              <asp:QueryStringParameter Name="apid" QueryStringField="pid" />
                                          </SelectParameters>
                                      </asp:SqlDataSource>
                                       <div style="height: 0px">
                                       <input id="prodgui" type="text" runat="server" value="" style="visibility: hidden" />
                                      <input id="usrgui" type="text" runat="server" value="" style="visibility: hidden" />
                                      <input id="bidbid" type="text" runat="server" style="visibility: hidden" value="0" />
                                      <input id="hgstBid" type="text" runat="server" style="visibility: hidden" value="0" />
                                     <input id="hgstBider" type="text" runat="server" style="visibility: hidden" value="0" />
                                     <input id="LogName" type="text"  runat="server" style="visibility: hidden"  value="" />
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
