<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="nthing._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper row3">
  <div id="container">
    <!-- ################################################################################################ -->
    <div id="homepage" class="clear">
      <div class="two_third first">
        <section class="main_slider">
          <div class="rslides_container clear">
            <ul class="rslides clear" id="rslides">
              <li><img src="images/demo/slider/Buy now.jpg" alt=""/></li>
              <li><img src="images/demo/slider/Or place the right bid.jpg" alt=""/></li>
              <li><img src="images/demo/slider/From the most reliable seller.jpg" alt=""/></li>
            </ul>
          </div>
        </section>
        <ul class="nospace push50 clear">
          <li class="one_third first">
            <article>
              <div class="push20"><img src="images/demo/Technology.jpg" alt=""/></div>
              <h2 class="font-medium nospace"><a href="Technology.aspx" style="color: #FF7417">Technology</a></h2>
              <p class="nospace">Σε αυτή την κατηγορία εντάσσεται μια μεγάλη ποικιλία από ηλεκτρονικά είδη, όπως κινητά Smartphones, tablets, smart tvs,  laptops, κάμερες, smartwatches, αλλά και πολλά επιπλέον αξεσουάρ τεχνολογίας.</p>
            </article>
          </li>
          <li class="one_third">
            <article>
              <div class="push20"><img src="images/demo/Sports & Hobbies.jpg" alt=""/></div>
              <h2 class="font-medium nospace"><a href="Sports.aspx" style="color: #FF7417">Sports & Hobbies</a></h2>
              <p class="nospace">Αποτελεί όλα τα απαραίτητα εξαρτήματα που χρειάζεται κανείς προκειμένου να μπορεί να συμμετάσχει σε ένα άθλημα, αλλά και όλα εκείνα που μπορούν να χρησιμοποιηθούν στον ελεύθερο χρόνο ως χόμπι.</p>
            </article>
          </li>
          <li class="one_third">
            <article>
              <div class="push20"><img src="images/demo/Fashion.jpg" alt=""/></div>
              <h2 class="font-medium nospace"><a href="Fashion.aspx" style="color: #FF7417">Fashion</a></h2>
              <p class="nospace">Εδώ θα ανακαλύψετε μια τεράστια συλλογή από ρούχα, παπούτσια, τσάντες κοσμήματα και αξεσουάρ για τη γυναίκα, τον άνδρα αλλά και το παιδί.</p>
            </article>
          </li>
        </ul>
        <ul class="nospace push50 clear">
          <li class="one_third first">
            <article>
              <div class="push20"><img src="images/demo/health & Beauty.jpg" alt=""/></div>
              <h2 class="font-medium nospace"><a href="Health.aspx" style="color: #FF7417">Health & Beauty</a></h2>
              <p class="nospace">Μπορείτε να ανακαλύψετε τα πάντα για τον κόσμο της υγείας και ομορφιάς, μέσα από προϊόντα διατροφής, καλλυντικά, αρώματα, βρεφική περιποίηση και αξεσουάρ.</p>
            </article>
          </li>
          <li class="one_third">
            <article>
              <div class="push20"><img src="images/demo/House & Garden.jpg" alt=""/></div>
              <h2 class="font-medium nospace"><a href="House.aspx" style="color: #FF7417">House & Garden</a></h2>
              <p class="nospace">Εδώ θα βρείτε μια τεράστια ποικιλία από οικιακές συσκευές, είδη διακόσμησης χώρου, έπιπλα αλλά και είδη κήπου για διαμόρφωση του εξωτερικού χώρου.</p>
            </article>
          </li>
          <li class="one_third">
            <article>
              <div class="push20"><img src="images/demo/Auto - Moto.jpg" alt=""/></div>
              <h2 class="font-medium nospace"><a href="Auto.aspx" style="color: #FF7417">Auto - Moto</a></h2>
              <p class="nospace">Είναι μια κατηγορία που αποτελείται τόσο από αυτοκίνητα, όσο και μοτοσυκλέτες, αλλά και από οποιοδήποτε αξεσουάρ πρώτης ανάγκης ή και περιποίησης μπορεί να συσχετιστεί με αυτά.</p>
            </article>
          </li>
        </ul>

     
      </div>
      <!-- #### -->
      <div class="one_third">
        <div class="tab-wrapper clear">
          <ul class="tab-nav clear">
            <li><a href="#tab-1" style="color: #FF7417">Latest Items</a></li>
            <li><a href="#tab-2" style="color: #FF7417">User Ratings</a></li>
            
          </ul>
          <div class="tab-container">
            <!-- Tab Content -->
            <div id="tab-1" class="tab-content clear">
                <asp:DataList ID="LatestListedItems" runat="server">
                    <ItemTemplate>
                         <article class="clear push20">
                            <div class="imgl"><img src="<%#Eval("prodPhoto") %>" alt="" style="width: 80px"/></div>
                            <h2 class="font-medium nospace"><a href="product.aspx?pid=<%#Eval("ProductGuid") %>" style="color: #FF7417"><%#Eval("Name") %></a></h2>
                            <p class="nospace"><%#Eval("ShortDescription") %></p>
                          </article>
                     </ItemTemplate>
                </asp:DataList>
           
            </div>
            <!-- ## TAB 2 ## -->
            <div id="tab-2" class="tab-content clear">
              <article class="clear push20">
                <div class="imgl"><img src="images/demo/50x50.gif" alt=""/></div>
               
              </article>
              <article class="clear">
                <h2 class="font-medium nospace"><a href="#" style="color: #FF7417">Headline Text</a></h2>
               
              </article>
            </div>
            
            <!-- / Tab Content -->
          </div>
           <asp:SqlDataSource ID="SqlLatest" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                                                    ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>"></asp:SqlDataSource>
                                        
            
        </div>
        <div class="clear push30"></div>
        <h2 class="nospace font-medium push20">Most Populas Tags</h2>
        <ul class="list tagcloud rnd5 push30">
          <li><a href="#">Iphone</a></li>
          <li><a href="#">Laptop</a></li>
          <li><a href="#">Smartphone</a></li>
          <li><a href="#">vans</a></li>
          <li><a href="#">shoes</a></li>
          <li><a href="#">θηκη</a></li>
          <li><a href="#">football</a></li>
          <li><a href="#">κηπος</a></li>
          <li><a href="#">ρουχα</a></li>
        </ul>
        <div class="divider2"></div>
      
      </div>
    </div>
    <!-- ################################################################################################ -->
    <div class="clear"></div>
  </div>
</div>
</asp:Content>
