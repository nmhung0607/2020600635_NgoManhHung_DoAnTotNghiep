 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- sf: spring-form -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
 <!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Register Form</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    	<link rel="stylesheet" type="text/css" href="${base}/font/fontawesome-free-6.1.1-web/css/all.css">
    <link rel='stylesheet' href="${base}/css/register.css"/>
</head>
<body>
        
        <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <sf:form method="POST" class="register-form" id="register-form" action="${base}/register" modelAttribute="user">
                            <div class="form-group">
                                <label for="name"><i class="fa-solid fa-user"></i></label>
                                <sf:input type="text" path="username" id="name" placeholder="UserName"></sf:input>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="fa-solid fa-envelope"></i></label>
                                <sf:input type="email" path="email" id="email" placeholder="Your Email"></sf:input>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="fa-solid fa-key"></i></label>
                                <sf:input type="password" path="password" id="pass" placeholder="Password"></sf:input>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="fa-solid fa-key-skeleton"></i></label>
                                <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/>
                            </div>
                            <div class="form-group form-button">
                                <button type="submit" name="signup" id="signup" class="form-submit">Register</button>
                            </div>
                        </sf:form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="${base}/img/nmh.jpg" alt="sing up image"></figure>
                        <a href="${base}/login" class="signup-image-link">Bạn đã có tài khoản?Đăng nhập ngay</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- Sing in  Form -->
        <!-- <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="images/signin-image.jpg" alt="sing up image"></figure>
                        <a href="#" class="signup-image-link">Create an account</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign up</h2>
                        <form method="POST" class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="your_name" id="your_name" placeholder="Your Name"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="your_pass" id="your_pass" placeholder="Password"/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
                            </div>
                        </form>
                        <div class="social-login">
                            <span class="social-label">Or login with</span>
                            <ul class="socials">
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section> -->

    </div>
    <script src='${base}/js/register.js'></script>
</body>
</html>