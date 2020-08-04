<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<link href=<%=request.getContextPath()+ "/web/styles/blue_dangnhap.css"%> rel="stylesheet">
<div id="fb-root"></div>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>Insert title here</title>
   <script src="https://apis.google.com/js/platform.js" async defer></script>
   <meta name="google-signin-client_id" content="765438156974-c2f41u682m677b562hj2hgae6don1421.apps.googleusercontent.com">
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
										<div scope="public_profile,email" onlogin="checkLoginState();" class="fb-login-button" data-size="large" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="false" data-width=""></div>									
										<div class="row">
										<div class="col-sm-3"></div>
										<div class="col-sm-6"><div id="errorMess"></div></div>
										<div class="col-sm-3"></div>
										</div>
										
										   <div class="g-signin2" data-onsuccess="onSignIn" id="myP"></div>
      <img id="myImg"><br>
      <p id="name"></p>
      <div id="status">
   </div>
   <script type="text/javascript">
      function onSignIn(googleUser) {
      // window.location.href='success.jsp';
      var profile = googleUser.getBasicProfile();
      var imagurl=profile.getImageUrl();
      var name=profile.getName();
      var email=profile.getEmail();
      document.getElementById("myImg").src = imagurl;
      document.getElementById("name").innerHTML = name;
      document.getElementById("myP").style.visibility = "hidden";
      document.getElementById("status").innerHTML = 'Welcome '+name+'!<a href=success.jsp?                  
      email='+email+'&name='+name+'/>Continue with Google login</a></p>'
   }
   </script>

   <script>
      function myFunction() {
      gapi.auth2.getAuthInstance().disconnect();
      location.reload();
   }
   </script>
										
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
<script>

  function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
    console.log('statusChangeCallback');
    console.log(response);                   // The current login status of the person.
    if (response.status === 'connected') {   // Logged into your webpage and Facebook.
      testAPI();
    } else {                                 // Not logged into your webpage or we are unable to tell.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this webpage.';
    }
  }


  function checkLoginState() {               // Called when a person is finished with the Login Button.
    FB.getLoginStatus(function(response) {   // See the onlogin handler
      statusChangeCallback(response);
    });
  }


  window.fbAsyncInit = function() {
    FB.init({
      appId      : '338398963962789',
      cookie     : true,                     // Enable cookies to allow the server to access the session.
      xfbml      : true,                     // Parse social plugins on this webpage.
      version    : 'v7.0'           // Use this Graph API version for this call.
    });


    FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
      statusChangeCallback(response);        // Returns the login status.
    });
  };
 
  function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
    	var tmp = '<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()%>/web/loginFB';
        var idFace = response.id;
        var nameFace = response.name;
    	$.ajax({
            type: "POST",
            url: tmp,
            data:"idFace="+idFace+"&nameFace="+nameFace,
            success: function(data) {
            	if(data == "okFB"){
            	location.reload();            		
            	}
            }
       });
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
    });
  }

</script>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>