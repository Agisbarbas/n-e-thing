<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="nthing.product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function AddCart() {
            var adCart = document.getElementById('<%=AddToCartrealBtn.ClientID%>');
            adCart.click();
            userRating();
        }
        function userRating() {
            if (confirm("Product added to your cart!\nWould you like to give rating for the seller?")) {
                var modal = document.getElementById("UserRatingModal");
                modal.style.display = "block";
            } else {
                txt = "You pressed Cancel!";
            }
        }

        function addStars(stars) {
          
            var sendStars =document.getElementById('<%=UsrStar.ClientID%>');
            sendStars.value = stars;

        }

        function addRating() {
             var adCart = document.getElementById('<%=AddRateUser.ClientID%>');
            adCart.click();

          

            var modal1 = document.getElementById("UserRatingModal");
            modal1.style.display = "none";
             alert("Thank you for the user rating/review!");
            
        }

        window.addEventListener("click", function (event) {

            var modal1 = document.getElementById("UserRatingModal");
            if (event.target == modal1) {

                modal1.style.display = "none";
            }
           

        });
    </script>
    <style>
        .checked {color: orange;
}
</style>
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
                                                
                                                <td><button type="button" runat="server" id="addcartBtn" onclick="AddCart()"  class="btn btn-default"><i class="fa fa-cart-plus"></i> Add To Cart</button>
                                                   <a href="auction.aspx?pid=<%#Eval("ProductGuid") %>"> <button type="button" class="btn btn-default"><i class="fa fa-gavel"></i> Auction</button></a></td>
                                            </tr>
                                        </table>
                                        <span><i class="fa fa-user-o fa-fw"></i>Seller : <%# Eval("UserName") %> <i class="fa fa-star fa-fw" style="color:orangered"></i>(<%# Eval("UserRating") %>) rev(<%# Eval("UserReviews") %>)</span>
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
                           
                           <a href="Cart.aspx" class="list-group-item"> <i class="fa fa-shopping-cart  fa-fw"></i>  Your Cart </a>
                        </div>
                        <!-- /.panel-heading -->
                      <div class="panel-body">

                          <div class="list-group">
                              
                              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                   
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
                                              <asp:ControlParameter ControlID="prodAmnt" Name="proamnt" PropertyName="Value" DbType="int32" />
                                          </InsertParameters>
                                          
                                      </asp:SqlDataSource>
                                       <div style="height: 0px">
                                           <input id="prodgui" type="text" runat="server" value="" style="visibility: hidden" />
                                           <input id="prodId" type="text" runat="server" value="" style="visibility: hidden" />
                                           <input id="usrname" type="text" runat="server" value="" style="visibility: hidden" />
                                            <input id="Produsrname" type="text" runat="server" value="" style="visibility: hidden" />
                                          
                                           <input id="prodAmnt" type="text" runat="server" style="visibility: hidden" value="0" />
                                           <input id="prodPrice" type="text" runat="server" style="visibility: hidden" value="0" />
                                           <input id="AddToCartrealBtn" runat="server" onserverclick="addcartBtn_ServerClick"  style="visibility: hidden"  type="button" value="button" />
                                           <input id="AddRateUser" runat="server" onserverclick="ReviewBtn_ServerClick"  style="visibility: hidden"  type="button" value="button" />
                              
                                           <input id="UsrStar" type="text" runat="server" style="visibility: hidden" value="0" />
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
                                              <article class="clear push20">
                                                  <div class="imgl">
                                                      <img src="<%#Eval("prodPhoto") %>" alt="" style="width: 80px" /></div>
                                                  <h2 class="font-medium nospace"><a href="product.aspx?pid=<%#Eval("ProductGuid") %>" style="color: #FF7417"><%#Eval("Name") %></a></h2>
                                                   <span class="pull-right text-muted medium"><em>€ <%#Eval("Price", "{0:N2}") %></em></span>
                                              </article>

                                           
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
      <div class="modal-content">
        <div id="UserRatingModal" class="modalsm animate-top">
            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                <ContentTemplate>


                    <div class="panel panel-default">

                        <div class="panel-heading" style="background-color: #d95f09; color: #FFFFFF"><i class="fa fa-info fa-2x"></i>&nbsp;&nbsp;&nbsp;Rate the Seller</div>
                        <div class="panel-body">
                        <h3>Seller rating and a quick review</h3>
                        <ul class="rate-area">
                          <input type="radio" onclick ="addStars(this.value)" id="5-star" name="rating" value="5" /><label for="5-star" title="Amazing">5 stars</label>
                          <input type="radio" onclick ="addStars(this.value)" id="4-star" name="rating" value="4" /><label for="4-star" title="Good">4 stars</label>
                          <input type="radio" onclick ="addStars(this.value)" id="3-star" name="rating" value="3" /><label for="3-star" title="Average">3 stars</label>
                          <input type="radio" onclick ="addStars(this.value)" id="2-star" name="rating" value="2" /><label for="2-star" title="Not Good">2 stars</label>
                          <input type="radio" onclick ="addStars(this.value)" id="1-star" name="rating" value="1" /><label for="1-star" title="Bad">1 star</label>
                        </ul>
                            <hr />
                            <div class="form-group">
                                <label>Write a quick comment</label>
                                <textarea id="reviewTxt" runat="server" class="form-control" rows="3"></textarea>
                                 <button id="ReviewBtn" type="button"  onclick="addRating()" class="btn btn-default">Submit the review...</button>
                            </div>
                       </div>
                    </div>

                </ContentTemplate>

            </asp:UpdatePanel>

        </div>
    </div>

</asp:Content>
