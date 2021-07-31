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

<table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            
                            <th scope="col">ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Category</th>
                            <th scope="col">Price</th>
                          <th scope="col"> Available</th>
                          <th scope="col">Quantity Required</th>
                            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
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
							 <th scope="col"><% out.print(resultSet.getInt(1)); %></th>
                         <th scope="col"><%out.print(resultSet.getString(2)); %></th>
                           <th scope="col" > <%out.print(resultSet.getString(3)); %></th>
                          <th scope="col" > <i class="fa fa-inr"></i> <%out.print(resultSet.getDouble(4));%></th>
                          <th scope="col"> <% if(resultSet.getInt(5)>0){out.print("In Stock");}
                          else{
                        	  out.print("Out of Stock");
                          }%></th>
                            <th scope="col">
                                                      <select name="itemquantity<%out.print(resultSet.getInt(1)); %>" id="itemquantity"class="col-md-4 control-label">
                            
                           <%for(int i=0;i<=resultSet.getInt(5);i++){ %>
                           <option   value="<%out.print(i); %>"> <%out.print(i); %>
                           </option>
                              <%} %>
                           </select>
                        
                           
                           </th>
                          <th scope="col"><input name=""   placeholder="only <%out.print(resultSet.getInt(5)); %> avaiable" type="text">
                          <th scope="col"><button name="submit" type="submit" value="<%out.print(resultSet.getInt(1)); %>" >Add to Cart</button>
                             </th>
                        <th></th>
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
</html>