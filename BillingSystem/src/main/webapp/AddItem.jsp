<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="AdminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Item</title>
</head>
<body>
 <%if(session.getAttribute("user")!=null){ %> 
<form action="AdminServlet" method="post">



<div class="form-group">
  <label class="col-md-4 control-label" for="product_name">ITEM NAME</label>  
  <div class="col-md-4">
  <input id="itemName" name="itemName" placeholder="ITEM NAME" class="form-control input-md" required type="text">
    
  </div>
</div>
<div>
<label  class="col-md-4 control-label" for="category">SELECT CATEGORY</label>
  <div class="col-md-4">

  <select name="category" id="category">
      <option value="Perfume">Perfume</option>
      <option value="Shampoo">Shampoo</option>
        <option value="Soap">Soap</option>
      <option value="Oil">Oil</option>
   
  </select>
  <br><br>
</div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="price">PRICE PER UNIT</label>  
  <div class="col-md-4">
  <input id="price" name="price" placeholder="PRICE PER UNIT" class="form-control input-md" required type=number>
    
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="availableQuantity">AVAILABLE QUANTITY</label>  
  <div class="col-md-4">
  <input id="availableQuantity" name="availableQuantity" placeholder="AVAILABLE QUANTITY" class="form-control input-md" required type="text">
    
  </div>
</div>
<div>
<label  class="col-md-4 control-label" for="itemOffer">OFFER AVAILABLE</label>
  <div class="col-md-4">

  <select name="itemOffer" id="itemOffer">
      <option value="Yes">Yes</option>
      <option value="No">No</option>
        
   
  </select>
  <br><br>
</div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="addproduct">ADD PRODUCT</label>
  <div class="col-md-4">
    <input type="submit" id="submit" name="submit" value="ADD ITEM" class="btn btn-primary">
  </div>
  <h3 class="alret">
${message}</h3>
  </div>


</form>
<%}
 else{
		request.setAttribute("message", "LOGIN EXPERIED");

request.getRequestDispatcher("/index.jsp").forward(request,response);}
%>
</body>
<br><br><br>




</html>