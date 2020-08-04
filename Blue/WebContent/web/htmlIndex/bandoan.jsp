<%@page import="java.sql.ResultSet,java.util.*,controller.*,model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%{
		ResultSet rs = (ResultSet) request.getAttribute("rs");
 		ArrayList<MonAn> listMonAn = (ArrayList<MonAn>) request.getAttribute("listMonAn"); 
	%>
<div class="banner">
	<div class="banner_background"
		style="background-image: url(web/images/banner_background.jpg)"></div>
	<div class="container fill_height">
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-sm-11 col-lg-9 ">
				<div id="carouselId" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselId" data-slide-to="0" class="active"></li>
						<li data-target="#carouselId" data-slide-to="1"></li>
						<li data-target="#carouselId" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img src="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/web/img_bandoan/slide1.png"%>" alt="First slide">
						</div>
						<div class="carousel-item">
							<img src="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/web/img_bandoan/slide2.png"%>"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img src="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/web/img_bandoan/slide3.png"%>"
								alt="Third slide">
						</div>
						<a class="carousel-control-prev" href="#carouselId" role="button"
							data-slide="prev"> <span class="carousel-control-prev-icon"
							aria-hidden="true"></span> <span class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carouselId" role="button"
							data-slide="next"> <span class="carousel-control-next-icon"
							aria-hidden="true"></span> <span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Characteristics -->
<div class="characteristics">
	<div class="container">
		<div class="row">
			<!-- Char. Item -->
			<div class="col-lg-3 col-md-6 char_col">
				<div
					class="char_item d-flex flex-row align-items-center justify-content-start">
					<div class="char_icon">
						<img src="/Blue/web/images/char_1.png" alt="">
					</div>
					<div class="char_content">
						<div class="char_title">Miễn Phí Vận Chuyển</div>
						<div class="char_subtitle">tất cả đơn hàng</div>
					</div>
				</div>
			</div>
			<!-- Char. Item -->
			<div class="col-lg-3 col-md-6 char_col">
				<div
					class="char_item d-flex flex-row align-items-center justify-content-start">
					<div class="char_icon">
						<img src="/Blue/web/images/char_2.png" alt="">
					</div>
					<div class="char_content">
						<div class="char_title">Đổi Trả Miễn Phí</div>
						<div class="char_subtitle">trong 2 tiếng</div>
					</div>
				</div>
			</div>
			<!-- Char. Item -->
			<div class="col-lg-3 col-md-6 char_col">
				<div
					class="char_item d-flex flex-row align-items-center justify-content-start">
					<div class="char_icon">
						<img src="/Blue/web/images/char_3.png" alt="">
					</div>
					<div class="char_content">
						<div class="char_title">Trả Sau</div>
						<div class="char_subtitle">Không phụ phí</div>
					</div>
				</div>
			</div>
			<!-- Char. Item -->
			<div class="col-lg-3 col-md-6 char_col">
				<div
					class="char_item d-flex flex-row align-items-center justify-content-start">
					<div class="char_icon">
						<img src="/Blue/web/images/char_4.png" alt="">
					</div>
					<div class="char_content">
						<div class="char_title">Rẻ Vô Địch</div>
						<div class="char_subtitle">can kết giá thấp nhất</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Deals of the week -->
<div class="deals_featured">
	<div class="container">
		<div class="row">
			<div
				class="col d-flex flex-lg-row flex-column align-items-center justify-content-start">
				<!-- Deals -->
				<div class="deals">
					<div class="deals_title">Giảm Giá Tuần</div>
					<div class="deals_slider_container">
						<!-- Deals Slider -->
						<div class="owl-carousel owl-theme deals_slider">
							<!-- Deals Item -->
							<div class="owl-item deals_item">
								<div class="deals_image">
								<% { 
											int tmpRandom = (int) (Math.random()*listMonAn.size());
										%>
									<img
										src="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+ "/web/img_bandoan/"+listMonAn.get(tmpRandom).getHINH()%>"
										alt="">
								</div>
								<div class="deals_content">
									<div
										class="deals_info_line d-flex flex-row justify-content-start">
										<div class="deals_item_category">
										
											<a href="#"><%= listMonAn.get(tmpRandom).getTENMONAN()  %></a>
										</div>
										<div class="deals_item_price_a ml-auto"><%= "1"+listMonAn.get(tmpRandom).getGIA()  %></div>
									</div>
									<div
										class="deals_info_line d-flex flex-row justify-content-start">
										<div class="deals_item_name"><%= listMonAn.get(tmpRandom).getTENMONAN()  %></div>
										<div class="deals_item_price ml-auto"><%= listMonAn.get(tmpRandom).getGIA()  %></div>
									</div>
									<div class="available">
										<div
											class="available_line d-flex flex-row justify-content-start">
											<div class="available_title">
												Còn: <span>6</span>
											</div>
											<div class="sold_title ml-auto">
												Đã Bán: <span>28</span>
											</div>
										</div>
										<div class="available_bar">
											<span style="width: 17%"></span>
										</div>
									</div>
									<div
										class="deals_timer d-flex flex-row align-items-center justify-content-start">
										<div class="deals_timer_title_container">
											<div class="deals_timer_title">Đặt Hàng Ngay</div>
											<div class="deals_timer_subtitle">Thời Gian Còn:</div>
										</div>
										<div class="deals_timer_content ml-auto">
											<div class="deals_timer_box clearfix" data-target-time="">
												<div class="deals_timer_unit">
													<div id="deals_timer1_hr" class="deals_timer_hr"></div>
													<span>hours</span>
												</div>
												<div class="deals_timer_unit">
													<div id="deals_timer1_min" class="deals_timer_min"></div>
													<span>mins</span>
												</div>
												<div class="deals_timer_unit">
													<div id="deals_timer1_sec" class="deals_timer_sec"></div>
													<span>secs</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<% } %>
						</div>
					</div>
					<div class="deals_slider_nav_container">
						<div class="deals_slider_prev deals_slider_nav">
							<i class="fas fa-chevron-left ml-auto"></i>
						</div>
						<div class="deals_slider_next deals_slider_nav">
							<i class="fas fa-chevron-right ml-auto"></i>
						</div>
					</div>
				</div>
				<!-- Featured -->
				<div class="featured">
					<div class="tabbed_container">
						<div class="tabs">
							<ul class="clearfix">
								<li class="active">Bán Chạy</li>
								<li>Giảm Giá</li>
								<li>Đánh Giá Cao</li>
							</ul>
							<div class="tabs_line">
								<span></span>
							</div>
						</div>
						<!-- Product Panel -->
						<div class="product_panel panel active">
							<div class="featured_slider slider">
								<!-- Slider Item -->
								<% {
									for(int i=0;i<8;i++){
										int tmpRandom = (int)(Math.random()*listMonAn.size());
									%>
								<div class="featured_slider_item">
									<div class="border_active"></div>
									<div
										class="product_item discount d-flex flex-column align-items-center justify-content-center text-center">
										<div
											class="product_image d-flex flex-column align-items-center justify-content-center">
											<img
												src="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+ "/web/img_bandoan/"+listMonAn.get(tmpRandom).getHINH()%>"
												width="50%" height="100%" alt="">
										</div>
										<div class="product_content">
											<div class="product_price discount">
												<%= listMonAn.get(tmpRandom).getGIA()  %><span><%= listMonAn.get(tmpRandom).getGIA()  %></span>
											</div>
											<div class="product_name">
												<div>
													<a href="product.html"><%= listMonAn.get(tmpRandom).getTENMONAN()  %></a>
												</div>
											</div>
											<div class="product_extras">
												<button class="product_cart_button">Add to Cart</button>
											</div>
										</div>
										<div class="product_fav">
											<i class="fas fa-heart"></i>
										</div>
										<ul class="product_marks">
											<li class="product_mark product_discount">0%</li>
											<li class="product_mark product_new">new</li>
										</ul>
									</div>
								</div>
								<% }}  %>
								</div>
							<div class="featured_slider_dots_cover"></div>
						</div>
						<!-- Product Panel -->
						<div class="product_panel panel">
							<div class="featured_slider slider">
								<!-- Slider Item -->
								<% {
									for(int i=0;i<8;i++){
										int tmpRandom = (int)(Math.random()*listMonAn.size());
									%>
								<div class="featured_slider_item">
									<div class="border_active"></div>
									<div
										class="product_item discount d-flex flex-column align-items-center justify-content-center text-center">
										<div
											class="product_image d-flex flex-column align-items-center justify-content-center">
											<img
												src="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+ "/web/img_bandoan/"+listMonAn.get(tmpRandom).getHINH()%>"
												width="50%" height="100%" alt="">
										</div>
										<div class="product_content">
											<div class="product_price discount">
												<%= listMonAn.get(tmpRandom).getGIA()  %><span><%= listMonAn.get(tmpRandom).getGIA()  %></span>
											</div>
											<div class="product_name">
												<div>
													<a href="product.html"><%= listMonAn.get(tmpRandom).getTENMONAN()  %></a>
												</div>
											</div>
											<div class="product_extras">
												<button class="product_cart_button">Add to Cart</button>
											</div>
										</div>
										<div class="product_fav">
											<i class="fas fa-heart"></i>
										</div>
										<ul class="product_marks">
											<li class="product_mark product_discount">0%</li>
											<li class="product_mark product_new">new</li>
										</ul>
									</div>
								</div>
								<% }}  %>
							</div>
							<div class="featured_slider_dots_cover"></div>
						</div>
						<!-- Product Panel -->
						<div class="product_panel panel">
							<div class="featured_slider slider">
								<!-- Slider Item -->
								<% {
									for(int i=0;i<8;i++){
										int tmpRandom = (int)(Math.random()*listMonAn.size());
									%>
								<div class="featured_slider_item">
									<div class="border_active"></div>
									<div
										class="product_item discount d-flex flex-column align-items-center justify-content-center text-center">
										<div
											class="product_image d-flex flex-column align-items-center justify-content-center">
											<img
												src="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+ "/web/img_bandoan/"+listMonAn.get(tmpRandom).getHINH()%>"
												width="50%" height="100%" alt="">
										</div>
										<div class="product_content">
											<div class="product_price discount">
												<%= listMonAn.get(tmpRandom).getGIA()  %><span><%= listMonAn.get(tmpRandom).getGIA()  %></span>
											</div>
											<div class="product_name">
												<div>
													<a href="product.html"><%= listMonAn.get(tmpRandom).getTENMONAN()  %></a>
												</div>
											</div>
											<div class="product_extras">
												<button class="product_cart_button">Add to Cart</button>
											</div>
										</div>
										<div class="product_fav">
											<i class="fas fa-heart"></i>
										</div>
										<ul class="product_marks">
											<li class="product_mark product_discount">0%</li>
											<li class="product_mark product_new">new</li>
										</ul>
									</div>
								</div>
								<% }}  %>
							</div>
							<div class="featured_slider_dots_cover"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Popular Categories -->
