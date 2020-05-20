<%@page import='java.util.*' %>
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
  					<li><a href="items.jsp"><span class="navfont">Shop</span></a></li>
          </ul>
  			</div>
    </div>
	</nav><!--end navbar-->
		<div class="container">
      <br><br><br>
			<section>
					<div class="panel panel-default">
						<div class="panel-heading text-center">
							<h3>Email Verification</h3>
						</div>
						<div class="panel-body">
						</br>
						</br>
							<form action="VerifyOTP" method='post' data-toggle="validator" class="form-horizontal">
								<div class="form-group">
									<label for="email" class="col-lg-5 control-label">Enter your Registered Email-ID:</label>
									<div class="col-lg-5">
										<input type="email"name="email" class="form-control" id="email" placeholder="Enter your email" required/>
									</div>
								</div><!--end form group-->
								<div class="form-group">
									<label for="otp" class="col-lg-5 control-label">Enter your OTP:</label>
									<div class="col-lg-5">
										<input type="text"name="otp" class="form-control" id="otp" placeholder="Enter your OTP" required/>
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
		</section>
	</div>
	< <!--footer-->
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
