package BillingSystem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DatabaseManager {
	public DatabaseManager() {
		connect();
	}
	static Connection connect;
	static Statement statement;
	static ResultSet resultSet;
	static PreparedStatement prepareStatement;

	public static void connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/BillingSystem", "root", "123456");
			statement = connect.createStatement();
		}
		catch (Exception e) {

			System.out.println("Connection failed");
		}

}

	public String getUserPassword(String userName) {
		String password="";
		try {
			resultSet=statement
			.executeQuery("SELECT password from user where username='"+userName+"';");
			if(resultSet.next()) {
				
				password=resultSet.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return password;
	}

	public String getAdminPassword(String userName) {
		String password="";
		try {
			resultSet=statement
			.executeQuery("SELECT password from admin where username='"+userName+"';");
			if(resultSet.next()) {
				
				password=resultSet.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return password;
	}

	public boolean addUserDetails(String userName, String password) {
		int id;
		try {
			resultSet=statement.executeQuery("Select max(custId) from user;");
			if(resultSet.next())
				{
				id=resultSet.getInt(1);
				id++;
				}
			else
			{
				id=101;
			}
			statement.executeUpdate("Insert into user(custId,username,password) values("+id+",'"+userName+"','"+password+"');");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public int getMaxItemId() {
		int id=0;
		try {
			resultSet=statement.executeQuery("Select max(itemId) from item;");
			if(resultSet.next())
				{
				id=resultSet.getInt(1);
				id++;
				}
			else {
				id=0;}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();}
		return id;
	
	}

	public void addNewItem( String itemName, String category, double price, int availableQuantity,
			String itemOffer) {
		try {
			int itemId=1;
			resultSet=statement.executeQuery("Select max(itemId) from item;");
			if(resultSet.next())
				{
				itemId=resultSet.getInt(1);
				itemId++;
				}
			prepareStatement = connect
					.prepareStatement("INSERT INTO item values(?,?,?,?,?,?);");
			prepareStatement.setInt(1,itemId);
			prepareStatement.setString(2,itemName);
			prepareStatement.setString(3,category);
			prepareStatement.setDouble(4, price);
			prepareStatement.setInt(5, availableQuantity);
			prepareStatement.setString(6, itemOffer);  
			prepareStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
						
	}

	public ArrayList<Item> getItemList() {
		ArrayList<Item> list=new ArrayList<Item>();
		try {
			resultSet=statement
					.executeQuery("SELECT *  from item;");
			while(resultSet.next()) {
			Item i=new Item(resultSet.getInt(1),resultSet.getString(2),resultSet.getString(3),resultSet.getDouble(4),resultSet.getInt(5),resultSet.getString(6));
			list.add(i);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}

	public void editItemList(int id, String category, double price, int availableQuantity, String itemOffer) {
		try {
			statement.executeUpdate("UPDATE item SET itemname = '"+category+"',price ="+price+",availablequantity="+availableQuantity+",itemOffer = '"+itemOffer+"'	WHERE itemId ="+id+";");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}

	public void cartUpdate(int itemId, String username, int quantity) {
		
			double price=1;
			try {
				resultSet=statement.executeQuery("select price from item where itemId="+itemId+";");
				if(resultSet.next()) {
					price=resultSet.getDouble(1);
				}
				price*=quantity;
				resultSet=statement.executeQuery("Select * from cart where username='"+username+"' and itemId="+itemId+";");
			if(resultSet.next()) {
				quantity+=resultSet.getInt(3);
				price+=resultSet.getDouble(4);
				statement.executeUpdate("update  cart set quantity="+quantity+",total="+price+" where username='"+username+"';");
			}
			else
			{
				statement.executeUpdate("Insert into cart(itemId,username,quantity,total) values("+itemId+",'"+username+"',"+quantity+","+price+");");
				System.out.println(price);			}
					} catch (SQLException e) {
			e.printStackTrace();
		}
			
	}

	public void updateAvailableQuantity(int itemId, int quantity) {
		try {
			prepareStatement=connect.prepareStatement("update item set availablequantity=? where itemId=?;");
			prepareStatement.setInt(1, quantity);
			prepareStatement.setInt(2, itemId);
			prepareStatement.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}

	public int getUserId(String userName) {
		try {
			resultSet=statement
					.executeQuery("SELECT custId from user where username='"+userName+"';");
			if(resultSet.next()) {
				
				 return resultSet.getInt(1);
			}		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				return 0;
	}

	public void deleteCartValue(int itemId, String username) {
		try {
			statement
			.execute("DELETE FROM cart where itemId="+itemId+" and username='"+username+"';");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

	public void placeOrder( String username) {
		try {
			String offerapplied="Yes";
			System.out.println("place order");			int id=1;
			resultSet=statement.executeQuery("Select max(orderId) from orders;");
			if(resultSet.next()) {
				id=resultSet.getInt(1);
				id++;
			}
			resultSet=statement.executeQuery("Select * from orders where username='"+username+"';");
			if(resultSet.next()) {
				offerapplied="No";
			}
			
			statement.execute("Insert into orders (orderId,username,itemId,quantity,price,offerapplied)   values("+id+",'"+username+"',0,0,0,'"+offerapplied+"');");
			
			statement.execute("UPDATE orders INNER JOIN cart ON (orders.username = cart.username)  SET orders.itemId = cart.itemId,orders.quantity= cart.quantity,orders.price= cart.total;;");
			
			deleteEntireCartValues(username);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void deleteEntireCartValues(String username) {
		try {
			statement
			.execute("DELETE FROM cart where  username='"+username+"';");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}

	public void verify( String username) {
		try {
			resultSet=statement
					.executeQuery("SELECT item.availablequantity,cart.quantity,item.price,item.itemId from item join cart where item.itemId=cart.itemId;");
			
			while(resultSet.next()) {
				int quantity=0,itemId;
						itemId=resultSet.getInt(4);
				if(resultSet.getInt(1)<resultSet.getInt(2)) {
					int q=resultSet.getInt(1)+(resultSet.getInt(1)-resultSet.getInt(2));
					double p=q*resultSet.getInt(3);
					prepareStatement=connect.prepareStatement("update cart set quantity=?,total=? where itemId=?;");
					prepareStatement.setInt(1, q);
					prepareStatement.setDouble(2, p);
					prepareStatement.setInt(3, resultSet.getInt(4));
					prepareStatement.execute();
					quantity=q;
				}
				else
				{
					quantity=resultSet.getInt(2);
				}
				quantity=resultSet.getInt(1)-resultSet.getInt(2);
				updateAvailableQuantity(itemId,quantity);
			}
			placeOrder(  username);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int getAvaiableQuantity(int itemId) {
		try {
			resultSet=statement
					.executeQuery("SELECT availablequantity from item where itemId="+itemId+";");
			if(resultSet.next()) {
				
				 return resultSet.getInt(1);
			}		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				return 0;
	}

}

