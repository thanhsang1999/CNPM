<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="model.User"%>
<!-- Top Bar -->
<head>
<link rel="stylesheet" type="text/css" href=<%=request.getContextPath()+ "/web/styles/style.css"%>>
</head>

<div class="top_bar">
	<div class="container">
		<div class="row">
			<div class="col d-flex flex-row">
				<div class="top_bar_contact_item">
					<div class="top_bar_icon"><img src=<%=request.getContextPath()+ "/web/images/phone.png"%> alt=""></div>+84 37509 4399
				</div>
				<div class="top_bar_contact_item">
					<div class="top_bar_icon"><img src=<%=request.getContextPath()+ "/web/images/mail.png"%> alt=""></div><a
						href="mailto:fastsales@gmail.com">17130190@st.hcmuaf.edu.vn</a>
				</div>
				<div class="top_bar_content ml-auto">
					<div class="top_bar_menu"></div>
				</div>
				<div class="top_bar_user">
					<%User u;
					if((u = (User) session.getAttribute("user"))==null) {%>
					<div class="user_icon"><img src=<%=request.getContextPath()+ "/web/images/user.svg" %> alt=""></div>
					<div><a href="#" data-toggle="modal" data-target="#myModalSignUp" >Đăng Kí</a></div>
					<div><a href="#" data-toggle="modal" data-target="#myModal">Đăng Nhập</a></div>
					<%} else { %>
						<i class="far fa-user"></i>
						<div><a href="#"><%=u.getHoten() %></a></div>
						<div class="bang-thong-tin-tai-khoan">
							<a href="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+ "/web/thongtinnguoidung" %>">Thông Tin Tài Khoản</a>
							<a href="<%=request.getContextPath()+"/web/yeuthich"%>">Yêu Thích</a>
							<a href="<%=request.getContextPath()+"/web/donhang"%>">Đơn Hàng</a>
							<a href="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+ "/logout" %>">Đăng Xuất</a>
						</div>
					<%}  %>
				</div>
			</div>
		</div>
	</div>
</div>