package BillingSystem;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

/**
 * Servlet implementation class UserOrderServlet
 */
public class UserOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CustomerManager custManage=new CustomerManager();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserOrderServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String submitValue= request.getParameter("submit").toString();
		  response.setContentType("text/html");  
	        PrintWriter out=response.getWriter();  
	          
	        HttpSession session=request.getSession(false);  
			String username=(String)session.getAttribute("user");

	        if(session!=null||request.getParameter("itemId")!=null) {
	        
			if(submitValue.equals("Conitnue Shopping")) {
				request.getRequestDispatcher("/UserOperation.jsp").include(request, response);
				
			}
			else if(submitValue.equals("Confirm")) {
				custManage.VerifyAndPlaceOrder(username);
				request.setAttribute("message", "Order placed with the availability");
				request.getRequestDispatcher("/Orders.jsp").include(request, response); 
				
			}
			else{
				
			int itemId=Integer.parseInt(request.getParameter("itemId"));
			custManage.deleteCartValue(itemId,username);
			request.setAttribute("message", "Item removed successfully");
			request.getRequestDispatcher("/UserCart.jsp").include(request, response); 
		}}
		else {
			request.setAttribute("message", "No product in cart");
			request.getRequestDispatcher("/UserCart.jsp").include(request, response); 
		}
	}

}
