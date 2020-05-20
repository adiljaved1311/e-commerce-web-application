<%@page import='java.util.*' %>
<%
java.util.HashMap userDetails=
(java.util.HashMap)session.getAttribute("userDetails");
if(userDetails!=null){
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" >
<meta http-equiv="X-UA-Compatible" content="IE=edge" >
<meta name="viewport" content="width=device-width, initial-scale=1" >
<title>SkyFoot</title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/custom.css" rel="stylesheet" />
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
				<a href="home.html" class="navbar-brand">SkyFoot</a>
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
	<br><br><br>
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
    <div class="container" style="padding-top:50px">
      <br>
			<div class="row">

					<div class="col-lg-4" style="text-align: center;">
						<img src="GetPhoto?email=<%=userDetails.get("email")%>" width='120px' height='150px'>
					</div>
					<div class="col-lg-4">

							<div>
								<div class="form-group">
									<label for="email" class="control-label">Name: <font color="grey"><%=userDetails.get("name") %></font></label>

								</div>
								<div class="form-group">
									<label for="name" class="control-label">Email:<font color="grey"> <%=userDetails.get("email") %></font></label>

								</div>
								<div class="form-group">
									<label for="contact" class="control-label">Phone: <font color="grey"><%=userDetails.get("phone") %></font></label>
								</div>
								<div class="form-group">
									<label for="gender" class="control-label">Gender: <font color="grey"><%=userDetails.get("gender") %></font></label>
								</div>
							</div>
					</div>
				<div class="col-lg-4">
					<form action='editProfile.jsp' method='post'>
					<div class="form-group">
						<input type="submit" class="btn btn-success" value="Edit Profile" />
					</div>
					</form>
					<form action='changePassword.jsp' method='post'>
					<div class="form-group">
						<input type="submit" class="btn btn-success" value="Change Password"/>
					</div>
					</form>
				</div>
				</div>
			</div>
		</div>
     <hr>

	 <h3 style="text-align:center"> Your Orders </h3>
	<div class="container" >
		<%
		ArrayList<HashMap> orders=db.getUserOrders((String)userDetails.get("email"));
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
				<div class="row" style="margin:0 10px">
					<div class="col-6 pull-left" style="text-align:right">
						<h3>Satus: <%=order.get("status") %></h3>
					</div>
					<div class="col-6 pull-right" style="text-align:left">
						<%
						String status=(String)order.get("status");
						java.util.Date date=(java.util.Date)order.get("delivery_date");
						
						if(status.equalsIgnoreCase("placed") || status.equalsIgnoreCase("confirm")){
						%>
						<form  action='UpdateOrderStatus' method='post'>
							<input type='hidden' name='order_id' value='<%=order_id%>'/>
							<input type='hidden' name='order_status' value='Cancel'/>
							<input type='hidden' name='page' value='profile.jsp'/>
							<input type='submit' class="btn btn-danger" value='Cancel'/>
						</form>
						<%}else if(status.equalsIgnoreCase("delivered")  ) {
							if(date!=null){
								java.time.LocalDate deliveryDate = date.toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalDate();
								deliveryDate=deliveryDate.plusDays(15);
								java.time.LocalDate currentDate=java.time.LocalDate.now();
								if(deliveryDate.isAfter(currentDate)){
						%>
						<form  action='UpdateOrderStatus' method='post'>
							<input type='hidden' name='order_id' value='<%=order_id%>'/>
							<input type='hidden' name='order_status' value='Return'/>
							<input type='hidden' name='page' value='profile.jsp'/>
							<input type='submit' class="btn btn-danger" value='Return'/>
						</form>
						<%
						}
						}
						}
						%>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<%
		}db.dbDisconnect();
		%>
	</div>
  <!--footer-->
	<div class="navbar navbar-inverse navbar-fixed-bottom">
		<div class="container">
			<div class="navbar-text pull-left">
				<p>Design and Develop by INCAPP</p>
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
}else{
	session.setAttribute("msg","Plz Login First!");
    response.sendRedirect("home.jsp");
}
%>
