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

    <div class="container" style="padding-top:50px">
      <br>
			<div class="row">
					<div class="col-lg-12 text-center">
							<div>
								<div class="form-group">
									<label for="name" class="control-label">Name: <font color="grey"><%=userDetails.get("name") %></font></label>
									&nbsp&nbsp&nbsp
									<label for="email" class="control-label">Email:<font color="grey"> <%=userDetails.get("email") %></font></label>
								</div>
							</div>
					</div>
				
				</div>
     <hr>
	<div class="panel panel-default">
						<div class="panel-heading text-center">
							<h3>Change Password</h3>
						</div>
						<div class="panel-body">
						</br>
						</br>
							<form action="" method="post" data-toggle="validator" class="form-horizontal">
								<div class="form-group">
									<label for="oldpwd" class="col-lg-5 control-label">Old Password:</label>
									<div class="col-lg-4">
										<input type="password" name="password"class="form-control" id="oldpwd" required/>
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="newpwd" class="col-lg-5 control-label">New Password:</label>
									<div class="col-lg-4">
										<input type="password" name="newpassword" class="form-control" id="newpwd" required/>
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="confirmpwd" class="col-lg-5 control-label">Confirm Password:</label>
									<div class="col-lg-4">
										<input type="password" name="confirmpassword" class="form-control" id="confirmpwd" required/>
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-5">
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</div><!--end form group-->
							</form>
						</div>
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
	<br><br><br>
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
