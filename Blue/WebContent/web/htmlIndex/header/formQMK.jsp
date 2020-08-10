<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<link href=<%=request.getContextPath()+ "/web/styles/blue_dangnhap.css"%> rel="stylesheet">
</head>

<!-- The Modal -->
<div class="modal" id="myModalQMK">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="container-fluid">
				<a class="hiddenanchor" id="signup"></a> <a class="hiddenanchor"
					id="signin"></a>

				<div class="login_wrapper">
					<div class="animate form login_form">
						<section class="login_content">
								<form id="formQMK" action=<%=request.getContextPath()+ "/web/login"%> method="post" >
									<div class="container-fluid dang-nhap">
										<div class="row">
											<div class="col-sm-1"></div>
											<div class="col-sm-10">
												<div id="title"><span>Quên Mật Khẩu</span></div>
											</div>
											<div class="col-sm-1"></div>
										</div>
										<div class="user-pass">
											<div class="user khoang-cach">
												<input type="text" name="uname" id="userQMK" placeholder="Tài Khoản" />
											</div>
											<div class="col-sm-12 khoang-cach-qmk">
											<div class="spinner-border text-primary icon-xoay"></div>
											<div class="row">
										<div class="col-sm-3"></div>
										<div class="col-sm-6"><div id="errorMessqmk"></div></div>
										<div class="col-sm-3"></div>
										</div>
											</div>
										</div>
										<div class="sign-in btnqmk">
											<button type="submit" class="btn-btnqmk"><span>Lấy Mật Khẩu</span></button>
										</div>
										
										<div class="row dang-nhap-phan-2">
											<div class="col-sm-1"></div>
											
											<div class="col-sm-10">
												<div class="dang-ki " >
													<span><a href="#" id="qmk-login"><i class="fas fa-sign-in-alt"></i></i> Đăng Nhập</a></span>
												</div>
											</div>
											<div class="col-sm-1"></div>

										</div>
									</div>
								</form>
						</section>
					</div>

				</div>

			</div>

		</div>
	</div>
</div>
<script>
	// trang load xong mới vào đoạn javascript này
	$('document').ready(function() {
		// lấy sự kiện click của .btn-btnqmk
		$('.btn-btnqmk').click(function(e){
			e.preventDefault();
			if ($('#errorMessqmk').text()!="") {
				$('#errorMessqmk').text("");
			}
			$(".icon-xoay").css("opacity","1");
			// ajax jquery 
			$.ajax({
				// Post lên server
				type: "POST",
				// địa chỉ
				url: '<%=request.getContextPath()+ "/web/mailpassword"%>',
				// lấy data từ from theo name
				data: $('#formQMK').serialize(),
				
					// bắt sự kiện trả về
				success: function(data){
					// in ra chuỗi trả về từ server
							$('#errorMessqmk').text(data);
							if(data=="Username not corect" || data=="Gửi mail thành công"||data == "Tài Khoản Không Tồn Tại"){
							$(".icon-xoay").css("opacity","0");
							}
							return;
				}
			});
		});	
	});
	
</script>