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
	<div class="container" style="padding-top: 50px">
		<h1 style="text-align: left">Shopping Cart</h1>
		<%
		if(count!=0){
		%>
		<div class="row">
			<div class="col-sm-7">
				<div class="row">
					<div class="col-sm-8">Item</div>
					<div class="col-sm-2">
						<h5>Price</h5>
					</div>
					<div class="col-sm-2"></div>
				</div>

				<%
					String e=(String)userDetails.get("email");
				HashMap itemIdsNames=db.getCart(e);
					double total=0;
					int x=0;
					Iterator i=itemIdsNames.entrySet().iterator();
					while(i.hasNext()){
						Map.Entry entry=(Map.Entry)i.next();
						int cartId=(Integer)entry.getKey();
						String itemName=(String)entry.getValue();
						HashMap iDetail=db.getItemByName(itemName);
						if(iDetail==null){
				%>
					<div class="row"
						style="border-bottom: 1px solid #DDD; border-top: 1px solid #DDD;">
						<div class="col-sm-4">
						</div>
						<div class="col-sm-6">
							<%= itemName %> is OUT OF STOCK.
						</div>
						<div class="col-sm-2">
							<a class='text-danger' href='DeleteItemCart?cartId=<%= cartId %>'><i
								class="fa fa-window-close"></i> Delete</a>
						</div>
					</div>
				<%			
							continue;
						}
						double price=(double)iDetail.get("price");
						total+=price;
						x++;
				%>
				<div class="row"
					style="border-bottom: 1px solid #DDD; border-top: 1px solid #DDD;">
					<div class="col-sm-8">
						<img src="GetItemPhoto?name=<%=itemName%>&img=img1" alt="No Photo" height='60' width='60'> <%= itemName %>
					</div>
					<div class="col-sm-2">
						<p class="price">
							<i class="fa fa-inr"></i><%= price %>/-
						</P>
					</div>
					<div class="col-sm-2">
						<a class='text-danger' href='DeleteItemCart?cartId=<%= cartId %>'><i
							class="fa fa-window-close"></i> Delete</a>
					</div>
				</div>
				<%}
				db.dbDisconnect();	
				%>
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
				<div class="panel panel-default">
					<div class="panel-body">
						<h5>
							<b>Sub Total(<%=x %> item):</b> <span class="price"><i
								class="fa fa-inr"></i><%=total %>/-</span>
						</h5>
						<br>

						<a class="btn btn-success" href="confirmCart.jsp">Proceed to Pay</a>
					</div>

				</div>
			</div>
		</div>
		<%}else{%>
		<div class="row">
			<div class="jumbotron text-center">
				<h3>Your Cart is Empty</h3>
				<p>Please Buy Something</p>
				<a class='btn btn-success' href='items.jsp'>Continue Shopping</a>
			</div>
		</div>
		<%} %>
	</div>

	</div>
	<!--footer-->
	<div class="navbar navbar-inverse navbar-fixed-bottom">
		<div class="container">
			<div class="navbar-text pull-left">
				<p>Design and Develop by INCAPP</p>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery-2.2.2.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/validator.js"></script>

</body>
</html>
<%
	} else {
		session.setAttribute("msg", "Plz Login First!");
		response.sendRedirect("home.jsp");
	}
%>
