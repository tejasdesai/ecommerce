<%@page import="java.util.*, com.ecommerce.domain.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Cart</title>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="cart.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript"> 
			function closeThis(field) {
		    	$(field).parent().fadeOut( "slow" );
		  	}
			setTimeout(function(){ $(".success_notification").fadeOut( "slow" ); }, 3000);
		</script>
	</head>
	<body>
		<form method="post" name="cartForm" action="/Ecommerce/cs">
			<table style="height: 100%; width: 100%;">
				<tbody>
				<tr style="height: 125px;">
				<td style="width: 369px; height: 125px; border: solid 2px lightgrey;" colspan="2"> 
					<jsp:include page='header.jsp'>
					    <jsp:param name="headerId" value=""/>
					</jsp:include>
				</td>
				</tr>
				<tr style="height: 400px;">
				<td style="width: 109px; height: 400px; border: solid 2px lightgrey;">
					<jsp:include page='menu.jsp'>
					    <jsp:param name="menuId" value=""/>
					</jsp:include>
				</td>
				<td style="width: 260px; height: 400px; border: solid 2px lightgrey;">
					
					<div class="w3-container">
				          <h4><strong>Available Products</strong></h4>
				          <% 
				          	String successindicate = (String)request.getAttribute("cartsuccess");
				          	if(successindicate != null){
				          %>
				          <div class="success_notification"> Successfully added product to cart. <span class="close-dialog" onclick="closeThis(this);">x</span></div>
				          <%
				          		request.setAttribute("cartsuccess", null);
				          	} 
				          %>
				          <div class="cart-container">
					          <ul class="w3-ul w3-card-4">
					            <li class="w3-bar">
					              <div class="item-container w3-bar-item">
					              	<span class="cart-item-check w3-large">&nbsp;</span>
					                <span class="cart-item w3-large">Id</span>
					                <span class="cart-item-name w3-large">Name</span>
					                <span class="cart-item w3-large">Price</span>
					                <span class="cart-item w3-large">Quantity</span>
					              </div>
					            </li>
					            
					            <%	
								List<Products> products = (List<Products>)session.getAttribute("productList");
								for(Products product: products){
									String productQuantity = "";
									String checked = "";
									if(session.getAttribute("selectedProducts") != null && !session.getAttribute("selectedProducts").equals("")){
										HashMap<String, String> selectedProducts = (HashMap<String, String>)session.getAttribute("selectedProducts");
										if(selectedProducts.containsKey(product.getName()+"|"+product.getPrice())){
											productQuantity = selectedProducts.get(product.getName()+"|"+product.getPrice());
											checked = "checked";
										}
									}
							%>	
									<li id = <%=product.getName() %> class="w3-bar">
										<span class="cart-item-check"><input type="checkbox" name="products" value=<%=product.getName()+"|"+product.getPrice()%> <%= checked %>></span>
										<span class="cart-item"><%= product.getId() %></span>
										<span class="cart-item-name"><%= product.getName() %></span>
										<span class="cart-item"><input type="hidden" >$ <%= product.getPrice() %></span>
										<span class="cart-item"><input class="quantity" type="text" name=<%=product.getName() %> value=<%= productQuantity%>></span>
									</li>
							<% 
								}
							%>
					         	</ul>
					         </div>
				        </div>
				        <div class="button-container">
				        	<button name="action" class="button" value="addToCart"> Add to cart </button>
							<button name="action" class="button" value="checkOut"> Checkout </button>
				        </div>
					<%
			   			String noProduct = (String)request.getAttribute("noProduct");
			   			if(noProduct != null){
			   		%>
			   			<div class="error"> <%= noProduct %> </div>
			   		<% } %>
				</td>
				</tr>
				<tr style="height: 100px;">
				<td style="width: 369px; height: 100px; border: solid 2px lightgrey;" colspan="2">
					<jsp:include page='footer.jsp'>
					    <jsp:param name="footerId" value=""/>
					</jsp:include>
				</td>
				</tr>
				</tbody>
			</table>
			<input type="hidden" name="page" value="cartpage" />
		</form>
	</body>
</html>