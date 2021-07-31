    <%@ include file="AdminHeader.jsp" %>
   
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>

 <%if(session.getAttribute("user")!=null){ %> 
       <h2>
         ${message}
         </h2> 
        

<table class="table table-striped table-hover">
        <thead>
          <tr>
       
        
          </tr>
          <tr>
          
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th>Quantity Available</th>
            <th>Offer Available</th>
            <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
          </tr>
        </thead>
        <tbody>
        <%
        try {
        	Class.forName("com.mysql.jdbc.Driver");
        	Connection connect = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/BillingSystem", "root", "123456");
        	Statement statement = connect.createStatement();
        	ResultSet resultSet=statement
					.executeQuery("SELECT *  from item;");
			while(resultSet.next()) {
		
		
			
        %>
       <tr>
            <td><%out.print( resultSet.getInt(1)); %></td>
            <td><%out.print(resultSet.getString(2)); %></td>
            <td><%out.print(resultSet.getString(3)); %></td>
            <td><i class="fa fa-inr"></i> <%out.print(resultSet.getDouble(4)); %></td>
            <td><%out.print(resultSet.getInt(5)); %></td>
             <td><%out.print( resultSet.getString(6)); %></td>
            <td><a href="EditItemList.jsp?transferid=<%out.print(resultSet.getInt(1));%>">Edit <i class='fas fa-pen-fancy'></i></a></td>
          </tr>
         <% }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}%>
         
	<%}
 else{
		request.setAttribute("message", "LOGIN EXPERIED");

request.getRequestDispatcher("/index.jsp").forward(request,response);}
%>
 
        </tbody>
      </table>
      
      <br>
      <br>
      <br>

</body>
</html>