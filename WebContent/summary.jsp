<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Cart Summary</title>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="summary.css">
	</head>
	<body>
		<form method="post" name="summaryForm" action="/Ecommerce/cs">
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
				          <h2>Cart Summary</h2>
				          <ul class="w3-ul w3-card-4">
				          	<li class="w3-bar">
				            <%	
				            HashMap<String, String> selectedProducts = (HashMap<String, String>)session.getAttribute("selectedProducts");
							Iterator it = selectedProducts.entrySet().iterator();
							double totalcost = 0;
						    while (it.hasNext()) {
						        Map.Entry pair = (Map.Entry)it.next();
						        String name = pair.getKey().toString().split("\\|")[0];
						        String quantity = pair.getValue().toString();
						        double cost = Double.parseDouble(pair.getKey().toString().split("\\|")[1]) * Integer.parseInt(quantity);
						        totalcost += cost;
						%>	
									<div class="item-holder"><span class="cart-item-name"><%=name %>: <%=quantity %></span> <span class="cart-item">$<%=cost %></span></div>
						<% 
							}
						%>
								</li>
					
							<li class="w3-bar">
								<div class="item-holder"><span class="cart-item-name"><strong>Total: </strong></span> <span class="cart-item"><strong>$<%=totalcost %></strong></span></div>
							</li>
						</ul>
				    </div>
					<div class="button-container">
						<button class="button" name="action" value="backToCart"> Back to cart </button>
						<input class="button" type="submit" name="action" value="Checkout" />
					</div>
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
			<input type="hidden" name="page" value="summarypage" />
		</form>
	</body>
</html>