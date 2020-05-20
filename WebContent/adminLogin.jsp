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
				<a href="home.jsp" class="navbar-brand">SkyFoot</a>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
  					<li><a href="home.jsp"><span class="navfont">Home</span></a></li>
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
							<h3>Admin Login</h3>
						</div>
						<div class="panel-body">
						</br>
						</br>
							<form action="AdminLogin" method="post" data-toggle="validator" class="form-horizontal">
								<div class="form-group">
									<label for="oldpwd" class="col-lg-5 control-label">Admin Email:</label>
									<div class="col-lg-4">
										<input type="email" name="email"class="form-control" id="email" required/>
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="newpwd" class="col-lg-5 control-label">Password:</label>
									<div class="col-lg-4">
										<input type="password" name="password" class="form-control" id="password" required/>
									</div>
								</div><!--end form group-->
								
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-5">
										<button type="submit" class="btn btn-primary">Login</button>
									</div>
								</div><!--end form group-->
							</form>
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
  <script type="text/javascript" src="js/jquery-2.2.2.min.js" ></script>
    <script type="text/javascript" src="js/bootstrap.min.js" ></script>
  <script type="text/javascript" src="js/script.js" ></script>
  <script type="text/javascript" src="js/validator.js" ></script>

  </body>
  </html>
  
