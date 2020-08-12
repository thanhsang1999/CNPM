package controller.web.page.index;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB.ConnectionDB;
import model.MD5;
import model.User;


@WebServlet("/web/loginFB")
public class loginFB extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// khai báo biến id và name
	String id;
	String name;

    public loginFB() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// set mã hóa ký từ client lên server và từ server trả về có định dạng UTF-8
		request.setCharacterEncoding("utf8");
        response.setCharacterEncoding("utf8");
        response.setContentType("text/html;charset=utf-8");
        // lấy dữ liệu từ client, bao gồm Id của người dùng Facebook và tên của người dùng facebook
			 id=request.getParameter("idFace");
			 name = request.getParameter("nameFace");
		// kiểm tra xem id và name có rỗng không
		if(id!=null&&name!=null) {
            checkAndCreateAccount(request,response);
		}
			
	}

	/**
	 * kiểm tra nếu tài khoản đã tồn tại trong hệ thông rồi thì đăng nhập, còn không
	 * thì tạo mới
	 */
	private void checkAndCreateAccount(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String sql = "Select * from account where USERNAME=?";
		String sqlcount = "SELECT COUNT(*) FROM `account`";

		ResultSet rs = null;
		User userss = new User();
		String sqlin = "INSERT INTO `account` VALUES (?,?,?,?,?,?);";
		String sql_ct_account = "INSERT INTO `ct_account`(ID_ACCOUNT,EMAIL) VALUES (?,?);";
		try {
			Statement statement = ConnectionDB.createStatement();
			ResultSet rscount = statement.executeQuery(sqlcount);
			rscount.first();
			int count = rscount.getInt(1);
			System.out.println(count);
			PreparedStatement ps = ConnectionDB.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			rs.last();
			int tmpcountaccount = rs.getRow();
			rs.first();
			// kiểm tra tài khoản đã tồn tại trong database hay chưa
			if ((tmpcountaccount == 0)) {
				// tạo mới tài khoản
				PreparedStatement adddkDTB = ConnectionDB.prepareStatement(sqlin);
				PreparedStatement addCTACDTB = ConnectionDB.prepareStatement(sql_ct_account);
				String idAc = "TK" + (count + 1);
				adddkDTB.setString(1, idAc);
				adddkDTB.setString(2, id);
				adddkDTB.setString(3, null);
				adddkDTB.setString(4, name);
				adddkDTB.setString(5, "5");
				adddkDTB.setString(6, "1");
				adddkDTB.executeUpdate();
				addCTACDTB.setString(1, idAc);
				addCTACDTB.setString(2, null);
				addCTACDTB.executeUpdate();
				HttpSession session = request.getSession();
				userss.setId("TK" + (count + 1));
				userss.setUname(id);
				userss.setPass(null);
				userss.setHoten(name);
				userss.setLevel(5);
				userss.setActive(1);
				session.setAttribute("user", userss);
				// trả về client thông báo đăng nhập thành công
				response.getWriter().write("okFB");
			} else {
				//nếu tồn tại thì đăng nhập
				String sql1 = "Select * from account where USERNAME=?";
				PreparedStatement ps1= ConnectionDB.prepareStatement(sql1);
				ps1.setString(1, id);
	            rs = ps1.executeQuery();
	            rs.last();
	            int i = rs.getRow();
	            if (rs != null && i == 1) {
	                rs.first();
	                User u= new User();
	                u.setId(rs.getString("ID_ACCOUNT"));
	                u.setUname(rs.getString("USERNAME"));
	                u.setHoten(rs.getString("HO_TEN"));
	                HttpSession session = request.getSession();
	                session.setAttribute("user", u);
	            }
	                ps.close();
	             // trả về client thông báo đăng nhập thành công
	                response.getWriter().write("okFB");
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
