<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master"  EnableViewState="true"  AutoEventWireup="true" ValidateRequest="false" CodeBehind="auction.aspx.cs" Inherits="nthing.auction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
             var x = setInterval(function () {
             var enddated = document.getElementById('<%=HidendDateLab.ClientID%>');
             var countDownDate = new Date( Date.parse(enddated.value)).getTime();
             var now = new Date().getTime();
             var distance = countDownDate - now;

             
       var days = Math.floor(distance / (1000 * 60 * 60 * 24));
       var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
       var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
       var seconds = Math.floor((distance % (1000 * 60)) / 1000);
       document.getElementById("timetoend").innerHTML = "Auction ends in : " + days + "d " + hours + "h "
       + minutes + "m " + seconds + "s ";

       if (distance < 0) {
           clearInterval(x);
           document.getElementById("timetoend").innerHTML = "EXPIRED";
       }

       if (document.getElementById("timetoend").innerHTML == "EXPIRED") {

                   
           if (document.getElementById(<%=hgstBider.ClientID%>).value == document.getElementById('<%=LogName.ClientID%>').value) {
                alert("You are the highest bidder");
           } else {
               alert("Sorry but you are not the highest bidder. Better luck next time!");
           }
           
       }

   }, 1000);



     </script>
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
                                        </table>
                                    </td>

                                </tr>
                            </table>
                           <span>Auction ends at : </span>
                            <asp:Label ID="endDateLab" runat="server" Text='<%# Eval("AuctEndTime") %>' ClientIDMode="Static"></asp:Label>
                                </ItemTemplate>

                    </asp:FormView>

                    <asp:HiddenField ID="HidendDateLab" runat="server" Value='' />       
                    
                 
                                    
                    <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                        ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>"></asp:SqlDataSource>
                    <div class="col-xs-6">
                        <table>
                            <tr>
                                <td>
                                     <div class="form-group input-group">
                                             <input type="text"  runat="server" id="bidtxt" placeholder="Place your Bid" class="form-control" />
                                            <span class="input-group-btn">
                                                <button id="BidBtn" runat="server" onserverclick="btnInsert_Click"   class="btn btn-info btn-circle" type="button"><i class="fa fa-check"></i>
                                                </button>
                                            </span>
                                        </div>
                            
                                    <asp:Label ID="MessLabel" runat="server" Text="" ForeColor="#CC0000" Font-Size="10"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
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

                                      <asp:DataList ID="AuctionList" DataSourceID="SqlAuction" runat="server" DataKeyField="id" DataMember="DefaultView">
                                          <ItemTemplate>
                                              <a href="#" class="list-group-item">
                                                  <i class="fa fa-user-o fa-fw"></i><%#Eval("bid", "{0:N2}") %>
                                                   <asp:Label ID="listmess" runat="server" Text="Label"></asp:Label>
                                                  <span class="pull-right text-muted small"><em><%#Eval("bidTime") %></em></span>
                                              </a>
                                        <input id="BidUser" type="text" runat="server" style="visibility: hidden" value='<%#Eval("usrid") %>' />
                                          </ItemTemplate>
                                      </asp:DataList>
                                      <asp:SqlDataSource ID="SqlAuction" runat="server"
                                          SelectCommand="SELECT * FROM [dbo].[nthing_Auction_Trans] where productGuid = @apid order by bidTime desc"
                                          ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                                          ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" InsertCommand="INSERT INTO nthing_Auction_Trans(productGuid, usrid, bidF) VALUES (@guid, @usr, @bid)">
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
