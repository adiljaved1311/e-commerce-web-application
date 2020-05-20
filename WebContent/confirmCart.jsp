<%@page import='java.util.*' %>
<%
	java.util.HashMap userDetails = (java.util.HashMap) session.getAttribute("userDetails");
	if (userDetails != null) {
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SkyFoot</title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/custom.css" rel="stylesheet" />
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />
</head>

<body data-spy="scroll" data-target="#my-navbar">
  <nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
				<a href="home.jsp" class="navbar-brand">SkyFoot</a>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
  					<li><a href="home.jsp"><span class="navfont">Home</span></a></li>
  					<li><a href="items.jsp"><span class="navfont">Shop</span></a></li>

  					<li><a href="Logout"><span class="navfont">Logout</span></a></li>
  					<li><a href="profile.jsp"><span class="navfont">MyAccount</span></a></li>
  					<li><span class="navfont">Welcome: <%=userDetails.get("name")%></span></li>
  					<%
  						db.DbConnect db=new db.DbConnect();
  						int count=db.cartCount((String)userDetails.get("email"));
  					%>
            		<li><a href="cart.jsp" class="navfont"><span class="navfont">Cart [<b> <%=count %> </b> ]</span> <i class="fa fa-shopping-cart navfont" aria-hidden="true"></i></a></li>
  					
  					
          </ul>
  			</div>
    </div>
	</nav><!--end navbar-->
        <div class="container" style="padding-top:50px">
<br><br>
<% 
	  String m=(String)session.getAttribute("msg");
	  if(m!=null){
	%>
		<!-- 
		<script>
			alert(" <%=m%> ");
		</script>
		-->
		<div class="panel">
            <div class="panel-body bg-primary text-center">
                <%=m%>
            </div>
        </div>
	<%		  
		  session.setAttribute("msg",null);
	  }
  %>
			<div class="row">
				<div class="col-sm-7">
					<div class="panel panel-success">
					<div class="panel-heading">
					<h1 style="text-align:center">Confirm Your Order</h1>
					</div>
					<div class="panel-body">
					<div class="row">
						<div class="col-sm-8">
							<h5>Item Name</b></h5>
						</div>
						<div class="col-sm-4">
							<h5><b>Price</b></h5>
						</div>
					</div>
					<%
					String e=(String)userDetails.get("email");
				HashMap itemIdsNames=db.getCart(e);
					double total=0;
					int x=0;
					Iterator i=itemIdsNames.entrySet().iterator();
					while(i.hasNext()){
						Map.Entry entry=(Map.Entry)i.next();
						String itemName=(String)entry.getValue();
						HashMap iDetail=db.getItemByName(itemName);
						if(iDetail==null){
				%>
					<div class="row"
						style="border-bottom: 1px solid #DDD; border-top: 1px solid #DDD;">
						<div class="col-sm-4">
						</div>
						<div class="col-sm-8">
							<%= itemName %> is OUT OF STOCK.
						</div>
					</div>
				<%			
							continue;
						}
						double price=(double)iDetail.get("price");
						total+=price;
						x++;
				%>
					<div class="row" style="border-bottom:1px solid #DDD;border-top:1px solid #DDD;">
						<div class="col-sm-8">
							<p><%= itemName%></p>
						</div>

						<div class="col-sm-4">
							<span class="price"><i class="fa fa-inr"></i>&nbsp;<%= price%>/-</span>
						</div>

					</div>
					<%
					}
					double shippingCharge=40;
					double gst=(total+shippingCharge)*0.18;
					double netAmount=total+gst+shippingCharge;
					
					%>
					<br>
					<div class="row">
							
						<div class="col-sm-4">
							<div class="form-group">
								<a class="btn btn-danger" href="cart.jsp">Edit Order</a>
							</div>
						</div>
						<div class="col-sm-1"></div>
						<div class="col-sm-7">
							<div class="row">
							<div class="row">
								<label for="total" class="col-lg-7 ">Total(<%=x %> item): </label>
								<label id="total" class="col-lg-5 "><span class="price"><i class="fa fa-inr"></i><%=total %>/-</span></label>
							</div>
							<div class="row">
								<label for="gst" class="col-lg-7 ">GST (18% tax): </label>
								<label id="gst" class="col-lg-5 "><span class="price"><i class="fa fa-inr"></i><%=gst %>/-</span></label>
							</div>
							<div class="row">
								<label for="shippingcharges" class="col-lg-7 ">Shipping Charges: </label>
								<label id="shippingcharges" class="col-lg-5 "><span class="price"><i class="fa fa-inr"></i><%= shippingCharge %>/-</span></label>
							</div>
							<hr>
							<div class="row">
								<label for="shippingcharges" class="col-lg-7 ">Net Payable Amount: </label>
								<label id="shippingcharges" class="col-lg-5"><span class="price"><i class="fa fa-inr"></i><%= netAmount %>/-</span></label>
							</div>
							</div>
						</div>
						</div>
						</div>
					</div>
				</div>
				<div class="col-sm-5">
					<form action='PlaceOrder' method='post'>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 style="text-align:center">Select Address</h3>
						</div>
						<div class="panel-body">
								<%
								HashMap addresses=db.getAddress(e);

								db.dbDisconnect();
								i=addresses.entrySet().iterator();
								while(i.hasNext()){
									Map.Entry entry=(Map.Entry)i.next();
									int addressId=(Integer)entry.getKey();
									String address=(String)entry.getValue();
								%>
								<div class="row">
									<div class="col-sm-9">
									<input type="radio" name="address" value="<%= address%>">
									<%= address%>
									</div>
									<div class="col-sm-3" style="text-align:right;">
									<a href="RemoveAddress?addressId=<%=addressId%>"><span style="color:red">remove</a>
									</div>
								</div>
								<hr>
								<%} %>
								<div class="form-group">
									<div class="col-lg-9 col-lg-offset-3">
										<a class="btn btn-warning" data-toggle="modal" data-target="#addAddress" >Add New Address</a>
									</div>
								</div>

						</div>
						<div class="panel-footer">
							<input type="radio" name="paymentMode" value="cod" checked>COD
							<input type="radio" name="paymentMode" value="paynow">PayNow <br><br>
							<input type="submit" value='Confirm & Proceed To Pay' class="btn btn-success"/>
						</div>
					</div>
					</form>
			</div>
			</div>
		</div>
     <hr>
     <!--footer-->
     <div class="navbar navbar-inverse navbar-fixed-bottom">
      <div class="container">
        <div class="navbar-text pull-left">
          <p>Design and Develop by INCAPP</p>
        </div>
      </div>
     </div>
     <!-- Modal Add New Address -->
	<div class="modal fade" id="addAddress" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4> Add New Address</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form action="AddAddress" method='post' data-toggle="validator"  role="form" class="form-horizontal">
                  <div class="form-group">
              <div class="col-lg-12">
                    <textarea name="address" class="form-control" row='3' ></textarea>
              </div>
            </div>
            <input type="submit" value='Submit' class="btn btn-success btn-block"/> 
          </form>
        </div>
      </div>
    </div>
  </div>
     <script type="text/javascript" src="js/jquery-2.2.2.min.js" ></script>
       <script type="text/javascript" src="js/bootstrap.min.js" ></script>
     <script type="text/javascript" src="js/script.js" ></script>
     <script type="text/javascript" src="js/validator.js" ></script>

     </body>
     </html>
<%
	} else {
		session.setAttribute("msg", "Plz Login First!");
		response.sendRedirect("home.jsp");
	}
%>
     