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
  					<% 
  					db.DbConnect db=new db.DbConnect();
  					java.util.HashMap userDetails=
  					(java.util.HashMap)session.getAttribute("userDetails");
  					if(userDetails!=null){
  					%>
  					<li><a href="Logout"><span class="navfont">Logout</span></a></li>
  					<li><a href="profile.jsp"><span class="navfont">MyAccount</span></a></li>
  					<li><span class="navfont">Welcome: <%=userDetails.get("name")%></span></li>
  					<%
  						int count=db.cartCount((String)userDetails.get("email"));
  					%>
            		<li><a href="cart.jsp" class="navfont"><span class="navfont">Cart [<b> <%=count %> </b> ]</span> <i class="fa fa-shopping-cart navfont" aria-hidden="true"></i></a></li>
  					<%	
  					}else{
					%>
					<li><a class="navbar-menu" href="#" id="login"><span class="navfont">SignIn</span></a></li>
  					<li><a class="navbar-menu" href="#" id="signup"><span class="navfont">SignUp</span></a></li>
  					<%	
  					}
  					%>
          </ul>
  			</div>
    </div>
	</nav><!--end navbar-->
	<div class="container">
    <br><br>
    <!--items-->
    <div class=" text-center bg-items ">
            <br>
            <%
            String in=request.getParameter("iname");
            ArrayList<HashMap> items=db.getSearchItems(in);
		    db.dbDisconnect();
		    for(HashMap item:items){
            %>
	            <div class=" col-centered col-fixed thumbnail">
	              <a href="itemDetails.jsp?name=<%=item.get("name") %>" class="item text-left">
  					<img src="GetItemPhoto?name=<%=item.get("name")%>&img=img1"   width="180px">
  					<p><small>Name:</small> <b><%=item.get("name") %></b><br>
  					<p>Price: &nbsp;<span class="price"><i class="fa fa-inr"></i>&nbsp;<%=item.get("price") %>/-</span>
  					&nbsp;&nbsp;
  					</p>
  	            </a>
  	            </div>
  	         <%} %>   

              
              <br><br>
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

  <!-- Modal sign in-->
		<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Sign In</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form action="Login" method='post' data-toggle="validator"  role="form" class="form-horizontal">
                  <div class="form-group">
                    <label class="col-lg-4 control-label" for="email"> Email ID:</label>
      			  <div class="col-lg-8">
                    <input type="email" name="email" class="form-control" id="email" placeholder="Enter Your Email">
      			  </div>
            </div>
            <div class="form-group">
              <label class="col-lg-4 control-label" for="cnfrmpsw">Password:</label>
			  <div class="col-lg-8">
              <input type="password" name="password" class="form-control" id="password" placeholder="Enter password">
			  </div>
            </div>
              <button type="submit" class="btn btn-success btn-block">Sign In</button>
          </form>
        </div>
        <div class="modal-footer">
          <p>Not a member? <a href="#" onclick="$('#myModal').modal('hide'); $('#myModal1').modal('show')">Sign Up</a></p>
          <p><a href="#" onclick="$('#myModal').modal('hide'); $('#forgetpassword').modal('show')">Forgot Password?</a></p>
        </div>
      </div>
    </div>
  </div>
  <!-- Modal signup -->
  <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4> Sign Up</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
		<form action="AddUser" method='post' data-toggle="validator"  role="form" class="form-horizontal">
            <div class="form-group">
              <label class="col-lg-4 control-label" for="email"> Email ID:</label>
			  <div class="col-lg-8">
              <input type="email" name="email" class="form-control" id="email" placeholder="Enter Your Email">
			  </div>
            </div>
			<div class="form-group">
              <label class="col-lg-4 control-label" for="name"> Name:</label>
			  <div class="col-lg-8">
              <input type="text" name="name" class="form-control"  pattern="^[_A-Z a-z]{1,}$"  id="name" placeholder="Enter Your Name">
			  </div>
            </div>
            <div class="form-group">
              <label for="gender" class="col-lg-4 control-label">Gender:</label>
              <div class="col-lg-8">
                <input type="radio" id="gender" name="gender" value="male" checked/>Male
                <input type="radio" id="gender" name="gender" value="female"/>Female
                <input type="radio" id="gender" name="gender" value="other"/>Other
              </div>
            </div>
			<div class="form-group">
              <label class="col-lg-4 control-label" for="contact"> Phone:</label>
			  <div class="col-lg-8">
              <input type="text" name="phone" pattern="^[_0-9]{1,}$" maxlength="10" minlength="10" class="form-control" id="name" placeholder="Enter Phone Number">
			  </div>
            </div>
            <div class="form-group">
              <label class="col-lg-4 control-label" for="psw"> Password:</label>
			  <div class="col-lg-8">
              <input type="password" name="password" class="form-control" id="psw" placeholder="Enter password">
			  </div>
            </div>
            <div class="form-group">
              <label class="col-lg-4 control-label" for="cnfrmpsw">Confirm Password:</label>
			  <div class="col-lg-8">
              <input type="password" name="cpassword" class="form-control" id="cnfrmpsw" placeholder="Re-Enter password">
			  </div>
            </div>
              <button type="submit" class="btn btn-success btn-block">Sign Up</button>
          </form>
        </div>
        <div class="modal-footer">
          <p>Already have account. <a href="#" onclick="$('#myModal1').modal('hide'); $('#myModal').modal('show')">Sign In</a></p>
        </div>
      </div>
    </div>
  </div>
   <!-- Modal forget password -->
		<div class="modal fade" id="forgetpassword" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4> Forget Password</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form action="" method='post' data-toggle="validator"  role="form" class="form-horizontal">
                  <div class="form-group">
              <div class="col-lg-12">
                    <input type="email" name="email" class="form-control" id="email" placeholder="Enter Your Registered Email-Id:">
              </div>
            </div>
            <button type="submit" class="btn btn-success btn-block"> Submit</button>
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
