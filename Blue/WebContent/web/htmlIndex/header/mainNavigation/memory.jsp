<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DB.ConnectionDB"%>
<%@page
	import="java.sql.Statement,java.sql.ResultSet,java.sql.SQLException"%>
<%
	{
		Statement s = ConnectionDB.createStatement();
		ResultSet rs = s.executeQuery("SELECT  * FROM memory");
		rs.last();
		if (rs.getRow() > 0) {
			rs.beforeFirst();
%>
<li class="hassubs"><a href="#">Bộ nhớ điện thoại<i
		class="fas fa-chevron-right"></i></a>
	<ul>
		<%
			while (rs.next()) {
		%>
		<li><a
			href="<%=request.getContextPath() + "/web/memory?MEMORY=" + rs.getString("MEMORY")
								+ "&numberPage=0"%>"><%=rs.getString("MEMORY")%>
				GB<i class="fas fa-chevron-right"></i></a></li>
		<%
			}
		%>

	</ul></li>
<%
	}
		s.close();
	}
%>