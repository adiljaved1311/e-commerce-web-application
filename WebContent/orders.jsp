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
</head>

<body data-spy="scroll" data-target="#my-navbar">
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a href="adminHome.jsp" class="navbar-brand">SkyFoot</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="adminHome.jsp"><span class="navfont">Home</span></a></li>
					<li><a href="adminItems.jsp"><span class="navfont">Items</span></a></li>
					<li><a href="orders.jsp"><span class="navfont">Orders</span></a></li>
					<li><a href="AdminLogout"><span class="navfont">Logout</span></a></li>
					<li><a href="adminProfile.jsp"><span class="navfont">MyAccount</span></a></li>
					<li><span class="navfont">Welcome: <%=userDetails.get("name")%></span></li>
				</ul>
			</div>
		</div>
	</nav>
	<!--end navbar-->
	<br>
	<br>
	<br>
	<h3 style="text-align: center">All Orders</h3>
	<div class="container">
		<%
		db.DbConnect db=new db.DbConnect();
		java.sql.Date d=new java.sql.Date(new java.util.Date().getTime());
		ArrayList<HashMap> orders=db.getAllOrders();
		for(HashMap order:orders){
			int order_id=(int)order.get("order_id");
		%>
		<div class="panel panel-success">
			<div class="panel-heading" >
				<div class="row" style="margin:0 10px">
					<div class="col-6 pull-left">
						<h3 >Order Id: <%=order_id %></h3>
						<h3 >Date-time: <%=order.get("order_date") %>: <%=order.get("order_time") %></h3>
					</div>
					<div class="col-6 pull-right">
						<h3 >Total Amount: <%=order.get("amount") %> </h3>
						<%
						String status=(String)order.get("status");
						java.util.Date date=(java.util.Date)order.get("delivery_date");
						
						if(status.equalsIgnoreCase("placed")){
						%>
						<form  action='UpdateOrderStatus' method='post'>
							<input type='hidden' name='order_id' value='<%=order_id%>'/>
							<input type='hidden' name='order_status' value='Confirm'/>
							<input type='hidden' name='page' value='orders.jsp'/>
							<input type='submit' class="btn btn-success" value='Confirm'/>
						</form>
						<form  action='UpdateOrderStatus' method='post'>
							<input type='hidden' name='order_id' value='<%=order_id%>'/>
							<input type='hidden' name='order_status' value='Reject'/>
							<input type='hidden' name='page' value='orders.jsp'/>
							<input type='submit' class="btn btn-danger" value='Reject'/>
						</form>
						<%}else if(status.equalsIgnoreCase("Confirm")  ) {
						%>
						<form action='UpdateOrderStatus' method='post'>
							<input type='hidden' name='order_id' value='<%=order_id%>'/>
							<input type='hidden' name='order_status' value='Delivered'/>
							<input type='hidden' name='page' value='orders.jsp'/>
							<input type='submit' class="btn btn-success" value='Delivered'/>
						</form>
						<%} %>
						
						Status: <b><%=status%></b>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<% 
				ArrayList<HashMap> orderItems=db.getOrderItems((int)order.get("order_id"));
				for(HashMap orderItem:orderItems){
					String itemName=(String)orderItem.get("item_name");
					double itemPrice=(double)orderItem.get("item_price");
					int order_item_id=(int)orderItem.get("order_item_id");
				%>
				<div class="row" >
					<div class="col-lg-3" style="text-align:center;">
						<img src="GetOrderItemPhoto?order_item_id=<%=order_item_id%>" alt="No Photo" height='60' width='60'> 
					</div>
					<div class="col-lg-4">
						<p style="text-align:center"><%= itemName %></p>
					</div>
					<div class="col-lg-3">
						<p style="text-align:center"><span class="price"><i class="fa fa-inr"></i>&nbsp;<%= itemPrice %>/-<span></p>
					</div>
				</div>
				<hr>
				<%} %>
			</div>
			<div class="panel-footer">
				<div class="row">
					<div class="col-12">
						<div class="col-lg-8">
							<p>Customer Details: <b><%=order.get("name") %> </b> [ <b><%=order.get("phone") %> </b> ] <b><%=order.get("email") %></b>
							</p>
						</div>
						<div class="col-lg-4">
							<p>
								Shipping Address: <b> <%=order.get("address") %> </b>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%
		}db.dbDisconnect();
		%>
	</div>

	<br>
	<br>
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