<!-- <div class="popular_categories">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="popular_categories_content">
					<div class="popular_categories_title">Popular Categories</div>
					<div class="popular_categories_slider_nav">
						<div class="popular_categories_prev popular_categories_nav">
							<i class="fas fa-angle-left ml-auto"></i>
						</div>
						<div class="popular_categories_next popular_categories_nav">
							<i class="fas fa-angle-right ml-auto"></i>
						</div>
					</div>
					<div class="popular_categories_link">
						<a href="#">full catalog</a>
					</div>
				</div>
			</div>
			Popular Categories Slider
			<div class="col-lg-9">
				<div class="popular_categories_slider_container">
					<div class="owl-carousel owl-theme popular_categories_slider">
						Popular Categories Item
						<div class="owl-item">
							<div
								class="popular_category d-flex flex-column align-items-center justify-content-center">
								<div class="popular_category_image">
									<img src="/Blue/web/images/popular_1.png" alt="">
								</div>
								<div class="popular_category_text">Smartphones & Tablets</div>
							</div>
						</div>
						Popular Categories Item
						<div class="owl-item">
							<div
								class="popular_category d-flex flex-column align-items-center justify-content-center">
								<div class="popular_category_image">
									<img src="/Blue/web/images/popular_2.png" alt="">
								</div>
								<div class="popular_category_text">Computers & Laptops</div>
							</div>
						</div>
						Popular Categories Item
						<div class="owl-item">
							<div
								class="popular_category d-flex flex-column align-items-center justify-content-center">
								<div class="popular_category_image">
									<img src="/Blue/web/images/popular_3.png" alt="">
								</div>
								<div class="popular_category_text">Gadgets</div>
							</div>
						</div>
						Popular Categories Item
						<div class="owl-item">
							<div
								class="popular_category d-flex flex-column align-items-center justify-content-center">
								<div class="popular_category_image">
									<img src="/Blue/web/images/popular_4.png" alt="">
								</div>
								<div class="popular_category_text">Video Games & Consoles</div>
							</div>
						</div>
						Popular Categories Item
						<div class="owl-item">
							<div
								class="popular_category d-flex flex-column align-items-center justify-content-center">
								<div class="popular_category_image">
									<img src="/Blue/web/images/popular_5.png" alt="">
								</div>
								<div class="popular_category_text">Accessories</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
 --><!-- Banner -->
