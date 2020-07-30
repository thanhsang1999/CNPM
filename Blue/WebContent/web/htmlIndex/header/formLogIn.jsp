<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<link href=<%=request.getContextPath()+ "/web/styles/blue_dangnhap.css"%> rel="stylesheet">
</head>

<!-- The Modal -->
<div class="modal" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="container-fluid">
				<a class="hiddenanchor" id="signup"></a> <a class="hiddenanchor"
					id="signin"></a>

				<div class="login_wrapper">
					<div class="animate form login_form">
						<section class="login_content">
								<form id="formLogIn" action=<%=request.getContextPath()+ "/web/login"%> method="post" >
									<div class="container-fluid dang-nhap">
										<div class="row">
											<div class="col-sm-2"></div>
											<div class="col-sm-8">
												<div id="title"><span>Đăng Nhập</span></div>
											</div>
											<div class="col-sm-2"></div>
										</div>
										<div class="user-pass">
											<div class="user khoang-cach">
												<input type="text" name="uname" id="user" placeholder="Tài Khoản" />
											</div>
											<div class="pass khoang-cach">
												<input type="password" name="pass" id="pass" placeholder="Mật Khẩu" />
											</div>
										</div>
										<div class="sign-in">
											<button type="submit" id="loginBtn"><span>Đăng Nhập</span></button>
										</div>
										<div class="row">
										<div class="col-sm-3"></div>
										<div class="col-sm-6"><div id="errorMess"></div></div>
										<div class="col-sm-3"></div>
										</div>
										<div class="row dang-nhap-phan-2">
											<div class="col-sm-1"></div>
											<div class="col-sm-5">
												<div class="dang-ki">
													<span class="dangki"><a href="#"><i class="fas fa-user"></i> Đăng Kí</a></span>
												</div>
											</div>
											<div class="col-sm-5">
												<div class="dang-ki " >
													<span><a href="#" id="mailpassword"><i class="fas fa-question"></i> Quên Mật
															Khẩu</a></span>
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
	$('document').ready(function() {
		$('#loginBtn').click(function(e){
			e.preventDefault();
			
			$.ajax({
				type: "POST",
				url: $('#formLogIn').attr('action'),
				
				data: $('#formLogIn').serialize(),
				
				success: function(data){
					
					switch(data){
						case "OK, customer":
							location.reload();
						 	//$(location).attr('href','<%=request.getContextPath()%>');
							break;
						
						case "OK, admin":
							$(location).attr('href','<%=request.getContextPath() +"/admin/index"%>'); 
							break;
						default:
					$('#errorMess').text(data);
							
							break;
					}
					
					    
					  
				}
			});
		});		
	});
	
</script>