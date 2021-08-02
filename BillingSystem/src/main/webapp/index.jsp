<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
table.center {
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
	width: 500px;
	text-align: center;
	font-size: 30px;
}
</style>
 <body class="text-center">
 <p style="text-align: center;">
<%if(session.getAttribute("user")==null){ %>
		<BIG><font size=6>WELCOME TO ABC SUPERMARKET</font> </BIG>
	</p>
	</b>
	<table class="center">
		<tr>
			<td>Are you a customer or Admin ?</td>
		</tr>
		<tr>
			<td><a href="User.jsp">Customer</a></td>
			<td><a href="Admin.jsp">Admin</a></td>
		</tr>
		<tr>
		<td>
		</td>
		<td>
		${message}
		</td>
		</trx>
	</table>
		
	<b>
	<%}else{
    	request.getRequestDispatcher("/UserOperation.jsp").forward(request,response);
    	}%>
</body>
</html>