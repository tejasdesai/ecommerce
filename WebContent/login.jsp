<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login here</title>
<link type="text/css" rel="stylesheet" href="login.css" />
</head>
<body>
	<div class="login-page">
    	<div class="form">
			<form class="login-form" action="/Ecommerce/cs" method="post" name="loginForm">
	    		<input type="text" placeholder="Enter Username" name="username" required/>
	    		<input type="password" placeholder="Enter Password" name="password" required/>
	    		<input type="submit" name="action" value="Login">
	            <input type="reset" value="Reset">    		
	    		<input type="hidden" name="page" value="loginpage" />
	      	</form>
	      	<%
	      		session.setAttribute("selectedProducts", "");
	   			String error = (String)request.getAttribute("loginError");
	   			if(error != null){
	   		%>
	   			<p class="message">Invalid Username/Password</p>
	   		<% } %>
   		</div>
	</div>
</body>
</html>