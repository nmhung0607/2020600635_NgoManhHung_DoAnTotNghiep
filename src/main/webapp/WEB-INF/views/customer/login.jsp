<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- sf: spring-form -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
<!--===============================================================================================-->
</head>
<body style="background-color: #666666;">
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form method="POST" action="${base}/login_processing_url" class="login100-form validate-form" >
					<span class="login100-form-title p-b-43">
						Chào mừng bạn đến với NMH Company
					</span>
					<c:if test="${not empty param.login_error}">
						<div class="alert alert-danger" role="alert" style="font-size:15px">
							Đăng nhập không thành công, thử lại!!!
						</div>
					</c:if>
					
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="username">
						<span class="focus-input100"></span>
						<span class="label-input100">Tên đăng nhập</span>
					</div>
					
					 
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="password">
						<span class="focus-input100"></span>
						<span class="label-input100">Mật khẩu</span>
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-32">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" id="remember-me" name="remember-me" for="ckb1">
								Lưu đăng nhập
							</label>
						</div>

						<div>
							<a href="#" class="txt1">
								Quên mật khẩu?
							</a>
						</div>
					</div>
			

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="submit">
							Đăng nhập
						</button>
					</div>
					
					<div class="text-center p-t-46 p-b-20">
						<a class="txt2" href="${base}/register">
							Bạn chưa có tài khoản?Đăng kí ngay
						</a>
					</div>
				</form>

				<div class="login100-more" style="background-image: url('${base}/img/nmh.jpg');">
				</div>
			</div>
		</div>
	</div>
	

	
	
<!--===============================================================================================-->
	<script src="js/jquery-3.6.0.min.js"></script>
<!--===============================================================================================-->
	<script src="js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="js/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/moment.min.js"></script>
	<script src="js/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="js/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>