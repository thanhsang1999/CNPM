<%@page import="model.Tools"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Cart -->
<%{ %>
<div class="cart">
	<div class="cart_container d-flex flex-row align-items-center justify-content-end">
		<div class="cart_icon">
			<img src=<%=request.getContextPath()+ "/web/images/cart.png"%> alt="">
			<div class="cart_count"><span><%=(int)request.getAttribute("count") %></span></div>
		</div>
		<div class="cart_content">
			<div class="cart_text"><a href=<%=request.getContextPath()+ "/web/cart"%>>Giỏ Hàng</a></div>
			<div class="cart_price"><%=Tools.getPrice((int)request.getAttribute("price")) %></div>
		</div>
	</div>
</div>
<%} %>