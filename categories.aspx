<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="categories.aspx.cs" Inherits="nthing.categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- content -->
<div class="wrapper row3">
     <h2 class="blog-post-title"><asp:Label ID="catLabel" runat="server" Text="Label"></asp:Label></h2>
  <div id="container">
    <!-- ################################################################################################ -->
   
        
      
       <div id="portfolio">
           <asp:DataList ID="CategoryItems" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Table">
               <ItemTemplate>
                   <article class="clear push20">
                    
                       <figure class="post-Catimage">
                           <img src="<%#Eval("prodPhoto") %>" alt=""></figure>
                       <header>
                           <h2 class="blog-post-title"><a href="product.aspx?pid=<%#Eval("ProductGuid") %>"><%#Eval("Name") %></a></h2>
                           <div class="blog-post-meta">
                               <ul>
                                   <li class="blog-post-date">Date created : <%#Eval("CreatedOn", "{0:d}") %> </li>
                                   <li class="blog-post-cats"><a href="#">By user : <%#Eval("UserName") %></a>, <a href="#"><%# Eval("Ptype") %></a></li>
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
    <!-- ################################################################################################ -->
    <div class="clear"></div>
  </div>
</div>
</asp:Content>
