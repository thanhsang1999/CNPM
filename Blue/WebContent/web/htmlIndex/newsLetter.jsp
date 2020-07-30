<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Newsletter -->

<div class="newsletter">
	<div class="container">
		<div class="row">
			<div class="col">
				<div
					class="newsletter_container d-flex flex-lg-row flex-column align-items-lg-center align-items-center justify-content-lg-start justify-content-center">
					<div class="newsletter_title_container">
						<div class="newsletter_icon">
							<img src=<%=request.getContextPath()+ "/web/images/send.png"%> alt="">
						</div>
						<div class="newsletter_title">Đăng Nhập Ngay</div>
						<div class="newsletter_text">
							<p>...hoàn lại 20% giá trị đơn hàng đầu tiên.</p>
						</div>
					</div>
					<div class="newsletter_content clearfix">
						<form action="#" class="newsletter_form">
							<input type="email" class="newsletter_input" required="required"
								placeholder="Nhập Địa Chỉ Email">
							<button class="newsletter_button">Xác Nhận</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>