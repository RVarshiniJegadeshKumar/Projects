package BillingSystem;

import java.util.ArrayList;

public class CustomerManager {

	static	DatabaseManager dataManage=new DatabaseManager();
	public int verifyUser(String userName, String password) {
		String enpwd="",pwd="";
		enpwd=dataManage.getUserPassword(userName);
		if(!password.equals("")) {
			pwd=decryptPassword(enpwd);
		}
		if(pwd.equals(password)) {
			int id=dataManage.getUserId(userName);
			System.out.println(id);
			return id;
		}
		
		return 0;
	}
	public static  String decryptPassword(String password) {
		String decryptedString="";
		for(int i=0;i<password.length();i++) {
			if(password.charAt(i)>='a'&&password.charAt(i)<='z') {
				if(password.charAt(i)=='a') {
					decryptedString+=(char)'z';
					System.out.println(decryptedString);
				}
				else
				{
					decryptedString+=(char)(password.charAt(i)-1);
					
				}
			}
			else if(password.charAt(i)>='A'&&password.charAt(i)<='Z') {
				if(password.charAt(i)=='A') {
					decryptedString+=(char)'Z';
					
				}
				else
				{
					decryptedString+=(char)(password.charAt(i)-1);
				}
			}
			else if(password.charAt(i)>='0'&&password.charAt(i)<='9') {
				if(password.charAt(i)=='0') {
					decryptedString+=(char)'9';
				}
				else
				{
					decryptedString+=(char)(password.charAt(i)-1);
				}
			}
			else {
				return "";
			}
		}
			return decryptedString;
		
	}
	public int addUserDetails(String userName, String password) {
			int result=0;
			boolean verify=false;
			password=encryptPassword(password);
			
			if(password.equals("")) {
				return 2;
			}else {
				verify=dataManage.addUserDetails(userName,password);
				if(verify) {
					return 1;
				}
				else {
					return 3;
				}
			}
		
	}
	private String encryptPassword(String password) {
		String encryptedString="";
		for(int i=0;i<password.length();i++) {
			if(password.charAt(i)>='a'&&password.charAt(i)<='z') {
				if(password.charAt(i)=='z') {
					encryptedString+='a';
				}
				else
				{
					encryptedString+=(char)(password.charAt(i)+1);
				}
			}
			else if(password.charAt(i)>='A'&&password.charAt(i)<='Z') {
				if(password.charAt(i)=='Z') {
					encryptedString+='A';
				}
				else
				{
					encryptedString+=(char)(password.charAt(i)+1);
				}
			}
			else if(password.charAt(i)>='0'&&password.charAt(i)<='9') {
				if(password.charAt(i)=='9') {
					encryptedString+='0';
				}
				else
				{
					encryptedString+=(char)(password.charAt(i)+1);
				}
			}
			else
			{
				encryptedString="";
				break;
			}
		}
			return encryptedString;

	}
	public ArrayList<Item> getItemList() {
		ArrayList<Item> item=dataManage.getItemList();
		return item;
	}
	public void cartUpdate(int itemId, String username, int quantity) {
		System.out.println("cart");
		dataManage.cartUpdate(itemId,username,quantity);
	}
	public void deleteCartValue(int itemId, String username) {
		dataManage.deleteCartValue(itemId,username);
	}
	public void VerifyAndPlaceOrder( String username) {
		dataManage.verify(username);
	}
	public int getAvaiableQuantity(int itemId) {
		
		// TODO Auto-generated method stub
		return dataManage.getAvaiableQuantity(itemId);
	}


}
