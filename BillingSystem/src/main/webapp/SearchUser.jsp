<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ include file="UserHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<Section><h5> Search Result for <%out.print(request.getParameter("search")); %></h5>
</Section>
<table class="table table-striped table-hover">
                <thead>
                    <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>

          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td><i class="fa fa-inr"></i> </i></td>
            <td><a href="">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
         
        </tbody>
      </table>
      	
	<h1 style="color:white; text-align: center;">Nothing to show</h1>
	
      <br>
      <br>
      <br>
     

</body>
</html>