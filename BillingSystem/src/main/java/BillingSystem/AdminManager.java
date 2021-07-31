package BillingSystem;

import java.util.ArrayList;


public class AdminManager {
	static DatabaseManager dataManage=new DatabaseManager();
	public boolean verifyAdmin(String userName, String password) {
		String enpwd="",pwd="";
		enpwd=dataManage.getAdminPassword(userName);
		if(!password.equals("")) {
			pwd=CustomerManager.decryptPassword(enpwd);
		}
		if(pwd.equals(password)) {
			return true;
		}
		return false;
	}
	public boolean verifyItemIdAvailable(int itemId) {
		int id=dataManage.getMaxItemId();
		if(id>itemId) {
			return false;
		}
		return true;
	}
	public void addItemList(String itemName, String category, double price, int availableQuantity,
			String itemOffer) {

		dataManage.addNewItem(itemName,category,price,availableQuantity,itemOffer);
	}
	public ArrayList<Item> getItemList() {
		ArrayList<Item> item=dataManage.getItemList();
		return item;
	}
	public void editItemList(int id, String category, double price, int availableQuantity, String itemOffer) {
		dataManage.editItemList(id,category,price,availableQuantity,itemOffer);
	}
		
		
}

