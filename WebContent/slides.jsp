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
				
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading text-center">
								<h3>Slides</h3>
								<form class='form-inline' action="AddSlide" method='post' enctype="multipart/form-data" data-toggle="validator" class="form-horizontal">
										<input type="file" name="slide" class="form-control" id="img"  />
										<button type="submit" class="btn btn-primary">Add Slide</button>
								</form>
								<br>
						</div>
						<%
						db.DbConnect db=new db.DbConnect();
					    ArrayList<Integer> ids=db.getAllSlideIds();
						db.dbDisconnect();
					    for(int i:ids){
						%>
						<div class="panel-body">
							<div>
								<img src="GetSlideImg?slide_id=<%=i%>" alt="No Photo" width='500'/>
								<a href='DeleteSlide?slide_id=<%=i%>' class='btn btn-danger'>Delete Slide</a>
							</div>
						</div>
						<hr>
						<%} %>
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
