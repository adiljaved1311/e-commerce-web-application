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
            		<li><a href="cart.jsp" class="navfont"><span class="navfont">Cart [0]</span> <i class="fa fa-shopping-cart navfont" aria-hidden="true"></i></a></li>
          </ul>
  			</div>
    </div>
	</nav><!--end navbar-->
		<div class="container">
			<section>
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
            <div class="panel-body bg-danger text-center">
                <%=m%>
            </div>
        </div>
	<%		  
		  session.setAttribute("msg",null);
	  }
  %>
				<div class="panel panel-default">
					<div class="panel-heading text-center">
						<h3>Edit Profile</h3>
					</div>
					<div class="panel-body">
						<div class="container">
							<div class="row">
							<form action="UploadPhoto"  method='post' enctype="multipart/form-data"  data-toggle="validator" class="form-horizontal">
								<div class="col-lg-2 col-lg-offset-1">
									<img src="GetPhoto?email=<%=userDetails.get("email")%>" width='120px' height='150px'>
								</div>
								<div class="col-lg-2">
									<div class="form-group">
									</br></br>
										<label for="changephoto" class="control-label">Change Photo:</label><br>
									</div>
								</div>
								<div class="col-lg-3">
									<div class="form-group">
									</br></br>
										<input type="file" name="photo" class="form-control" id="changephoto" required/>	
									</div>
								</div>
								<div class="col-lg-3 " >
								<div class="form-group">
									</br></br>
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>	
								</div>
								</form>
							</div>
						</div>
						<hr>
						<div class="container">
							<form action="" method='post' data-toggle="validator" class="form-horizontal">
								<div class="form-group">
									<label for="email" class="col-lg-2 control-label">Email:</label>
									<div class="col-lg-5">
                                                                            <label class="form-control" id="email" ><%=userDetails.get("email") %></label>
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="phone" class="col-lg-2 control-label">Phone:</label>
									<div class="col-lg-5">
										<input type="text" name='phone' class="form-control" pattern="^[_0-9]{1,}$" maxlength="10" minlength="10" id="phone" placeholder="<%=userDetails.get("phone") %>"  />
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="name" class="col-lg-2 control-label">Name:</label>
									<div class="col-lg-5">
										<input type="text" class="form-control" id="name" name="name" pattern="^[_A-Z a-z]{1,}$"  placeholder="<%=userDetails.get("name") %>" />
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="gender" class="col-lg-2 control-label">Gender:</label>
									<div class="col-lg-5"> 
										<%
											String gender=(String)userDetails.get("gender");
											if(gender.equalsIgnoreCase("male")){
										%>
											<input type="radio" id="gender"name="gender" value="male" checked/>Male
											<input type="radio" id="gender"name="gender" value="female"/>Female
											<input type="radio" id="gender"name="gender" value="other"/>Other
										<%		
											}else if(gender.equalsIgnoreCase("female")){
										%>
											<input type="radio" id="gender"name="gender" value="male" />Male
											<input type="radio" id="gender"name="gender" value="female" checked/>Female
											<input type="radio" id="gender"name="gender" value="other"/>Other
										<%		
											}else{
										%>
											<input type="radio" id="gender"name="gender" value="male" />Male
											<input type="radio" id="gender"name="gender" value="female"/>Female
											<input type="radio" id="gender"name="gender" value="other" checked/>Other
										<%		
											}
										%>
									</div>
								</div><!--end form group-->
								
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-2">
										<button type="submit" class="btn btn-primary">Update Profile</button>
									</div>
								</div>
							</form>		
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