<!-- <div class="banner_2">
	<div class="banner_2_background"
		style="background-image: url(web/images/banner_2_background.jpg)"></div>
	<div class="banner_2_container">
		<div class="banner_2_dots"></div>
		Banner 2 Slider
		<div class="owl-carousel owl-theme banner_2_slider">
			Banner 2 Slider Item
			<div class="owl-item">
				<div class="banner_2_item">
					<div class="container fill_height">
						<div class="row fill_height">
							<div class="col-lg-4 col-md-6 fill_height">
								<div class="banner_2_content">
									<div class="banner_2_category">Samsung</div>
									<div class="banner_2_title">Note 10</div>
									<div class="banner_2_text">Samsung galaxy note 10.
										Flagship mới nhất vủa samsung</div>
									<div class="rating_r rating_r_4 banner_2_rating">
										<i></i><i></i><i></i><i></i><i></i>
									</div>
									<div class="button banner_2_button">
										<a href="#">Xem Thêm</a>
									</div>
								</div>
							</div>
							<div class="col-lg-8 col-md-6 fill_height">
								<div class="banner_2_image_container">
									<div class="banner_2_image">
										<img style="width: 40%; margin-left: 40%;"
											src="/Blue/web/images/Img/samsung-galaxy-note-10-plus-silver-400x460.png"
											alt="">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			Banner 2 Slider Item
			<div class="owl-item">
				<div class="banner_2_item">
					<div class="container fill_height">
						<div class="row fill_height">
							<div class="col-lg-4 col-md-6 fill_height">
								<div class="banner_2_content">
									<div class="banner_2_category">Samsung</div>
									<div class="banner_2_title">Note 10</div>
									<div class="banner_2_text">Samsung galaxy note 10.
										Flagship mới nhất vủa samsung</div>
									<div class="rating_r rating_r_4 banner_2_rating">
										<i></i><i></i><i></i><i></i><i></i>
									</div>
									<div class="button banner_2_button">
										<a href="#">Xem Thêm</a>
									</div>
								</div>
							</div>
							<div class="col-lg-8 col-md-6 fill_height">
								<div class="banner_2_image_container">
									<div class="banner_2_image">
										<img style="width: 40%; margin-left: 40%;"
											src="/Blue/web/images/Img/samsung-galaxy-note-10-plus-silver-400x460.png"
											alt="">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			Banner 2 Slider Item
			<div class="owl-item">
				<div class="banner_2_item">
					<div class="container fill_height">
						<div class="row fill_height">
							<div class="col-lg-4 col-md-6 fill_height">
								<div class="banner_2_content">
									<div class="banner_2_category">Samsung</div>
									<div class="banner_2_title">Note 10</div>
									<div class="banner_2_text">Samsung galaxy note 10.
										Flagship mới nhất vủa samsung</div>
									<div class="rating_r rating_r_4 banner_2_rating">
										<i></i><i></i><i></i><i></i><i></i>
									</div>
									<div class="button banner_2_button">
										<a href="#">Xem Thêm</a>
									</div>
								</div>
							</div>
							<div class="col-lg-8 col-md-6 fill_height">
								<div class="banner_2_image_container">
									<div class="banner_2_image">
										<img style="width: 40%; margin-left: 40%;"
											src="/Blue/web/images/Img/samsung-galaxy-note-10-plus-silver-400x460.png"
											alt="">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
 --><!-- Hot New Arrivals -->
