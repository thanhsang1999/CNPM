<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DB.ConnectionDB"%>
<%@page
	import="java.sql.Statement,java.sql.ResultSet,java.sql.SQLException"%>
<%
	{
		Statement s = ConnectionDB.createStatement();
		ResultSet rs = s.executeQuery("SELECT  * FROM hedieuhanh");
		rs.last();
		if (rs.getRow() > 0) {
			rs.beforeFirst();
%>
<li class="hassubs"><a href="#">Hệ Điều Hành<i
		class="fas fa-chevron-right"></i></a>
	<ul>
		<%
			while (rs.next()) {
		%>
		<li><a
			href="<%=request.getContextPath() + "/web/hedieuhanh?hedieuhanh=" + rs.getString("OS")
								+ "&numberPage=0"%>"><%=rs.getString("OS")%><i class="fas fa-chevron-right"></i></a></li>
		<%
			}
		%>

	</ul></li>
<%
	}
		s.close();
	}
%>