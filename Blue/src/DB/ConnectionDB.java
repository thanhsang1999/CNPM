package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class ConnectionDB {
    public static Connection con;

    public static Statement createStatement() throws ClassNotFoundException, SQLException  {
        if (con==null||con.isClosed()) {
            Class.forName("com.mysql.jdbc.Driver");
//            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blue?useUnicode=true&characterEncoding=utf-8", "root", "");
//            con = DriverManager.getConnection("jdbc:mysql://node231729-cnpm2020.j.layershift.co.uk/webbandoan?useUnicode=true&characterEncoding=utf-8", "root", "BFAcbz45806");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webbandoan?useUnicode=true&characterEncoding=utf-8", "root", "");
            return con.createStatement();
        } else {
            return con.createStatement();
        }
    }
    public static PreparedStatement prepareStatement(String sql) throws ClassNotFoundException, SQLException  {
    	if (con==null||con.isClosed()) {
    		Class.forName("com.mysql.jdbc.Driver");
//    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useUnicode=true&characterEncoding=utf-8", "root", "");
//    		con = DriverManager.getConnection("jdbc:mysql://node231729-cnpm2020.j.layershift.co.uk/webbandoan?useUnicode=true&characterEncoding=utf-8", "root", "BFAcbz45806");
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webbandoan?useUnicode=true&characterEncoding=utf-8", "root", "");
    		return con.prepareStatement(sql);
    	} else {
    		return con.prepareStatement(sql);
    	}
    	
    }
}
