<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<li class="hassubs"><a href="#">Khoảng giá điện thoại<i
		class="fas fa-chevron-right"></i></a>
	<ul>
		<li><a href="<%=request.getContextPath()+"/web/price?top=5000000&numberPage=0"%>">Dưới 5 triệu<i class="fas fa-chevron-right"></i></a>
		</li>
		<li><a href="<%=request.getContextPath()+"/web/price?bot=5000000&top=10000000&numberPage=0"%>">5 đến 10 triệu<i class="fas fa-chevron-right"></i></a>
		</li>
		<li><a href="<%=request.getContextPath()+"/web/price?bot=10000000&top=15000000&numberPage=0"%>">10 đến 15 triệu<i
				class="fas fa-chevron-right"></i></a></li>
		<li><a href="<%=request.getContextPath()+"/web/price?bot=15000000&top=20000000&numberPage=0"%>">15 đến 20 triệu<i
				class="fas fa-chevron-right"></i></a></li>
		<li><a href="<%=request.getContextPath()+"/web/price?bot=20000000&numberPage=0"%>">Trên 20 triệu<i class="fas fa-chevron-right"></i></a>
		</li>
	</ul></li>
