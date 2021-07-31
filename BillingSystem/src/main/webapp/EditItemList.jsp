<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ include file="AdminHeader.jsp" %>
    <%@page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="AdminServlet" method="post">
<table class="table table-striped table-hover">
 <thead>
         <tbody>
 						 <%
 						 int id=Integer.parseInt(request.getParameter("transferid"));
 						
        try {
        	Class.forName("com.mysql.jdbc.Driver");
        	Connection connect = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/BillingSystem", "root", "123456");
        	Statement statement = connect.createStatement();
        	ResultSet resultSet=statement
					.executeQuery("SELECT *  from item where itemId="+id+";");
			if(resultSet.next()) {
		
		
			
        %>
        <div class="form-group">  <label class="col-md-4 control-label" for="transferid">Item Id</label>  
                          <div class="col-md-4">
 				<input id="transferid" name="transferid" value=<%out.print(id);%>  class="form-control input-md"  readonly type="number">
 				</div>
 				</div>
                     <div class="form-group">  <label class="col-md-4 control-label" for="itemName">Item Name</label>  
                          <div class="col-md-4">
 				<input id="itemName" name="itemName" value=<%out.print(resultSet.getString(2)); %> class="form-control input-md"  type="text">
 				</div>
 				</div>
                        <div class="form-group"> 
                        <label class="col-md-4 control-label" for="availableQuantity">AVAILABLE QUANTITY</label>
                        <div class="col-md-4">  
                         <input id="availableQuantity" name="availableQuantity" value=<%out.print(resultSet.getInt(5)); %> class="form-control input-md"  type="text">
                        </div>
                        <div class="form-group"> 
                        <label class="col-md-4 control-label" for="category">Item Category</label> 
                        <div class="col-md-4">   
                        <input id="category" name="category" value=<%out.print(resultSet.getString(3)); %> class="form-control input-md"  type="text">
                        </div>
                        </div>
						
						  
                        <div class="form-group">
                       <label class="col-md-4 control-label" for="price">Price Per Unit</label>  
                       <div class="col-md-4">   
                       <input id="price" name="price" value=<%out.print(resultSet.getDouble(4)); %> class="form-control input-md"  type="text"></div>
                       </div>
                         <div class="form-group">
						 <label class="col-md-4 control-label" for="itemOffer"></label>  
                       <div class="col-md-4">  
                        
                          <input id="itemOffer" name="itemOffer" value=<%out.print(resultSet.getString(6)); %> class="form-control input-md"  type="text">
                      </div></div>
                      </div>
                      <div>
                      <input type="submit" id="submit" name="submit" value="EDIT ITEM" class="btn btn-primary">
                       <h3 class="alret">
${message}</h3>
	
                      </div>
                      <div class="col-md-4">  <a href="AllItems.jsp">Abort Edit</a>
						 <% }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}%>
</tbody></table>			
</form>
</body>
</html>