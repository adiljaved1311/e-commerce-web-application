<%@page import='java.util.*' %>
<%
	HashMap userDetails = (HashMap) session.getAttribute("userDetails");
	if (userDetails != null) {
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
	</nav><!--end navbar-->
		<div class="container">
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
			<section>
			<div class='row'>
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading text-center">
							<h3>Add Item</h3>
						</div>
						<div class="panel-body">
						</br>
						</br>
							<form action="AddItem" method='post' enctype="multipart/form-data" data-toggle="validator" class="form-horizontal">
								<div class="form-group">
									<label class="col-lg-5 control-label">Item Name:</label>
									<div class="col-lg-5">
										<input type="text" name="name" class="form-control" id="name" placeholder="Item Name" required/>
									</div>
									<label class="col-lg-5 control-label">Item Price:</label>
									<div class="col-lg-5">
										<input type="text" pattern="^[_0-9 .]{1,}$" name="price" class="form-control" id="price" placeholder="Item Price" required/>
									</div>
									<label class="col-lg-5 control-label">Item Quantity:</label>
									<div class="col-lg-5">
										<input type="number"  name="qty" class="form-control" id="price" placeholder="Item Quantity" value='1' required/>
									</div>
									<label class="col-lg-5 control-label">Item Description:</label>
									<div class="col-lg-5">
										<textarea name='info' class="form-control" required></textarea>
									</div>
									<label class="col-lg-5 control-label">Item Image 1:</label>
									<div class="col-lg-5">
										<input type="file" name="img1" class="form-control" id="img" placeholder="Item Image 1" required/>
									</div>
									<label class="col-lg-5 control-label">Item Image 2:</label>
									<div class="col-lg-5">
										<input type="file" name="img2" class="form-control" id="img" placeholder="Item Image 2" required/>
									</div>
									<label class="col-lg-5 control-label">Item Image 3:</label>
									<div class="col-lg-5">
										<input type="file" name="img3" class="form-control" id="img" placeholder="Item Image 3" required/>
									</div>
									<label class="col-lg-5 control-label">Item Image 4:</label>
									<div class="col-lg-5">
										<input type="file" name="img4" class="form-control" id="img" placeholder="Item Image 4" required/>
									</div>
									<label class="col-lg-5 control-label">Item Image 5:</label>
									<div class="col-lg-5">
										<input type="file" name="img5" class="form-control" id="img" placeholder="Item Image 5" required/>
									</div>
									<div class="col-lg-10 col-lg-offset-5">
										<button type="submit" class="btn btn-primary">Add</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading text-center">
							<h3>All Item</h3>
						</div>
						<div class="panel-body">
						<div class='row'>
							<div class='col-lg-4'>
							<b>Name:</b>
							</div>
							<div class='col-lg-2'>
							<b>Price:</b>
							</div>
							<div class='col-lg-1'>
							<b>Qty:</b>
							</div>
							<div class='col-lg-5'>
							<b>Info:</b>
							</div>
						</div>
						<hr>
						<%
						db.DbConnect db=new db.DbConnect();
						ArrayList<HashMap> items=db.getAllItems();
					    db.dbDisconnect();
					    for(HashMap item:items){
						%>
						<div>
							<div class='row'>
								<div class='col-lg-4'>
								<b><%= item.get("name") %></b>
								</div>
								<div class='col-lg-2'>
								<b><%= item.get("price") %></b>
								</div>
								<div class='col-lg-1'>
								<b><%= item.get("qty") %></b>
								</div>
								<div class='col-lg-5'>
								<a class="btn btn-primary" href='adminItemDetails.jsp?name=<%=item.get("name")%>'>View Details</a>
								</div>
							</div>
							<hr>
						</div>
						<%} %>	
						</div>
					</div>
				</div>
			</div>
		</section>
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
