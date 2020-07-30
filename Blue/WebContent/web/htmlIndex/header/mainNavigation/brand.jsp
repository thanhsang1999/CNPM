<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="DB.ConnectionDB"%>
<%@page import="java.sql.Statement,java.sql.ResultSet,java.sql.SQLException"%>
	
<%
	{
		Statement s = ConnectionDB.createStatement();
		ResultSet rs = s.executeQuery("SELECT  * FROM brand");
		rs.last();
		if (rs.getRow() > 0) {
			rs.beforeFirst();
%>

<li class="hassubs"><a href="#">Thương hiệu điện thoại<i
		class="fas fa-chevron-right"></i></a>
	<ul>
		<%
			while (rs.next()) {
		%>
		<li><a
			href="<%=request.getContextPath() + "/brand?brand=" + rs.getString("ID_BRAND") + "&numberPage=0"%>"><%=rs.getString("BRAND")%><i
				class="fas fa-chevron-right"></i></a></li>
		<%
			}
		%>
	</ul></li>
<%
	}
		s.close();
	}
%>