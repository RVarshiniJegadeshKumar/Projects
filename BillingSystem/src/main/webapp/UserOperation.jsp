 <%@ include file="UserHeader.jsp" %>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>

</head>
<body> 
<%if(session.getAttribute("user")!=null){%>


<h3 style="text-align: center;">
 ${message} 
</h3>

<form action="UserServlet" method="post">

<table style="width:100%;border:1px solid black;margin-left:0%;margin-right:0%;">
               <thead>
                        <tr  style="background-color:Gainsboro;">
                            
                            <th scope="col"><h3>ID</h3></th>
                            <th scope="col"><h3>Name</h3></th>
                            <th scope="col"><h3>Category</h3></th>
                            <th scope="col"><h3>Price </h3></th>
                          <th scope="col"> <h3>Available</h3></th>
                          <th scope="col"><h3>Quantity Required </h3></th>
                            <th scope="col"><h3>Add to cart </h3></th>
                            <th> </th>
                        </tr>
 						 </thead>
 					 <%
        try {
        	Class.forName("com.mysql.jdbc.Driver");
        	Connection connect = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/BillingSystem", "root", "123456");
        	Statement statement = connect.createStatement();
        	ResultSet resultSet=statement
					.executeQuery("SELECT *  from item;");
			while(resultSet.next()) {
		
		
			
        %><thead>
                        <tr>
							 <td scope="col"><% out.print(resultSet.getInt(1)); %></td>
                         <td scope="col"><%out.print(resultSet.getString(2)); %></td>
                           <td scope="col" > <%out.print(resultSet.getString(3)); %></td>
                          <td scope="col" > <i class="fa fa-inr"></i> <%out.print(resultSet.getDouble(4));%></td>
                          <td scope="col"> <% if(resultSet.getInt(5)>0){out.print("In Stock");}
                          else{
                        	  out.print("Out of Stock");
                          }%></td>
                            
                          <td scope="col"><input name="<%out.print(resultSet.getInt(1)); %>"   placeholder="only <%out.print(resultSet.getInt(5)); %> avaiable" type="text">
                          <td scope="col"><button name="submit" type="submit" value="<%out.print(resultSet.getInt(1)); %>" >Add to Cart</button>
                             </td>
                        <td></td>
                         </tr>
 						 </thead>
                       <%}}
		 catch (SQLException e) {			// TODO Auto-generated catch block
			e.printStackTrace();
		}%>
                        
                   </table>
       
</form>
<%}
 else{
		request.setAttribute("message", "LOGIN EXPERIED");

request.getRequestDispatcher("/index.jsp").forward(request,response);}
%>
</body>
</html>*