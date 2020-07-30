package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

import DB.ConnectionDB;

public class User {
    String id;
    String uname;
    String pass;
    String hoten;
    int level;
    int active;
    String phone;
    String dia_chi;

    public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDia_chi() {
		return dia_chi;
	}

	public void setDia_chi(String dia_chi) {
		this.dia_chi = dia_chi;
	}

	public User() {
    }

    public User(String id, String uname, String pass, String hoten, int level, int active) {
        super();
        this.id = id;
        this.uname = uname;
        this.pass = pass;
        this.hoten = hoten;
        this.level = level;
        this.active = active;
    }

   

	public String getHoten() {
		return hoten;
	}

	public void setHoten(String hoten) {
		this.hoten = hoten;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int idGroup) {
        this.level = idGroup;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int hide) {
        this.active = hide;
    }
    public PreparedStatement getRecentlyViewed() {
    	PreparedStatement rs=null;
    	String sql = "SELECT `product`.ID_PRODUCT, IMG, `NAME`, PRICE, SALE_RATE, DATE_SUBMITTED FROM  (SELECT ID_PRODUCT FROM `recently_viewed`  WHERE ID_ACCOUNT=? ) A JOIN `product` ON A.ID_PRODUCT=`product`.ID_PRODUCT";
    	try {
			rs = ConnectionDB.prepareStatement(sql);
			rs.setString(1, this.getId());
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
    	return rs;
    }
    public User checkUpdateDatabase(HttpSession session) throws ClassNotFoundException, SQLException {
    	
    	String sql = "Select * from account where USERNAME=? and PASSWORD=?";
        ResultSet rs = null;
        
    	PreparedStatement ps= ConnectionDB.prepareStatement(sql);
    	ps.setString(1, this.getUname());
    	ps.setString(2, this.getPass());
        rs = ps.executeQuery();
        rs.last();
        int i = rs.getRow();
        if (rs != null && i == 1) {
                rs.first();
                User u= new User();
                u.setId(rs.getString("ID_ACCOUNT"));
                u.setUname(rs.getString("USERNAME"));
                u.setPass(rs.getString("PASSWORD"));
                u.setLevel(rs.getInt("LEVEL"));
                u.setActive(rs.getInt("ACTIVE"));
                u.setHoten(rs.getString("HO_TEN"));
//                u.setPhone(rs.getString("SDT"));
//                u.setDia_chi(rs.getString("DIA_CHI"));
                
                User userUpdated = new User();
                userUpdated.setId(rs.getString("ID_ACCOUNT"));
                userUpdated.setUname(rs.getString("USERNAME"));
                userUpdated.setPass(rs.getString("PASSWORD"));
                userUpdated.setHoten(rs.getString("HO_TEN"));
                session.setAttribute("user", userUpdated);
                ps.close();
                if(u.getActive()==0) {
                	session.removeAttribute("user");
                	return null;
                }
                return u;
                
                
        }      
           
            
       

    	return null;
    }
    public int deleteViewed(int tmp) throws ClassNotFoundException, SQLException {
    	String sql ="DELETE FROM recently_viewed WHERE ID_ACCOUNT = ? ORDER BY DATE_VIEW ASC LIMIT ?;";
		PreparedStatement ps = ConnectionDB.prepareStatement(sql);
		ps.setString(1, id);
		ps.setInt(2, tmp);
		
		int rs = ps.executeUpdate();
		ps.close();
		return rs;
		
	}
   
	public int updateCheckBoxCart(int checkall) throws ClassNotFoundException, SQLException {
		String sql = "UPDATE cart  SET CHECKBOX= ? WHERE ID_ACCOUNT = ? ;";
		PreparedStatement ps = ConnectionDB.prepareStatement(sql);
		ps.setInt(1,  checkall);
		ps.setString(2, this.id);
		ps.executeUpdate();
		
		ps.close();
		return checkall;
		
	}
	public ResultSet getInformation() throws ClassNotFoundException, SQLException {
		String sql = "SELECT ct_account.ID_ACCOUNT,ct_account.EMAIL, ct_account.SDT, ct_account.DIA_CHI, ct_account.NGAY_SINH,ct_account.GIOI_TINH, account.HO_TEN FROM ct_account JOIN account ON ct_account.ID_ACCOUNT= account.ID_ACCOUNT WHERE account.ID_ACCOUNT= ?;";
		PreparedStatement ps = ConnectionDB.prepareStatement(sql);
		ps.setString(1, this.id);
		return ps.executeQuery();
		
	}
	public ResultSet getInformationAccount() throws ClassNotFoundException, SQLException {
		String sql = "SELECT * FROM account WHERE ID_ACCOUNT = ?;";
		PreparedStatement ps = ConnectionDB.prepareStatement(sql);
		ps.setString(1, this.id);
		return ps.executeQuery();
		
	}
	public boolean checkAllCheckBoxCart() throws ClassNotFoundException, SQLException {
		String sql = "SELECT * FROM cart   WHERE ID_ACCOUNT = ? AND CHECKBOX= 0;";
		PreparedStatement ps = ConnectionDB.prepareStatement(sql);
		
		ps.setString(1, this.id);
		ResultSet rs= ps.executeQuery();
		if(rs.next()) {
			ps.close();
			return false;
		}
		ps.close();
		return true;
		
	}
	public int price() throws ClassNotFoundException, SQLException {
		int price=0;
		String sql = "SELECT SUM(A.PRICE) as PRICE FROM (SELECT (product.PRICE- product.PRICE*product.SALE_RATE/100)*cart.AMOUNT as PRICE FROM cart join product on cart.ID_PRODUCT=product.ID_PRODUCT WHERE cart.ID_ACCOUNT = ? AND CHECKBOX=1) A ;";
		PreparedStatement ps = ConnectionDB.prepareStatement(sql);
		ps.setString(1, this.getId());
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			price=rs.getInt("PRICE");
		}
		ps.close();
		return price;
	}
	public String order() throws SQLException  {
			
			Statement s;
			Connection c = null;
			try {
				s = ConnectionDB.createStatement();
				c = s.getConnection();
			
			c.setAutoCommit(false);
			ResultSet rs = s.executeQuery(
					"SELECT  ID_ORDER FROM `order` WHERE LENGTH(ID_ORDER) = (SELECT MAX(LENGTH(ID_ORDER)) FROM `order` ) ORDER BY ID_ORDER DESC LIMIT 0,1;");
			String ID_ORDER = "";
			
			if (rs.next()) {
				ID_ORDER = "DH" + (Integer.parseInt(rs.getString(1).replaceAll("[^0-9]", "")) + 1);
			} else {
				ID_ORDER="DH1";
			}
			s.close();
			String sql = "INSERT INTO  `order`  (`ID_ORDER`, `ID_USER` ,`HOTEN`,`DIACHI`,`SDT`)"
					+ " VALUES (?, ?,?,?,?)";
			PreparedStatement ps = ConnectionDB.prepareStatement(sql);
			ps.setString(1, ID_ORDER);
			ps.setString(2, this.getId());
			ps.setString(3, this.hoten);
			ps.setString(4, this.dia_chi);
			ps.setString(5, this.phone);
			
			
			int tmp = ps.executeUpdate();
			System.out.println((tmp == 1) ? "Update order success" : "Update order error");
			ps.close();
			sql = "INSERT INTO  `detail_order`  (`ID_ORDER`, `ID_PRODUCT`,`AMOUNT` )"
					+ " VALUES (?, ?, ?)";
			ps = ConnectionDB.prepareStatement(sql);
			ps.setString(1, ID_ORDER);
			
			String sql2="SELECT ID_PRODUCT, AMOUNT FROM cart WHERE ID_ACCOUNT = ?  AND CHECKBOX=1 ";
			 PreparedStatement ps2 = ConnectionDB.prepareStatement(sql2);
			 ps2.setString(1, this.id);
			ResultSet rs2= ps2 .executeQuery();
			while(rs2.next()) {
				ps.setString(2, rs2.getString(1));		
				ps.setInt(3, rs2.getInt(2));		
				tmp = ps.executeUpdate();
				System.out.println((tmp == 1) ? "Update detail_order success" : "Update detail_order error");
			}
			ps2.close();
			ps.close();
			sql2 = "UPDATE `order` SET PRICE = ? WHERE ID_ORDER=?";
			ps= ConnectionDB.prepareStatement(sql2);
			ps.setInt(1, this.price());
			ps.setString(2, ID_ORDER);
			ps.executeUpdate();
			ps.close();
			
			 sql2="DELETE FROM cart WHERE ID_ACCOUNT = ?  AND CHECKBOX=1;";
			 ps = ConnectionDB.prepareStatement(sql2);
			 ps.setString(1, this.id);
			 ps.executeUpdate();
			 ps.close();
			 
			} catch (ClassNotFoundException | SQLException e) {
				c.rollback();
				
				e.printStackTrace();
			}
			c.setAutoCommit(true);
		return "Success";
	}
	 public static void main(String[] args) throws SQLException, ClassNotFoundException {
			User u = new User("TK1", "hoang", "123", "Lê Tấn Hoàng", 5, 1);
			System.out.println(u.order());
		}

