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
                        <th>Order ID</th>
                        <th>Customer Username</th>
                        <th>Total No. of Items</th>	
                        <th>Offer Applied</th>					
                        <th>Net Amount</th>
                        <th>Action</th>
                    </tr>
                </thead>
        </table>
        <%
        try {
        	Class.forName("com.mysql.jdbc.Driver");
        	Connection connect = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/BillingSystem", "root", "123456");
        	Statement statement = connect.createStatement();
        	System.out.println(session.getAttribute("user"));
        	ResultSet resultSet=statement
					.executeQuery("select *,count(*),sum(price) from orders  group by orderId having orderId>=1 ;");
        	int count=0;
        	int id=0;
        	String offer="No",name="";
        	double total=0;
			while(resultSet.next()) {
				
		
			
        %>
          <table class="table table-striped table-hover">
                   <thead>
                    <tr>
                        <td><% out.println(resultSet.getInt(1)); %></td>
                        <td></td>
                       <td><span class="status text-success">&bull;</span> <%out.print(resultSet.getString(2)); %> </td>
                       <td></td>
                        <td><% out.print(resultSet.getInt(7)); %> </td>
                        <td></td>
                        <td></td>
                        <td><%out.print(resultSet.getString(6));%> </td>             
                                   
                        <td align="right"><span class="status text-success">&bull;</span> <%if(resultSet.getString(6).equalsIgnoreCase("yes"))
                        	{total=resultSet.getDouble(8);
                        	total=(total-(total*0.1));
                        	out.print(total);}else{
                        		out.print(resultSet.getDouble(8));
                        	}
                        	%> </td>
        				
                        <td align="right"><a href="AdminViewSpecificOrder.jsp?admintransferid=<%out.print(resultSet.getInt(1));  %>" class="view" title="View Details" data-toggle="tooltip"><i class="fas fa-angle-double-right"></i></a></td>
                        <td></td>
                    </tr>
                    </tbody>
                    </table>
                                    <% }}
		 catch (Exception e) {			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 } else{
		request.setAttribute("message", "LOGIN EXPERIED");

request.getRequestDispatcher("/index.jsp").forward(request,response);}
%>   

</body>
</html>