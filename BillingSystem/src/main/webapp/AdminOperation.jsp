<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="AdminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
h1
{
color: blue;
text-align: center;
font-size: 100px;
}</style>
</head>
<body>
<% String user=request.getParameter("username");
session.setAttribute("user",user);  
%>
<h1>welcome admin!</h1>
</body>

</html>