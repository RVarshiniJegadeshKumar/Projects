<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <!DOCTYPE html>
<html lang="en">
    <head> 
		<meta name="viewport" content="width=device-width, initial-scale=1">


		

		<title>Admin</title>
	</head>
	<body>
	<% Cookie cookie[]=request.getCookies(); 
if(cookie!=null){%>
<form  method="post" action="LoginServlet">
	
	<table style="border:1px solid black;margin-left:auto;margin-right:auto;background-color: LightSlateGray">
	<tr>
				<th><h3 style="color:blue;">Sign up </h3></th>
					</tr>
					<tr>
							<th>	<label style="color:blue;"> <b>Username</b></label></th>
						</tr><tr>
							<td></td>
									<td> <input type="text" class="form-control" name="username"   placeholder="Enter your Username"/></td>
							
						
</tr>
<tr>
						
							<th> <label style="color:blue;">Password</label></th>
							</tr><tr>
							<td></td>
						
								<td>
									<input type="password"  name="password" id="password"  placeholder="Enter your Password"/></td>
								</tr>	<tr> 
								</tr>

						<tr>
						
							<th> <label style="color:blue;">Password</label></th>
							</tr><tr>
							<td></td>
						
								<td>
									<input type="password"  name="re_password" id="re_password"  placeholder="Confirm your Password"/></td>
								</tr>	<tr> 
								</tr>
						<tr><td colspan="3" >
							<input type="submit" name="submit"   value="Register" style=" width:50%; margin-left:25%   ; margin-right:25; background-color:blue;color:whitesmoke;" >
						</td>
						
							</tr>
						
							

						
					
							<tr>
							<td colspan="3" style="text-align:center;color:whitesmoke" >${message }
					</td></tr>

				</table>
				
					</form>
    <%} else{
    	response.sendRedirect("/UserOperation.jsp");
    } %> 
    
  
	</body>

</html>

		
				