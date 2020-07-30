package controller.web;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DB.ConnectionDB;
import model.Date;
import model.Tools;
import model.User;
@WebServlet("/web/thongtinnguoidung")
public class thongtinnguoidung extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public thongtinnguoidung() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		todo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		todo(request, response);
	}

	private void todo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String nname;
		String nemail;
		String nsdt;
		String ndiaChi;
		int gioiTinh=0;
		String date;
		User u = (User) request.getSession().getAttribute("user");
		try {
			u=u.checkUpdateDatabase(request.getSession());
			if(u==null) {
				System.out.println("Tài khoản bị vô hiệu hoá.");
				return;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		nname = request.getParameter("nname");
		if (nname!=null) {
			nname = Tools.getParameter(request, "nname");
					
			nemail = Tools.getParameter(request,"nemail");
			nsdt = Tools.getParameter(request,"nsdt");
			ndiaChi = Tools.getParameter(request,"ndiaChi");
			String gioiTinhStr = Tools.getParameter(request,"gioi-tinh");
			System.out.println("Giới tính: "+gioiTinhStr);
			if (gioiTinhStr.matches("[^0-9]{1,}")) {
				gioiTinh = 1;
			}else {					
				gioiTinh= Integer.parseInt(gioiTinhStr);
			}
			date =Tools.getParameter(request,"date");
			System.out.println(date);
			if(date.matches("\\d{1,2}/\\d{1,2}/\\d{1,4}")) {
				String[] dateStr= date.split("/");
				Date dddd = new Date(dateStr[2]+"-"+dateStr[1]+"-"+dateStr[0]+" 00:00:00.0");
				date=dddd.getStringByFormat("YYYY-MM-DD hh:mm:ss");
				
			} else date=null;
			String sql="UPDATE ct_account JOIN account ON ct_account.ID_ACCOUNT= account.ID_ACCOUNT  SET "+
			"account.HO_TEN=?, ct_account.EMAIL =?, ct_account.SDT=?, ct_account.DIA_CHI=?, ct_account.NGAY_SINH=?,ct_account.GIOI_TINH=?"+
			" WHERE account.ID_ACCOUNT= ?;";
			PreparedStatement ps;
			try {
				ps = ConnectionDB.prepareStatement(sql);
				ps.setString(1, nname);
				ps.setString(2, nemail);
				ps.setString(3, nsdt);
				ps.setString(4, ndiaChi);
				ps.setString(5, date);
				ps.setInt(6, gioiTinh);
				ps.setString(7, u.getId());
				ps.executeUpdate();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
		} 
		
			try {
				ResultSet rs =u.getInformation();
				request.setAttribute("rs", rs);
				request.getRequestDispatcher("/web/thongtin.jsp").forward(request, response);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		

		
	}

}
