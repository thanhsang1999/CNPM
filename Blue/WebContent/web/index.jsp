<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.Tools"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blue</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="OneTech shop project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href=<%=request.getContextPath() + "/web/plugins/OwlCarousel2-2.2.1/owl.carousel.css"%>>
<link rel="stylesheet" type="text/css"
	href=<%=request.getContextPath() + "/web/plugins/OwlCarousel2-2.2.1/owl.theme.default.css"%>>
<link rel="stylesheet" type="text/css"
	href=<%=request.getContextPath() + "/web/plugins/OwlCarousel2-2.2.1/animate.css"%>>
<link rel="stylesheet" type="text/css"
	href=<%=request.getContextPath() + "/web/plugins/slick-1.8.0/slick.css"%>>
<link rel="stylesheet" type="text/css"
	href=<%=request.getContextPath() + "/web/styles/main_styles.css"%>>
<link rel="stylesheet" type="text/css"
	href=<%=request.getContextPath() + "/web/styles/responsive.css"%>>

<link rel="stylesheet" type="text/css"
	href=<%=request.getContextPath() + "/web/styles/css_dk.css"%>>
<link rel="shortcut icon"
	href=<%=request.getContextPath() + "/web/images/logo-blue.png"%>>
<link rel="stylesheet" type="text/css"
	href=<%=request.getContextPath() + "/web/styles/web_index.css"%>>

</head>
<body>

	<div class="super_container">

		<%@include file="htmlIndex/header.jsp"%>
		<jsp:include page="/web/htmlIndex/bandoan" />

	</div>

	<%@include file="htmlIndex/newsLetter.jsp"%>

	<%@include file="htmlIndex/footer.jsp"%>



	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script
		src=<%=request.getContextPath() + "/web/plugins/greensock/TweenMax.min.js"%>></script>
	<script
		src=<%=request.getContextPath() + "/web/plugins/greensock/TimelineMax.min.js"%>></script>
	<script
		src=<%=request.getContextPath() + "/web/plugins/scrollmagic/ScrollMagic.min.js"%>></script>
	<script
		src=<%=request.getContextPath() + "/web/plugins/greensock/animation.gsap.min.js"%>></script>
	<script
		src=<%=request.getContextPath() + "/web/plugins/greensock/ScrollToPlugin.min.js"%>></script>
	<script
		src=<%=request.getContextPath() + "/web/plugins/OwlCarousel2-2.2.1/owl.carousel.js"%>></script>
	<script
		src=<%=request.getContextPath() + "/web/plugins/slick-1.8.0/slick.js"%>></script>
	<script
		src=<%=request.getContextPath() + "/web/plugins/easing/easing.js"%>></script>
	<script src=<%=request.getContextPath() + "/web/js/custom.js"%>></script>

	
<!-- 	Script chỉnh sủa javascript của Sang, Dòng Xiaomi Cao cấp ... -->
<%-- 	<script src=<%=request.getContextPath() + "/web/js/custom_web.js"%>></script> --%>
	<script src=<%=request.getContextPath() + "/web/js/yeuthich.js"%>></script>
	<script>
var  add_cart =function (e){
	// disabled the submit button
	$(this).prop("disabled", true);
	var tmp=$(this);
	console.log(tmp);
	$.ajax({
		type:"POST",
		url: "<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath() + "/web/addProductCart"%>",
				data : {ID_PRODUCT:tmp.attr('id')},
				success : function(data) {
					

					switch(data){
						
						case "OK":
						 	$(location).attr('href','<%=request.getContextPath()%>');
							break;
						
						case "Log in.":
							$('#myModal').modal('show');
							break;
						default:
							
							break;
					}
					console.log(data=="Log in.");
					console.log(data);
					tmp.prop("disabled", false);
					functionUpdateCart();

				},
				error : function(e) {

					tmp.prop("disabled", false);

				}
			});
}

function functionUpdateCart(){
	
	$.ajax({
		type:"POST",
		url: "<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath() + "/web/cartAjax"%>",

						success : function(data) {

							$('.cart_price').text(data.split(':')[1]);
							//$('.tong-tien').text(data.split(':')[1]);
							$('.cart_count span').text(data.split(':')[0]);

						},
						error : function(e) {

						}
					});
		}
var  add_yeuthich =function (e){
	// disabled the submit button
	$(this).prop("disabled", true);
	var tmp=$(this);
	console.log(tmp.attr('id'));
	$.ajax({
		type:"POST",
		url: "<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath() + "/web/addProductYeuThich"%>",
				data : {ID_PRODUCT:tmp.attr('id')},
				success : function(data) {
					

					switch(data){
						
						case "OK":
						 	$(location).attr('href','<%=request.getContextPath()%>');
							break;
						
						case "Log in.":
							$('#myModal').modal('show');
							tmp.removeClass("active");
							break;
						default:
							
							break;
					}
					console.log(data=="Log in.");
					console.log(data);
					tmp.prop("disabled", false);
					functionUpdateYeuThich();

				},
				error : function(e) {

					tmp.prop("disabled", false);

				}
			});
}
function functionUpdateYeuThich(){
	
	$.ajax({
		type:"POST",
		url: "<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath() + "/web/updateYeuThich"%>",
						success : function(data) {
							//console.log("data updateYeuThich: "+data);
							eval(data);
							$('#sl-yeuthich').text(data.split(/\r\n|\r|\n/).length-1);

						},
						error : function(e) {

						}
					});
		}

		$('document').ready(function() {

			$('.product_cart_button').click(add_cart);
			$('.arrivals_single_button').click(add_cart);
			$('.product_fav').click(add_yeuthich);
			functionUpdateYeuThich();
			

		});
	</script>

</body>
</html>