<!-- <div class="new_arrivals">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="tabbed_container">
					<div class="tabs clearfix tabs-right">
						<div class="new_arrivals_title">Hot New Arrivals</div>
						<ul class="clearfix">
							<li class="active">Featured</li>
						</ul>
						<div class="tabs_line">
							<span></span>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-9" style="z-index: 1;">
							Product Panel
							<div class="product_panel panel active">
								<div class="arrivals_slider slider">
									Slider Item
									<div class="arrivals_slider_item">
										<div class="border_active"></div>
										<div
											class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
											<a href="">
												<div
													class="product_image d-flex flex-column align-items-center justify-content-center">
													<img src="/Blue/web/images/Img/realme-5-blue-400x460.png"
														alt="" width="50%" height="100%">
												</div>
											</a>
											<div class="product_content">
												<div class="product_price">3.990.000₫</div>
												<div class="product_name">
													<div>
														<a href="product.html">Điện thoại Realme 5 (3GB/64GB)</a>
													</div>
												</div>
												<div class="product_extras">
													<div class="product_color">
														<input type="radio" checked name="product_color"
															style="background: #b19c83"> <input type="radio"
															name="product_color" style="background: #000000">
														<input type="radio" name="product_color"
															style="background: #999999">
													</div>
													<button class="product_cart_button">Add to Cart</button>
												</div>
											</div>
											<div class="product_fav">
												<i class="fas fa-heart"></i>
											</div>
											<ul class="product_marks">
												<li class="product_mark product_discount">0%</li>
												<li class="product_mark product_new">new</li>
											</ul>
										</div>
									</div>
									Slider Item
									<div class="arrivals_slider_item">
										<div class="border_active"></div>
										<div
											class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
											<div
												class="product_image d-flex flex-column align-items-center justify-content-center">
												<img
													src="/Blue/web/images/Img/realme-3-green-isaac-400x460.png"
													alt="" width="50%" height="100%">
											</div>
											<div class="product_content">
												<div class="product_price">3.290.000₫</div>
												<div class="product_name">
													<div>
														<a href="product.html">Điện thoại Realme 3 (3GB/32GB)</a>
													</div>
												</div>
												<div class="product_extras">
													<div class="product_color">
														<input type="radio" checked name="product_color"
															style="background: #b19c83"> <input type="radio"
															name="product_color" style="background: #000000">
														<input type="radio" name="product_color"
															style="background: #999999">
													</div>
													<button class="product_cart_button">Add to Cart</button>
												</div>
											</div>
											<div class="product_fav">
												<i class="fas fa-heart"></i>
											</div>
											<ul class="product_marks">
												<li class="product_mark product_discount">0%</li>
												<li class="product_mark product_new">new</li>
											</ul>
										</div>
									</div>
									Slider Item
									<div class="arrivals_slider_item">
										<div class="border_active"></div>
										<div
											class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
											<div
												class="product_image d-flex flex-column align-items-center justify-content-center">
												<img
													src="/Blue/web/images/Img/realme-c2-16gb-new-blue-400x460.png"
													alt="" width="50%" height="100%">
											</div>
											<div class="product_content">
												<div class="product_price">2.290.000₫</div>
												<div class="product_name">
													<div>
														<a href="product.html">Điện thoại Realme C2 (2GB/16GB)</a>
													</div>
												</div>
												<div class="product_extras">
													<div class="product_color">
														<input type="radio" checked name="product_color"
															style="background: #b19c83"> <input type="radio"
															name="product_color" style="background: #000000">
														<input type="radio" name="product_color"
															style="background: #999999">
													</div>
													<button class="product_cart_button">Add to Cart</button>
												</div>
											</div>
											<div class="product_fav">
												<i class="fas fa-heart"></i>
											</div>
											<ul class="product_marks">
												<li class="product_mark product_discount">0%</li>
												<li class="product_mark product_new">new</li>
											</ul>
										</div>
									</div>
									Slider Item
									<div class="arrivals_slider_item">
										<div class="border_active"></div>
										<div
											class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
											<div
												class="product_image d-flex flex-column align-items-center justify-content-center">
												<img
													src="/Blue/web/images/Img/realme-c2-new-blue-400x460.png"
													alt="" width="50%" height="100%">
											</div>
											<div class="product_content">
												<div class="product_price">2.990.000₫</div>
												<div class="product_name">
													<div>
														<a href="product.html">Điện thoại Realme C2 (3GB/32GB)</a>
													</div>
												</div>
												<div class="product_extras">
													<div class="product_color">
														<input type="radio" checked name="product_color"
															style="background: #b19c83"> <input type="radio"
															name="product_color" style="background: #000000">
														<input type="radio" name="product_color"
															style="background: #999999">
													</div>
													<button class="product_cart_button">Add to Cart</button>
												</div>
											</div>
											<div class="product_fav">
												<i class="fas fa-heart"></i>
											</div>
											<ul class="product_marks">
												<li class="product_mark product_discount">0%</li>
												<li class="product_mark product_new">new</li>
											</ul>
										</div>
									</div>
									Slider Item
									<div class="arrivals_slider_item">
										<div class="border_active"></div>
										<div
											class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
											<div
												class="product_image d-flex flex-column align-items-center justify-content-center">
												<img
													src="/Blue/web/images/Img/realme-c2-2g-32gb-black-400x460.png"
													alt="" width="50%" height="100%">
											</div>
											<div class="product_content">
												<div class="product_price">2.590.000₫</div>
												<div class="product_name">
													<div>
														<a href="product.html">Điện thoại Realme C2 (2GB/32GB)</a>
													</div>
												</div>
												<div class="product_extras">
													<div class="product_color">
														<input type="radio" checked name="product_color"
															style="background: #b19c83"> <input type="radio"
															name="product_color" style="background: #000000">
														<input type="radio" name="product_color"
															style="background: #999999">
													</div>
													<button class="product_cart_button">Add to Cart</button>
												</div>
											</div>
											<div class="product_fav">
												<i class="fas fa-heart"></i>
											</div>
											<ul class="product_marks">
												<li class="product_mark product_discount">0%</li>
												<li class="product_mark product_new">new</li>
											</ul>
										</div>
									</div>
									Slider Item
									<div class="arrivals_slider_item">
										<div class="border_active"></div>
										<div
											class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
											<div
												class="product_image d-flex flex-column align-items-center justify-content-center">
												<img
													src="/Blue/web/images/Img/realme-3-pro-blue-400x460.png"
													alt="" width="50%" height="100%">
											</div>
											<div class="product_content">
												<div class="product_price">4.990.000₫</div>
												<div class="product_name">
													<div>
														<a href="product.html">Điện thoại Realme 3 Pro
															(4GB/64GB)</a>
													</div>
												</div>
												<div class="product_extras">
													<div class="product_color">
														<input type="radio" checked name="product_color"
															style="background: #b19c83"> <input type="radio"
															name="product_color" style="background: #000000">
														<input type="radio" name="product_color"
															style="background: #999999">
													</div>
													<button class="product_cart_button">Add to Cart</button>
												</div>
											</div>
											<div class="product_fav">
												<i class="fas fa-heart"></i>
											</div>
											<ul class="product_marks">
												<li class="product_mark product_discount">0%</li>
												<li class="product_mark product_new">new</li>
											</ul>
										</div>
									</div>
									Slider Item
									<div class="arrivals_slider_item">
										<div class="border_active"></div>
										<div
											class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
											<div
												class="product_image d-flex flex-column align-items-center justify-content-center">
												<img
													src="/Blue/web/images/Img/realme-5-pro-8gb-green-400x460.png"
													alt="" width="50%" height="100%">
											</div>
											<div class="product_content">
												<div class="product_price">6.990.000₫</div>
												<div class="product_name">
													<div>
														<a href="product.html">Điện thoại Realme 5 Pro
															(8GB/128GB)</a>
													</div>
												</div>
												<div class="product_extras">
													<div class="product_color">
														<input type="radio" checked name="product_color"
															style="background: #b19c83"> <input type="radio"
															name="product_color" style="background: #000000">
														<input type="radio" name="product_color"
															style="background: #999999">
													</div>
													<button class="product_cart_button">Add to Cart</button>
												</div>
											</div>
											<div class="product_fav">
												<i class="fas fa-heart"></i>
											</div>
											<ul class="product_marks">
												<li class="product_mark product_discount">0%</li>
												<li class="product_mark product_new">new</li>
											</ul>
										</div>
									</div>
									Slider Item
									<div class="arrivals_slider_item">
										<div class="border_active"></div>
										<div
											class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
											<div
												class="product_image d-flex flex-column align-items-center justify-content-center">
												<img
													src="/Blue/web/images/Img/realme-5-pro-purple-400x460.png"
													alt="" width="50%" height="100%">
											</div>
											<div class="product_content">
												<div class="product_price">5.990.000₫</div>
												<div class="product_name">
													<div>
														<a href="product.html">Điện thoại Realme 5 Pro
															(4GB/128GB)</a>
													</div>
												</div>
												<div class="product_extras">
													<div class="product_color">
														<input type="radio" checked name="product_color"
															style="background: #b19c83"> <input type="radio"
															name="product_color" style="background: #000000">
														<input type="radio" name="product_color"
															style="background: #999999">
													</div>
													<button class="product_cart_button">Add to Cart</button>
												</div>
											</div>
											<div class="product_fav">
												<i class="fas fa-heart"></i>
											</div>
											<ul class="product_marks">
												<li class="product_mark product_discount">0%</li>
												<li class="product_mark product_new">new</li>
											</ul>
										</div>
									</div>
									Slider Item
									<div class="arrivals_slider_item">
										<div class="border_active"></div>
										<div
											class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
											<div
												class="product_image d-flex flex-column align-items-center justify-content-center">
												<img
													src="/Blue/web/images/Img/samsung-galaxy-a9-2018-blue-400x460.png"
													alt="" width="50%" height="100%">
											</div>
											<div class="product_content">
												<div class="product_price">10.990.000₫</div>
												<div class="product_name">
													<div>
														<a href="product.html">Điện thoại Samsung Galaxy A9
															(2018)</a>
													</div>
												</div>
												<div class="product_extras">
													<div class="product_color">
														<input type="radio" checked name="product_color"
															style="background: #b19c83"> <input type="radio"
															name="product_color" style="background: #000000">
														<input type="radio" name="product_color"
															style="background: #999999">
													</div>
													<button class="product_cart_button">Add to Cart</button>
												</div>
											</div>
											<div class="product_fav">
												<i class="fas fa-heart"></i>
											</div>
											<ul class="product_marks">
												<li class="product_mark product_discount">0%</li>
												<li class="product_mark product_new">new</li>
											</ul>
										</div>
									</div>
									Slider Item
									<div class="arrivals_slider_item">
										<div class="border_active"></div>
										<div
											class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
											<div
												class="product_image d-flex flex-column align-items-center justify-content-center">
												<img
													src="/Blue/web/images/Img/samsung-galaxy-a7-2018-blue-400x460.png"
													alt="" width="50%" height="100%">
											</div>
											<div class="product_content">
												<div class="product_price">4.090.000₫</div>
												<div class="product_name">
													<div>
														<a href="product.html">Điện thoại Samsung Galaxy A7
															(2018)</a>
													</div>
												</div>
												<div class="product_extras">
													<div class="product_color">
														<input type="radio" checked name="product_color"
															style="background: #b19c83"> <input type="radio"
															name="product_color" style="background: #000000">
														<input type="radio" name="product_color"
															style="background: #999999">
													</div>
													<button class="product_cart_button">Add to Cart</button>
												</div>
											</div>
											<div class="product_fav">
												<i class="fas fa-heart"></i>
											</div>
											<ul class="product_marks">
												<li class="product_mark product_discount">0%</li>
												<li class="product_mark product_new">new</li>
											</ul>
										</div>
									</div>
									Slider Item
									<div class="arrivals_slider_item">
										<div class="border_active"></div>
										<div
											class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
											<div
												class="product_image d-flex flex-column align-items-center justify-content-center">
												<img
													src="/Blue/web/images/Img/samsung-galaxy-a7-2018-128gb-black-400x460.png"
													alt="" width="50%" height="100%">
											</div>
											<div class="product_content">
												<div class="product_price">6.990.000₫</div>
												<div class="product_name">
													<div>
														<a href="product.html">Điện thoại Samsung Galaxy A7
															(2018) 128GB</a>
													</div>
												</div>
												<div class="product_extras">
													<div class="product_color">
														<input type="radio" checked name="product_color"
															style="background: #b19c83"> <input type="radio"
															name="product_color" style="background: #000000">
														<input type="radio" name="product_color"
															style="background: #999999">
													</div>
													<button class="product_cart_button">Add to Cart</button>
												</div>
											</div>
											<div class="product_fav">
												<i class="fas fa-heart"></i>
											</div>
											<ul class="product_marks">
												<li class="product_mark product_discount">0%</li>
												<li class="product_mark product_new">new</li>
											</ul>
										</div>
									</div>
									Slider Item
									<div class="arrivals_slider_item">
										<div class="border_active"></div>
										<div
											class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
											<div
												class="product_image d-flex flex-column align-items-center justify-content-center">
												<img
													src="/Blue/web/images/Img/samsung-galaxy-m20-400x460.png"
													alt="" width="50%" height="100%">
											</div>
											<div class="product_content">
												<div class="product_price">3.990.000₫</div>
												<div class="product_name">
													<div>
														<a href="product.html">Điện thoại Samsung Galaxy M20</a>
													</div>
												</div>
												<div class="product_extras">
													<div class="product_color">
														<input type="radio" checked name="product_color"
															style="background: #b19c83"> <input type="radio"
															name="product_color" style="background: #000000">
														<input type="radio" name="product_color"
															style="background: #999999">
													</div>
													<button class="product_cart_button">Add to Cart</button>
												</div>
											</div>
											<div class="product_fav">
												<i class="fas fa-heart"></i>
											</div>
											<ul class="product_marks">
												<li class="product_mark product_discount">0%</li>
												<li class="product_mark product_new">new</li>
											</ul>
										</div>
									</div>
									Slider Item
									<div class="arrivals_slider_item">
										<div class="border_active"></div>
										<div
											class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
											<div
												class="product_image d-flex flex-column align-items-center justify-content-center">
												<img
													src="/Blue/web/images/Img/samsung-galaxy-a10-red-400x460.png"
													alt="" width="50%" height="100%">
											</div>
											<div class="product_content">
												<div class="product_price">3.090.000₫</div>
												<div class="product_name">
													<div>
														<a href="product.html">Điện thoại Samsung Galaxy A10</a>
													</div>
												</div>
												<div class="product_extras">
													<div class="product_color">
														<input type="radio" checked name="product_color"
															style="background: #b19c83"> <input type="radio"
															name="product_color" style="background: #000000">
														<input type="radio" name="product_color"
															style="background: #999999">
													</div>
													<button class="product_cart_button">Add to Cart</button>
												</div>
											</div>
											<div class="product_fav">
												<i class="fas fa-heart"></i>
											</div>
											<ul class="product_marks">
												<li class="product_mark product_discount">0%</li>
												<li class="product_mark product_new">new</li>
											</ul>
										</div>
									</div>
									Slider Item
									<div class="arrivals_slider_item">
										<div class="border_active"></div>
										<div
											class="product_item is_new d-flex flex-column align-items-center justify-content-center text-center">
											<div
												class="product_image d-flex flex-column align-items-center justify-content-center">
												<img
													src="/Blue/web/images/Img/samsung-galaxy-s10-white-400x460.png"
													alt="" width="50%" height="100%">
											</div>
											<div class="product_content">
												<div class="product_price">20.990.000₫</div>
												<div class="product_name">
													<div>
														<a href="product.html">Điện thoại Samsung Galaxy S10</a>
													</div>
												</div>
												<div class="product_extras">
													<div class="product_color">
														<input type="radio" checked name="product_color"
															style="background: #b19c83"> <input type="radio"
															name="product_color" style="background: #000000">
														<input type="radio" name="product_color"
															style="background: #999999">
													</div>
													<button class="product_cart_button">Add to Cart</button>
												</div>
											</div>
											<div class="product_fav">
												<i class="fas fa-heart"></i>
											</div>
											<ul class="product_marks">
												<li class="product_mark product_discount">0%</li>
												<li class="product_mark product_new">new</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="arrivals_slider_dots_cover"></div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="arrivals_single clearfix">
								<div
									class="d-flex flex-column align-items-center justify-content-center">
									<div class="arrivals_single_image">
										<img src="/Blue/web/images/new_single.png" alt="">
									</div>
									<div class="arrivals_single_content">
										<div class="arrivals_single_category">
											<a href="#">Smartphones</a>
										</div>
										<div class="arrivals_single_name_container clearfix">
											<div class="arrivals_single_name">
												<a href="#">LUNA Smartphone</a>
											</div>
											<div class="arrivals_single_price text-right">$379</div>
										</div>
										<div class="rating_r rating_r_4 arrivals_single_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<form action="#">
											<button class="arrivals_single_button">Add to Cart</button>
										</form>
									</div>
									<div class="arrivals_single_fav product_fav active">
										<i class="fas fa-heart"></i>
									</div>
									<ul class="arrivals_single_marks product_marks">
										<li class="arrivals_single_mark product_mark product_new">new</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
 --><!-- Best Sellers -->
