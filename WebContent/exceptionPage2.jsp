<html>
    <head>
        <title>Login App</title>
    </head>
    <body>
    <center>
    	<h2>Exception aaya re aaya re aaya re!!</h2>
    	<%
    	Exception exception=(Exception)session.getAttribute("exception");
    	%>
    	<p><%= exception %></p>
	</center>
	</body>
</html>