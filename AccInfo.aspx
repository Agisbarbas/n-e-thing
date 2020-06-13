<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master"  EnableViewState="true"  AutoEventWireup="true" ValidateRequest="false"  CodeBehind="AccInfo.aspx.cs" Inherits="nthing.AccInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="wrapper row3">
  <div id="container">
  
      <figure class="imgl boxholder"><img src="../images/demo/120x120.gif" alt=""/></figure>
        <br />
        <h2>
            <asp:Label ID="usrLabel" runat="server"></asp:Label>  ‏‏‎‎‏‏‎</h2> ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ 
        <p></p>

      
  <div class="two_third first">
    <div id="portfolio">
        <div class="panel panel-default">
            <div class="panel-heading">
                Feedback Rating
                       
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">

                <div class="list-group">

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                        <ContentTemplate>

                            <asp:DataList ID="ReviewsList" runat="server">
                                <ItemTemplate>
                                    <a href="#" class="list-group-item">
                                        <span>Rating <i class="fa fa-star fa-fw" style="color: orangered"></i>(<%# Eval("Rating") %>)</span>
                                        <span>added on <%#Eval("CreatedOn") %></span>
                                        <br />
                                        <div class="alert alert-info"><%#Eval("UserReview") %></div>
                                    </a>

                                </ItemTemplate>
                            </asp:DataList>

                       </ContentTemplate>

                    </asp:UpdatePanel>

                    <asp:SqlDataSource ID="SqlRate" runat="server"
                        ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                        ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>"></asp:SqlDataSource>
                </div>


            </div>
            <!-- /.panel-body -->
        </div>
  
        <div class="panel panel-default">
            <div class="panel-heading">
                Items for Sale
                       
            </div>

            <div class="panel-body">
                <asp:DataList ID="CategoryItems" runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table">
                    <ItemTemplate>
                        <article class="clear push20">

                            <figure class="post-Catimage">
                                <img src="<%#Eval("prodPhoto") %>" alt="">
                            </figure>
                            <header>
                                <h2 class="blog-post-title"><a href="product.aspx?pid=<%#Eval("ProductGuid") %>"><%#Eval("Name") %></a></h2>
                                <div class="blog-post-meta">
                                    <ul>
                                        <li class="blog-post-date">Date created : <%#Eval("CreatedOn", "{0:d}") %> </li>

                                    </ul>
                                </div>
                            </header>
                            <p><%#Eval("ShortDescription") %></p>


                        </article>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                    ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>"></asp:SqlDataSource>


            </div>
        </div>

     </div>
   </div>
   

    <div class="clear"></div>
  </div>
</div>
</asp:Content>