<!-- <div class="best_sellers">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="tabbed_container">
					<div class="tabs clearfix tabs-right">
						<div class="new_arrivals_title">Hot Best Sellers</div>
						<ul class="clearfix">
							<li class="active">Top 20</li>
						</ul>
						<div class="tabs_line">
							<span></span>
						</div>
					</div>
					<div class="bestsellers_panel panel active">
						Best Sellers Slider
						<div class="bestsellers_slider slider">
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img src="/Blue/web/images/Img/mobell-s60-red-1-400x460.png"
											alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Mobell</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại Mobell S60</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											1.390.000₫<span>1.390.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img
											src="/Blue/web/images/Img/nokia-51-plus-black-400x460.png"
											alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Nokia</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại Nokia 5.1 Plus</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											3.090.000₫<span>3.090.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img src="/Blue/web/images/Img/nokia-61-plus-3-400x460.png"
											alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Nokia</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại Nokia 6.1 Plus</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											3.790.000₫<span>3.790.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img src="/Blue/web/images/Img/nokia-32-black-400x460.png"
											alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Nokia</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại Nokia 3.2 32GB</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											3.290.000₫<span>3.290.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img
											src="/Blue/web/images/Img/nokia-32-16gb-black-1-400x460.png"
											alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Nokia</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại Nokia 3.2 16GB</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											2.490.000₫<span>2.490.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img src="/Blue/web/images/Img/nokia-72-black-400x460.png"
											alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Nokia</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại Nokia 7.2</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											6.190.000₫<span>6.190.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img src="/Blue/web/images/Img/oppo-a5s-red-400x460.png"
											alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Oppo</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại OPPO A5s</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											3.690.000₫<span>3.690.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img src="/Blue/web/images/Img/oppo-a1k-red-400x460.png"
											alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Oppo</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại OPPO A1K</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											3.190.000₫<span>3.190.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img
											src="/Blue/web/images/Img/oppo-a5-2020-128gb-black-400x460.png"
											alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Oppo</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại OPPO A5 (2020) 128GB</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											5.290.000₫<span>5.290.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img src="/Blue/web/images/Img/oppo-a5-2020-white-400x460.png"
											alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Oppo</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại OPPO A5 (2020) 64GB</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											4.290.000₫<span>4.290.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img
											src="/Blue/web/images/Img/oppo-reno-10x-zoom-edition-black-400x460.png"
											alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Oppo</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại OPPO Reno 10x Zoom
												Edition</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											16.990.000₫<span>16.990.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img
											src="/Blue/web/images/Img/oppo-reno2-black-mtp1-400x460.png"
											alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Oppo</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại OPPO Reno2</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											14.990.000₫<span>14.990.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img
											src="/Blue/web/images/Img/oppo-f11-pro-128gb-1-400x460.png"
											alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Oppo</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại OPPO F11 Pro 128GB</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											7.490.000₫<span>7.490.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img src="/Blue/web/images/Img/oppo-f11-mtp-400x460.png"
											alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Oppo</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại OPPO F11</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											6.290.000₫<span>6.290.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img
											src="/Blue/web/images/Img/oppo-reno2-f-xanh-tinh-van-docquyen-1-400x460.png"
											alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Oppo</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại OPPO Reno2 F Xanh Tinh
												Vân</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											8.990.000₫<span>8.990.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img
											src="/Blue/web/images/Img/oppo-reno2-f-green-mtp-400x460.png"
											alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Oppo</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại OPPO Reno2 F</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											8.990.000₫<span>8.990.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img
											src="/Blue/web/images/Img/oppo-a9-2020-green-1-400x460.png"
											alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Oppo</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại OPPO A9 (2020)</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											6.990.000₫<span>6.990.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img src="/Blue/web/images/Img/oppo-a7-400x460.png" alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Oppo</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại OPPO A7</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											4.390.000₫<span>4.390.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img src="/Blue/web/images/Img/oppo-f9-tim-400x460.png" alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Oppo</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại OPPO F9</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											4.490.000₫<span>4.490.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
							Best Sellers Item
							<div class="bestsellers_item discount">
								<div
									class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
									<div class="bestsellers_image">
										<img
											src="/Blue/web/images/Img/realme-5-4gb-purple-docquyen-400x460.png"
											alt="">
									</div>
									<div class="bestsellers_content">
										<div class="bestsellers_category">
											<a href="#">Realme</a>
										</div>
										<div class="bestsellers_name">
											<a href="product.html">Điện thoại Realme 5 (4GB/128GB)</a>
										</div>
										<div class="rating_r rating_r_4 bestsellers_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="bestsellers_price discount">
											4.990.000₫<span>4.990.000₫</span>
										</div>
									</div>
								</div>
								<div class="bestsellers_fav active">
									<i class="fas fa-heart"></i>
								</div>
								<ul class="bestsellers_marks">
									<li class="bestsellers_mark bestsellers_discount">0%</li>
									<li class="bestsellers_mark bestsellers_new">new</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
 --><!-- Adverts -->
