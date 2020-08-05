<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<head>
<link rel="stylesheet" type="text/css"
	href=<%=request.getContextPath() + "/web/styles/css_dk.css"%>>
</head>
<!-- Modal -->
<div class="modal fade" id="myModalSignUp" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="">
				<div class="clearfix"></div>

				<div class="row">
					<div class="col-sm-12 dk-phan-1">
						<span class="title-dang-ki">Đăng Kí</span> <br> <span
							class="duoi-title-dang-ki"> Đăng kí tài khoản để trải
							nghiệm được tốt nhất </span>
					</div>
				</div>
				<form id="formSignUp"
					action="<%=request.getContextPath()%>/web/signupweb" method="post">
					<div class="row dk-phan-2">
						<div class="row col-sm-12 gian-cach">
							<div class="col-md-1"></div>
							<div class="col-md-10 bg-form-right-content">
								<div class="input-group mb-3 gian-cach">
									<span class="tieu-de-input">Tài Khoản :</span> <input
										type="text" class="form-control" id="input-tk" name="uname"
										required>
								</div>
							</div>
							<div class="col-md-1"></div>
						</div>
						<div class="row col-sm-12 gian-cach">
							<div class="col-md-1"></div>
							<div class="col-md-10 bg-form-right-content">
								<div class="input-group mb-3 gian-cach">
									<span class="tieu-de-input">Tên :</span> <input type="text"
										class="form-control" id="input-name" name="hoten" required>
								</div>
							</div>
							<div class="col-md-1"></div>
						</div>
						<div class="row col-sm-12 gian-cach">
							<div class="col-md-1"></div>
							<div class="col-md-10 bg-form-right-content">
								<div class="input-group mb-3 gian-cach">
									<span class="tieu-de-input">Email :</span> <input type="email"
										class="form-control" id="input-email" name="nemail" required>
								</div>
							</div>
							<div class="col-md-1"></div>
						</div>
						<div class="row col-sm-12 gian-cach">
							<div class="col-md-1"></div>
							<div class="col-md-10 bg-form-right-content">
								<div class="input-group mb-3 gian-cach">
									<span class="tieu-de-input">Mật Khẩu :</span> <input
										type="password" class="form-control" id="input-mk" name="pass"
										required>
								</div>
							</div>
							<div class="col-md-1"></div>
						</div>
						<div class="row col-sm-12 gian-cach">
							<div class="col-md-1"></div>
							<div class="col-md-10 bg-form-right-content">
								<div class="input-group mb-3 gian-cach">
									<span class="tieu-de-input">Nhập Lại Mật Khẩu :</span> <input
										type="password" class="form-control" id="input-mk-2"
										name="pass2" required>
								</div>
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>
					<div class="row dk-phan-3 col-sm-12">
						<div class="col-sm-4"></div>
						<div class="col-sm-4">
							<button id="btnSignUp" type="button"
								class="btn btn-primary btn-block">Đăng Kí</button>

						</div>
						<div class="col-sm-4"></div>
					</div>
					<div class="row">
						<div id="errorMessSignUp"
							style="margin: 0 auto; margin-top: 20px; font-size: 19px;"></div>
					</div>
					<div class="row dk-phan-4 col-sm-12">
						<div class="col-sm-4"></div>
						<div class="col-sm-4">
							<span class="title-tieu-de-dang-ki"><i
								class="fas fa-shopping-bag"></i> Blue </span>
						</div>
						<div class="col-sm-4"></div>
					</div>
				</form>
			</div>

		</div>

	</div>
</div>
<!-- jQuery Smart Wizard -->
<script
	src=<%=request.getContextPath() + "/admin/lib/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"%>></script>
<!-- Custom Theme Scripts -->
<script
	src=<%=request.getContextPath() + "/admin/lib/build/js/signup.js"%>></script>
<script>
$('document').ready(function() {
	$('#btnSignUp').click(function(e){
		e.preventDefault();
		
		$.ajax({
			type: "POST",
			url: $('#formSignUp').attr('action'),
			data:  $('#formSignUp').serialize(),
			
			success: function(data){
				
				switch(data){
					case "OK":
					 	$(location).attr('href','<%=request.getContextPath()%>');
						break;
					default:
						
						break;
				}
				$('#errorMessSignUp').text(data);
				$('#input-mk').text("");
				$('#input-mk-2').text("");
				
				
				  
			}
		});
	});
		$(".dangki").click(function (e) {
			e.preventDefault();
			$('#myModal').modal('toggle');
			$('#myModalSignUp').modal('toggle');
			//$('#myModal').modal('hide');
			//$('#myModalSignUp').modal('show');
		});
		$("#mailpassword").click(function (e) {
			e.preventDefault();
			$('#myModal').modal('toggle');
			$('#myModalQMK').modal('toggle');
		});
		$("#qmk-login").click(function (e) {
			e.preventDefault();
			$('#myModal').modal('toggle');
			$('#myModalQMK').modal('toggle');
		});
	});
</script>