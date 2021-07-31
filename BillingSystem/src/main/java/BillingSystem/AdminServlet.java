package BillingSystem;

import java.io.IOException;

import jakarta.servlet.*;
import jakarta.servlet.http.*;


public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       AdminManager adminManage=new AdminManager();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
       
}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int availableQuantity;
		String itemName,category,itemOffer;
		double price;	
		String submitType=request.getParameter("submit");
			itemName=request.getParameter("itemName");
			category=request.getParameter("category");
			availableQuantity=Integer.parseInt(request.getParameter("availableQuantity"));
			price=Double.parseDouble(request.getParameter("price"));
			itemOffer=request.getParameter("itemOffer");
			if(submitType.equals("ADD ITEM")) {
				
				
				adminManage.addItemList(itemName,category,price,availableQuantity,itemOffer);
				String message=" Item added successfully ";
				request.setAttribute("message", message);
				request.getRequestDispatcher("/AddItem.jsp").forward(request, response);
			}
			else if(submitType.equals("EDIT ITEM")) {
			
				int id;
				id=Integer.parseInt(request.getParameter("transferid"));
				adminManage.editItemList(id,category,price,availableQuantity,itemOffer);
				request.setAttribute("message", "Item Info Edited Succssfully");
				request.getRequestDispatcher("/AddItem.jsp").forward(request, response);
			}
			
			
		
		
	}

}