<!-- <div class="adverts">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 advert_col">
				Advert Item
				<div
					class="advert d-flex flex-row align-items-center justify-content-start">
					<div class="advert_content">
						<div class="advert_title">
							<a href="#">Xu Hướng 2019</a>
						</div>
						<div class="advert_text">Sản Phẩm với thiết kế tinh xảo và
							cấu hình khủng</div>
					</div>
					<div class="ml-auto">
						<div class="advert_image">
							<img
								src="/Blue/web/images/Img/iphone-11-pro-max-512gb-gold-400x460_2.png"
								alt="">
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 advert_col">
				Advert Item
				<div
					class="advert d-flex flex-row align-items-center justify-content-start">
					<div class="advert_content">
						<div class="advert_title">
							<a href="#">Xu Hướng 2019</a>
						</div>
						<div class="advert_text">Sản Phẩm với thiết kế tinh xảo và
							cấu hình khủng</div>
					</div>
					<div class="ml-auto">
						<div class="advert_image">
							<img
								src="/Blue/web/images/Img/xiaomi-mi-9-se-blue-18thangbh-400x460.png"
								alt="">
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 advert_col">
				Advert Item
				<div
					class="advert d-flex flex-row align-items-center justify-content-start">
					<div class="advert_content">
						<div class="advert_title">
							<a href="#">Xu Hướng 2019</a>
						</div>
						<div class="advert_text">Sản Phẩm với thiết kế tinh xảo và
							cấu hình khủng</div>
					</div>
					<div class="ml-auto">
						<div class="advert_image">
							<img
								src="/Blue/web/images/Img/xiaomi-redmi-note-8-pro-6gb-128gb-black-18thangbh-400x460.png"
								alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
 --></div>
