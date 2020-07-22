package model;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import DB.ConnectionDB;
public class Tools {
	public static String getOS(HttpServletRequest request) {
		String headerUserAgent =request.getHeader("User-Agent");
		String os="";
		if (headerUserAgent.toLowerCase().indexOf("windows") >= 0 )
        {
            os = "Windows";
        } else if(headerUserAgent.toLowerCase().indexOf("mac") >= 0)
        {
            os = "Mac";
        } else if(headerUserAgent.toLowerCase().indexOf("x11") >= 0)
        {
            os = "Unix";
        } else if(headerUserAgent.toLowerCase().indexOf("android") >= 0)
        {
            os = "Android";
        } else if(headerUserAgent.toLowerCase().indexOf("iphone") >= 0)
        {
            os = "IPhone";
        }else{
            os = "UnKnown";
        }
		update(os);
		return os;		
	}
	public static synchronized int update(String os) {
		int rs2=0;
		try {
			Statement s= ConnectionDB.createStatement();
			ResultSet rs= s.executeQuery("SELECT * FROM os WHERE OS=\""+os+"\"");
			rs.next();
			int number = rs.getInt("NUMBER");
			rs2=s.executeUpdate("UPDATE os SET NUMBER="+(++number)+" WHERE OS=\""+os+"\"");
			s.close();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return rs2;
	}
	
	public static  int[] percent() {
		int[] rs2= new int[6];
		int sum=0;
		try {
			Statement s= ConnectionDB.createStatement();
			ResultSet rs= s.executeQuery("SELECT * FROM os" );
			while (rs.next()) {
				String key = rs.getString("OS");
				switch (key) {
				case "Windows":
					rs2[0]=rs.getInt("NUMBER");
					sum+=rs2[0];
					break;
				case "Android":
					rs2[1]=rs.getInt("NUMBER");
					sum+=rs2[1];
					break;
				case "IPhone":
					rs2[2]=rs.getInt("NUMBER");
					sum+=rs2[2];
					break;
				case "Mac":
					rs2[3]=rs.getInt("NUMBER");
					sum+=rs2[3];
					break;
				case "Unix":
					rs2[4]=rs.getInt("NUMBER");
					sum+=rs2[4];
					break;

				default:
					rs2[5]=rs.getInt("NUMBER");
					sum+=rs2[5];
					break;
				}
			}
			
			
			s.close();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		for (int i = 0; i < rs2.length; i++) {
			rs2[i]=rs2[i]*100/sum;
		}
		return rs2;
	}
	public static String[] getNameProducts() {
		String []rs2 = null;
		try {
			Statement s= ConnectionDB.createStatement();
			ResultSet rs= s.executeQuery("SELECT NAME FROM product");
			rs.last();
			rs2= new String[rs.getRow()];
			rs.beforeFirst();
			int i=0;
			while (rs.next()) {
				rs2[i++]="\""+rs.getString("NAME")+"\"";
				
			}
			
			
			s.close();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return rs2;
	}
	public static int checkLogin(HttpSession session) {
		User u=(User) session.getAttribute("user");
		return (u==null||u.getActive()!=1)?-1:u.getLevel();
	}
	public static String getPrice(int number) {
		DecimalFormat df = new DecimalFormat("###,###.###");
		String rs=df.format(number).replace(".", "-");
		 rs=rs.replace(",", ".");
		 rs=rs.replace("-", ",");
		return rs+" đ";
	}
	public static Product getProduct(String[] nameFields, ResultSet rs) throws SQLException {
		Product p = new Product();
		for (int i = 0; i < nameFields.length; i++) {
			switch (nameFields[i]) {
			case "NAME":
				p.setNAME(rs.getString(nameFields[i]));
				break;
			case "ID_BRAND":
				p.setID_BRAND(rs.getString(nameFields[i]));
				break;
			case "ID_PRODUCT":
				p.setID_PRODUCT(rs.getString(nameFields[i]));
				break;
			case "IMG":
				p.setIMG(rs.getString(nameFields[i]));
				break;
			case "IMG2":
				p.setIMG2(rs.getString(nameFields[i]));
				break;
			case "IMG3":
				p.setIMG3(rs.getString(nameFields[i]));
				break;
			case "PRICE":
				p.setPRICE(rs.getInt(nameFields[i]));
				break;
			case "SALE_RATE":
				p.setSALE_RATE(rs.getInt(nameFields[i]));
				break;
			case "MEMORY":
				p.setMEMORY(rs.getInt(nameFields[i]));
				break;
			case "RAM":
				p.setRAM(rs.getInt(nameFields[i]));
				break;
			case "AMOUNT":
				p.setAMOUNT(rs.getInt(nameFields[i]));
				break;
			case "DESCRIPTION":
				p.setDESCRIPTION(rs.getString(nameFields[i]));
				break;
			
			default:
				break;
			}
		}
		
		return p;
		
	}
	public static String getParameter(HttpServletRequest request, String parameter) {
		String rs=
		(request.getParameter(parameter)==null)?"":request.getParameter(parameter);
		return rs.trim();
	}
	public static void main(String[] args) {
		System.out.println(Arrays.toString(getNameProducts()));
	}
}
