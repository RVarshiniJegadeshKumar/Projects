<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ include file="UserHeader.jsp" %>
        
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%if(session.getAttribute("user")!=null){ %>

 <form action="UserOrderServlet" method="post">
 <h3 style="text-align: center;">
${message }
</h3>
<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">ABC Shopping CART</h1>
     </div>
</section>

<div class="container mb-4">
    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Item ID</th>
                            <th scope="col">Product</th>
                            <th scope="col">Available</th>
                            <th scope="col" class="text-center">Quantity</th>
                            <th scope="col" class="text-right">Price</th>
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
					.executeQuery("SELECT cart.itemId,item.itemname,cart.quantity,item.availablequantity,cart.total FROM cart JOIN item ON item.itemId = cart.itemId where cart.username='"+session.getAttribute("user")+"';");
			while(resultSet.next()) {
		
		
			
        %>
                      <tbody>
                        <tr>
                            <td><input type=number name="itemId" value=<% out.print(resultSet.getInt(1)); %> readonly></td>
                            <td><%out.print(resultSet.getString(2)); %></td>
                            <td><% if(resultSet.getInt(4)>resultSet.getInt(3)){
                            	out.print("Instock");
                            }else
                            {
                            	if(resultSet.getInt(4)!=0){
                            		out.print(resultSet.getInt(3)+(resultSet.getInt(4)-resultSet.getInt(3))+" available");
                            	}
                            	else{
                            		out.print("out of stock");
                            	}
                            		
                            }
                            	%></td>
                           
                            <td><input class="form-control" type="text" value="<%out.print(resultSet.getInt(3)); %>" /></td>
                            <td >Rs <% out.print(resultSet.getInt(5)); %></td>
                            <td ><button name=submit value=<%out.print(resultSet.getInt(1));} %> class="btn btn-sm btn-danger"><i class="fa fa-trash"></i> </button> </td>
                        </tr> 
                  
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Total</td>
                            <td class="text-right">Rs <%
                            	Cookie cks[]=request.getCookies();
                            	resultSet=statement.executeQuery("Select max(total) from cart where username='"+(String)session.getAttribute("user") +"';");
                    			if(resultSet.next()){
                    				out.print(resultSet.getDouble(1));
                    			}
                            %>
                            	    
    
                            
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Offer</td>
                            <td class="text-right"><% 
                         
                             resultSet=statement.executeQuery("Select * from orders where username='"+(String)session.getAttribute("user") +"';");
                			if(resultSet.next()){
                				out.print("Yes");
                			}
                			else
                			{
                				out.print("No");

                			}%></td>
                        </tr>
                                            <% 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}%></td>
                        
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col mb-2">
            <div class="row">
                <div class="col-sm-12  col-md-6">
                 <button name="submit" type="submit" value="Conitnue Shopping" class="btn btn-block btn-light">Continue Shopping</button>
                </div>
                <div class="col-sm-12 col-md-6 text-right">
                    <a href="Orders.jsp"><button name="submit" value="Confirm" class="btn btn-lg btn-block btn-success text-uppercase">Confirm</button>
                </div>
            </div>
        </div>
    </div>
</div>

</form>
<%}
 else{
		request.setAttribute("message", "LOGIN EXPERIED");

request.getRequestDispatcher("/index.jsp").forward(request,response);}
%>
</body>
</html>