<!-- Trends -->
<!-- <div class="trends">
	<div class="trends_background"
		style="background-image: url(web/images/trends_background.jpg)"></div>
	<div class="trends_overlay"></div>
	<div class="container">
		<div class="row">
			Trends Content
			<div class="col-lg-3">
				<div class="trends_container">
					<h2 class="trends_title">Sản Phẩm Dẫn Đầu</h2>
					<div class="trends_text">
						<p>Dẫn Đầu Xu Thế , Hãy để bạn là người dẫn đầu xu hướng</p>
					</div>
					<div class="trends_slider_nav">
						<div class="trends_prev trends_nav">
							<i class="fas fa-angle-left ml-auto"></i>
						</div>
						<div class="trends_next trends_nav">
							<i class="fas fa-angle-right ml-auto"></i>
						</div>
					</div>
				</div>
			</div>
			Trends Slider
			<div class="col-lg-9">
				<div class="trends_slider_container">
					Trends Slider
					<div class="owl-carousel owl-theme trends_slider">
						Trends Slider Item
						<div class="owl-item">
							<div class="trends_item is_new">
								<div
									class="trends_image d-flex flex-column align-items-center justify-content-center">
									<img
										src="/Blue/web/images/Img/samsung-galaxy-a80-gold-400x460.png"
										alt="">
								</div>
								<div class="trends_content">
									<div class="trends_category">
										<a href="#">Samsung</a>
									</div>
									<div class="trends_info clearfix">
										<div class="trends_name">
											<a href="product.html">galaxy a80</a>
										</div>
										<div class="trends_price">7,000,000 đ</div>
									</div>
								</div>
								<ul class="trends_marks">
									<li class="trends_mark trends_discount">-25%</li>
									<li class="trends_mark trends_new">new</li>
								</ul>
								<div class="trends_fav">
									<i class="fas fa-heart"></i>
								</div>
							</div>
						</div>
						Trends Slider Item
						<div class="owl-item">
							<div class="trends_item is_new">
								<div
									class="trends_image d-flex flex-column align-items-center justify-content-center">
									<img
										src="/Blue/web/images/Img/samsung-galaxy-note-9-black-400x460-400x460.png"
										alt="">
								</div>
								<div class="trends_content">
									<div class="trends_category">
										<a href="#">Samsung</a>
									</div>
									<div class="trends_info clearfix">
										<div class="trends_name">
											<a href="product.html">galaxy note 9</a>
										</div>
										<div class="trends_price">17,000,000 đ</div>
									</div>
								</div>
								<ul class="trends_marks">
									<li class="trends_mark trends_discount">-25%</li>
									<li class="trends_mark trends_new">new</li>
								</ul>
								<div class="trends_fav">
									<i class="fas fa-heart"></i>
								</div>
							</div>
						</div>
						Trends Slider Item
						<div class="owl-item">
							<div class="trends_item is_new">
								<div
									class="trends_image d-flex flex-column align-items-center justify-content-center">
									<img
										src="/Blue/web/images/Img/samsung-galaxy-a70-white-400x460.png"
										alt="">
								</div>
								<div class="trends_content">
									<div class="trends_category">
										<a href="#">Samsung</a>
									</div>
									<div class="trends_info clearfix">
										<div class="trends_name">
											<a href="product.html">galaxy a70</a>
										</div>
										<div class="trends_price">6,000,000 đ</div>
									</div>
								</div>
								<ul class="trends_marks">
									<li class="trends_mark trends_discount">-25%</li>
									<li class="trends_mark trends_new">new</li>
								</ul>
								<div class="trends_fav">
									<i class="fas fa-heart"></i>
								</div>
							</div>
						</div>
						Trends Slider Item
						<div class="owl-item">
							<div class="trends_item is_new">
								<div
									class="trends_image d-flex flex-column align-items-center justify-content-center">
									<img src="/Blue/web/images/trends_1.jpg" alt="">
								</div>
								<div class="trends_content">
									<div class="trends_category">
										<a href="#">Smartphones</a>
									</div>
									<div class="trends_info clearfix">
										<div class="trends_name">
											<a href="product.html">Jump White</a>
										</div>
										<div class="trends_price">$379</div>
									</div>
								</div>
								<ul class="trends_marks">
									<li class="trends_mark trends_discount">-25%</li>
									<li class="trends_mark trends_new">new</li>
								</ul>
								<div class="trends_fav">
									<i class="fas fa-heart"></i>
								</div>
							</div>
						</div>
						Trends Slider Item
						<div class="owl-item">
							<div class="trends_item">
								<div
									class="trends_image d-flex flex-column align-items-center justify-content-center">
									<img src="/Blue/web/images/trends_2.jpg" alt="">
								</div>
								<div class="trends_content">
									<div class="trends_category">
										<a href="#">Smartphones</a>
									</div>
									<div class="trends_info clearfix">
										<div class="trends_name">
											<a href="product.html">Jump White</a>
										</div>
										<div class="trends_price">$379</div>
									</div>
								</div>
								<ul class="trends_marks">
									<li class="trends_mark trends_discount">-25%</li>
									<li class="trends_mark trends_new">new</li>
								</ul>
								<div class="trends_fav">
									<i class="fas fa-heart"></i>
								</div>
							</div>
						</div>
						Trends Slider Item
						<div class="owl-item">
							<div class="trends_item is_new">
								<div
									class="trends_image d-flex flex-column align-items-center justify-content-center">
									<img src="/Blue/web/images/trends_3.jpg" alt="">
								</div>
								<div class="trends_content">
									<div class="trends_category">
										<a href="#">Smartphones</a>
									</div>
									<div class="trends_info clearfix">
										<div class="trends_name">
											<a href="product.html">Jump White</a>
										</div>
										<div class="trends_price">$379</div>
									</div>
								</div>
								<ul class="trends_marks">
									<li class="trends_mark trends_discount">-25%</li>
									<li class="trends_mark trends_new">new</li>
								</ul>
								<div class="trends_fav">
									<i class="fas fa-heart"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
 --><!-- Reviews -->
<!-- <div class="reviews">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="reviews_title_container">
					<h3 class="reviews_title">Đánh Giá Gần Đây</h3>
					<div class="reviews_all ml-auto">
						<a href="#">view all <span>reviews</span></a>
					</div>
				</div>
				<div class="reviews_slider_container">
					Reviews Slider
					<div class="owl-carousel owl-theme reviews_slider">
						Reviews Slider Item
						<div class="owl-item">
							<div
								class="review d-flex flex-row align-items-start justify-content-start">
								<div>
									<div class="review_image">
										<img src="/Blue/web/images/review_1.jpg" alt="">
									</div>
								</div>
								<div class="review_content">
									<div class="review_name">Nguyễn Văn A</div>
									<div class="review_rating_container">
										<div class="rating_r rating_r_4 review_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="review_time">2 ngày Trước</div>
									</div>
									<div class="review_text">
										<p>Sản Phẩm Tốt Với Tầm Giá</p>
									</div>
								</div>
							</div>
						</div>
						Reviews Slider Item
						<div class="owl-item">
							<div
								class="review d-flex flex-row align-items-start justify-content-start">
								<div>
									<div class="review_image">
										<img src="/Blue/web/images/review_1.jpg" alt="">
									</div>
								</div>
								<div class="review_content">
									<div class="review_name">Nguyễn Văn A</div>
									<div class="review_rating_container">
										<div class="rating_r rating_r_4 review_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="review_time">2 ngày Trước</div>
									</div>
									<div class="review_text">
										<p>Sản Phẩm Tốt Với Tầm Giá</p>
									</div>
								</div>
							</div>
						</div>
						Reviews Slider Item
						<div class="owl-item">
							<div
								class="review d-flex flex-row align-items-start justify-content-start">
								<div>
									<div class="review_image">
										<img src="/Blue/web/images/review_1.jpg" alt="">
									</div>
								</div>
								<div class="review_content">
									<div class="review_name">Nguyễn Văn A</div>
									<div class="review_rating_container">
										<div class="rating_r rating_r_4 review_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="review_time">2 ngày Trước</div>
									</div>
									<div class="review_text">
										<p>Sản Phẩm Tốt Với Tầm Giá</p>
									</div>
								</div>
							</div>
						</div>
						Reviews Slider Item
						<div class="owl-item">
							<div
								class="review d-flex flex-row align-items-start justify-content-start">
								<div>
									<div class="review_image">
										<img src="/Blue/web/images/review_1.jpg" alt="">
									</div>
								</div>
								<div class="review_content">
									<div class="review_name">Nguyễn Văn A</div>
									<div class="review_rating_container">
										<div class="rating_r rating_r_4 review_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="review_time">2 ngày Trước</div>
									</div>
									<div class="review_text">
										<p>Sản Phẩm Tốt Với Tầm Giá</p>
									</div>
								</div>
							</div>
						</div>
						Reviews Slider Item
						<div class="owl-item">
							<div
								class="review d-flex flex-row align-items-start justify-content-start">
								<div>
									<div class="review_image">
										<img src="/Blue/web/images/review_1.jpg" alt="">
									</div>
								</div>
								<div class="review_content">
									<div class="review_name">Nguyễn Văn A</div>
									<div class="review_rating_container">
										<div class="rating_r rating_r_4 review_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="review_time">2 ngày Trước</div>
									</div>
									<div class="review_text">
										<p>Sản Phẩm Tốt Với Tầm Giá</p>
									</div>
								</div>
							</div>
						</div>
						Reviews Slider Item
						<div class="owl-item">
							<div
								class="review d-flex flex-row align-items-start justify-content-start">
								<div>
									<div class="review_image">
										<img src="/Blue/web/images/review_1.jpg" alt="">
									</div>
								</div>
								<div class="review_content">
									<div class="review_name">Nguyễn Văn A</div>
									<div class="review_rating_container">
										<div class="rating_r rating_r_4 review_rating">
											<i></i><i></i><i></i><i></i><i></i>
										</div>
										<div class="review_time">2 ngày Trước</div>
									</div>
									<div class="review_text">
										<p>Sản Phẩm Tốt Với Tầm Giá</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="reviews_dots"></div>
				</div>
			</div>
		</div>
	</div>
