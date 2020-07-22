
package controller.web.bandoan;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.ConnectionDB;
import model.MonAn;

public class webbandoan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public webbandoan() {
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
		
		
		try {
			String sql;
			sql="SELECT d.STT,d.TENMONAN,d.HINH,d.GIA,d.MOTA FROM doan d;";
			PreparedStatement ps = ConnectionDB.prepareStatement(sql);
			ResultSet rs =ps.executeQuery();
			List<MonAn> listMonAn = new ArrayList<MonAn>();
			while (rs.next()) {
				MonAn monAn = new MonAn();
				monAn.setSTT(rs.getString("STT"));
				monAn.setTENMONAN(rs.getString("TENMONAN"));
				monAn.setHINH(rs.getString("HINH"));
				monAn.setGIA(rs.getString("GIA"));
				monAn.setMOTA(rs.getString("MOTA"));
				listMonAn.add(monAn);
			}
			request.setAttribute("rs", rs);
			request.setAttribute("listMonAn", listMonAn);
			request.getRequestDispatcher("/web/htmlIndex/bandoan.jsp").include(request, response);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

}
