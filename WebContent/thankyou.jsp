<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Thank you for shopping</title>
	</head>
	<body>
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
				<h2>Thank you for shopping!!!</h2>
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
		<input type="hidden" name="page" value="thankyoupage" />
	</body>
</html>