</div>
 --><!-- Recently Viewed -->
<!-- <div class="viewed">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="viewed_title_container">
					<h3 class="viewed_title">Xem Gần Đây</h3>
					<div class="viewed_nav_container">
						<div class="viewed_nav viewed_prev">
							<i class="fas fa-chevron-left"></i>
						</div>
						<div class="viewed_nav viewed_next">
							<i class="fas fa-chevron-right"></i>
						</div>
					</div>
				</div>
				<div class="viewed_slider_container">
					Recently Viewed Slider
					<div class="owl-carousel owl-theme viewed_slider">
						Recently Viewed Item
						<div class="owl-item">
							<div
								class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
								<div class="viewed_image">
									<img src="/Blue/web/images/view_3.jpg" alt="">
								</div>
								<div class="viewed_content text-center">
									<div class="viewed_price">$225</div>
									<div class="viewed_name">
										<a href="#">Samsung J730F...</a>
									</div>
								</div>
								<ul class="item_marks">
									<li class="item_mark item_discount">-25%</li>
									<li class="item_mark item_new">new</li>
								</ul>
							</div>
						</div>
						Recently Viewed Item
						<div class="owl-item">
							<div
								class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
								<div class="viewed_image">
									<img src="/Blue/web/images/view_3.jpg" alt="">
								</div>
								<div class="viewed_content text-center">
									<div class="viewed_price">$225</div>
									<div class="viewed_name">
										<a href="#">Samsung J730F...</a>
									</div>
								</div>
								<ul class="item_marks">
									<li class="item_mark item_discount">-25%</li>
									<li class="item_mark item_new">new</li>
								</ul>
							</div>
						</div>
						Recently Viewed Item
						<div class="owl-item">
							<div
								class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
								<div class="viewed_image">
									<img src="/Blue/web/images/view_3.jpg" alt="">
								</div>
								<div class="viewed_content text-center">
									<div class="viewed_price">$225</div>
									<div class="viewed_name">
										<a href="#">Samsung J730F...</a>
									</div>
								</div>
								<ul class="item_marks">
									<li class="item_mark item_discount">-25%</li>
									<li class="item_mark item_new">new</li>
								</ul>
							</div>
						</div>
						Recently Viewed Item
						<div class="owl-item">
							<div
								class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
								<div class="viewed_image">
									<img src="/Blue/web/images/view_3.jpg" alt="">
								</div>
								<div class="viewed_content text-center">
									<div class="viewed_price">$225</div>
									<div class="viewed_name">
										<a href="#">Samsung J730F...</a>
									</div>
								</div>
								<ul class="item_marks">
									<li class="item_mark item_discount">-25%</li>
									<li class="item_mark item_new">new</li>
								</ul>
							</div>
						</div>
						Recently Viewed Item
						<div class="owl-item">
							<div
								class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
								<div class="viewed_image">
									<img src="/Blue/web/images/view_3.jpg" alt="">
								</div>
								<div class="viewed_content text-center">
									<div class="viewed_price">$225</div>
									<div class="viewed_name">
										<a href="#">Samsung J730F...</a>
									</div>
								</div>
								<ul class="item_marks">
									<li class="item_mark item_discount">-25%</li>
									<li class="item_mark item_new">new</li>
								</ul>
							</div>
						</div>
						Recently Viewed Item
						<div class="owl-item">
							<div
								class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
								<div class="viewed_image">
									<img src="/Blue/web/images/view_3.jpg" alt="">
								</div>
								<div class="viewed_content text-center">
									<div class="viewed_price">$225</div>
									<div class="viewed_name">
										<a href="#">Samsung J730F...</a>
									</div>
								</div>
								<ul class="item_marks">
									<li class="item_mark item_discount">-25%</li>
									<li class="item_mark item_new">new</li>
								</ul>
							</div>
						</div>
						Recently Viewed Item
						<div class="owl-item">
							<div
								class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
								<div class="viewed_image">
									<img src="/Blue/web/images/view_3.jpg" alt="">
								</div>
								<div class="viewed_content text-center">
									<div class="viewed_price">$225</div>
									<div class="viewed_name">
										<a href="#">Samsung J730F...</a>
									</div>
								</div>
								<ul class="item_marks">
									<li class="item_mark item_discount">-25%</li>
									<li class="item_mark item_new">new</li>
								</ul>
							</div>
						</div>
						Recently Viewed Item
						<div class="owl-item">
							<div
								class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
								<div class="viewed_image">
									<img src="/Blue/web/images/view_3.jpg" alt="">
								</div>
								<div class="viewed_content text-center">
									<div class="viewed_price">$225</div>
									<div class="viewed_name">
										<a href="#">Samsung J730F...</a>
									</div>
								</div>
								<ul class="item_marks">
									<li class="item_mark item_discount">-25%</li>
									<li class="item_mark item_new">new</li>
								</ul>
							</div>
						</div>
						Recently Viewed Item
						<div class="owl-item">
							<div
								class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
								<div class="viewed_image">
									<img src="/Blue/web/images/view_3.jpg" alt="">
								</div>
								<div class="viewed_content text-center">
									<div class="viewed_price">$225</div>
									<div class="viewed_name">
										<a href="#">Samsung J730F...</a>
									</div>
								</div>
								<ul class="item_marks">
									<li class="item_mark item_discount">-25%</li>
									<li class="item_mark item_new">new</li>
								</ul>
							</div>
						</div>
						Recently Viewed Item
						<div class="owl-item">
							<div
								class="viewed_item d-flex flex-column align-items-center justify-content-center text-center">
								<div class="viewed_image">
									<img src="/Blue/web/images/view_3.jpg" alt="">
								</div>
								<div class="viewed_content text-center">
									<div class="viewed_price">$225</div>
									<div class="viewed_name">
										<a href="#">Samsung J730F...</a>
									</div>
								</div>
								<ul class="item_marks">
									<li class="item_mark item_discount">-25%</li>
									<li class="item_mark item_new">new</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
 --><!-- Brands -->
<!-- <div class="brands">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="brands_slider_container">
					Brands Slider
					<div class="owl-carousel owl-theme brands_slider">
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img src="/Blue/web/images/brands_1.jpg" alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img src="/Blue/web/images/brands_2.jpg" alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img src="/Blue/web/images/brands_3.jpg" alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img src="/Blue/web/images/brands_4.jpg" alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img src="/Blue/web/images/brands_5.jpg" alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img src="/Blue/web/images/brands_6.jpg" alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img src="/Blue/web/images/brands_7.jpg" alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img src="/Blue/web/images/brands_8.jpg" alt="">
							</div>
						</div>
					</div>
					Brands Slider Navigation
					<div class="brands_nav brands_prev">
						<i class="fas fa-chevron-left"></i>
					</div>
					<div class="brands_nav brands_next">
						<i class="fas fa-chevron-right"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
 --><%
rs.getStatement().close();
}
%>