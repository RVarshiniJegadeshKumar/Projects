<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ include file="AdminHeader.jsp" %>
    <%@page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%if(session.getAttribute("user")!=null){ %> 
<table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <td><b>Username</b></td>
                       <td><b>Item Id</b></td>
                       <td><b>Item Name</b></td>	
                        <td><b>Category</b></td>					
                        <td><b>Price</b></td>
                        <td><b>Quantity</b></td>
                    </tr>
                </thead>
        </table>
        <%
        try {
        	Class.forName("com.mysql.jdbc.Driver");
        	Connection connect = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/BillingSystem", "root", "123456");
        	Statement statement = connect.createStatement();
        	ResultSet resultSet=statement
					.executeQuery("SELECT orders.username,orders.orderId,item.itemname,item.category,item.price,orders.quantity FROM orders  join item on item.itemId=orders.itemId and orders.orderId="+request.getParameter("admintransferid")+";");
			while(resultSet.next()) {
		
		
			
        %>
          <table class="table table-striped table-hover">
                   <thead>
                    <tr>
                        <td><% out.print(resultSet.getString(1)); %></td>
                        <td></td>
                        
                       <td> <%out.print(resultSet.getInt(2)); %> </td>
                       <td></td>
                         <td></td>
                        <td><% out.print(resultSet.getString(3)); %> </td>
                        <td></td>
                         <td></td>
                        <td><%out.print(resultSet.getString(4));%> </td>             
                         <td><%out.print(resultSet.getDouble(5));%> </td>     
                               <td></td>                 
                         <td><%out.print(resultSet.getInt(6));%> </td>             
                                                                 
                                  <td></td>   
                        
                        <td></td>
                        </tr>
                        </thead>
                    </tbody>
                    </table>
                                    <%}}
		 catch (Exception e) {			// TODO Auto-generated catch block
			e.printStackTrace();
		}%>
<%}
 else{
		request.setAttribute("message", "LOGIN EXPERIED");

request.getRequestDispatcher("/index.jsp").forward(request,response);}
%>
</body>
</html>