	public boolean remove() throws ClassNotFoundException, SQLException {
		
		String sql ="DELETE FROM account WHERE ID_ACCOUNT=?;";
		PreparedStatement ps = ConnectionDB.prepareStatement(sql);
		Connection c = ps.getConnection();
		c.setAutoCommit(false);
		int rs=0;
		ps.setString(1, this.getId());
		
		rs= ps.executeUpdate();
		if(rs==0) {
			c.rollback();
			c.setAutoCommit(true);
			return false;
		}
		sql= "DELETE FROM ct_account WHERE ID_ACCOUNT=?;";
		ps = ConnectionDB.prepareStatement(sql);
		ps.setString(1, this.getId());
		rs =ps.executeUpdate();
		if(rs==0) {
			c.rollback();
			c.setAutoCommit(true);
			return false;
		}
		c.setAutoCommit(true);
		return true;
	}
	public PreparedStatement updateLevelVaActiveAccount(String id,String level,String active) {
		String sql = "update account set `LEVEL`=?,ACTIVE=? WHERE ID_ACCOUNT=?;";
		try {
			PreparedStatement pre = ConnectionDB.prepareStatement(sql);
			pre.setString(1, level);
			pre.setString(2, active);
			pre.setString(3, id);
			pre.executeUpdate();
			return pre;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	public String getDiaChiAccount(String id) throws SQLException, ClassNotFoundException{
		PreparedStatement getDiaChi = ConnectionDB.prepareStatement("SELECT ct_account.DIA_CHI FROM ct_account WHERE ID_ACCOUNT=?;");
		getDiaChi.setString(1, id);
		ResultSet rsdiachi = getDiaChi.executeQuery();
		rsdiachi.first();
		String rs = rsdiachi.getString(1);
		return rs;
	}
	
}
