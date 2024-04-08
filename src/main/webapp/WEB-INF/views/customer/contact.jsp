<!-- để hiển thị tiếng việt thêm tất cả vào các trang jsp câu lệnh dưới -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- sf: spring-form -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<title>Contact Us</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<link rel="stylesheet" href="/css/contactv2.css">
<link rel="stylesheet" href="${base}/customer/layout/css.js">
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header1.jsp"></jsp:include>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Contact with Us.</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="wrapper">
						<div class="row no-gutters">
							<div
								class="col-lg-8 col-md-7 order-md-last d-flex align-items-stretch">
								<div class="contact-wrap w-100 p-md-5 p-4">
									<h3 class="mb-4">Get in touch</h3>
									<div id="form-message-warning" class="mb-4"></div>
									<div id="form-message-success" class="mb-4">Your message
										was sent, thank you!</div>
									<sf:form modelAttribute="contact" action="${base}/contact-us"
										method="POST" enctype="multipart/form-data">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="name">First Name</label>
													<sf:input path="firstName" class="form-control"
														name="firstName" id="firstName" placeholder="First Name"></sf:input>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="name">Last Name</label>
													<sf:input path="lastName" class="form-control"
														name="lastName" id="lastName" placeholder="Last Name"></sf:input>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="email">Email Address</label>
													<sf:input path="email" class="form-control" name="email"
														id="email" placeholder="Email"></sf:input>
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="#">Message</label>
													<sf:textarea path="message" class="form-control"
														id="message" cols="30" rows="4" placeholder="Message"></sf:textarea>
												</div>
											</div>
											<div class="form-group mb-2">
												<label for="message">Upload file</label> <input type="file"
													name="attachment" id="uploadFile" class="form-control">
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<button type="submit" value="Send Message"
														class="btn btn-primary">Submit</button>
													<div class="submitting"></div>
												</div>
											</div>
											<c:if test="${not empty message }">
												<div class="alert alert-primary" role="alert">
													${message }</div>
											</c:if>
										</div>
									</sf:form>
								</div>
							</div>
							<div class="col-lg-4 col-md-5 d-flex align-items-stretch">
								<div class="info-wrap bg-dark w-100 p-md-5 p-4">
									<h3>Let's get in touch</h3>
									<p class="mb-4">We're open for any suggestion or just to
										have a chat</p>
									<div class="dbox w-100 d-flex align-items-start">
										<div
											class="icon d-flex align-items-center justify-content-center">
											<span class="fa fa-map-marker"></span>
										</div>
										<div class="text pl-3">
											<p>
												<span>Address:</span> Tầng 29 tòa trung tâm Lotte Hà Nội ,số
												54 Liễu Giai, Phường Cống Vị, Quận Ba Đình, Hà Nội
											</p>
										</div>
									</div>
									<div class="dbox w-100 d-flex align-items-center">
										<div
											class="icon d-flex align-items-center justify-content-center">
											<span class="fa fa-phone"></span>
										</div>
										<div class="text pl-3">
											<p>
												<span>Phone:</span> <a href="tel://1234567920">19001221</a>
											</p>
										</div>
									</div>
									<div class="dbox w-100 d-flex align-items-center">
										<div
											class="icon d-flex align-items-center justify-content-center">
											<span class="fa fa-paper-plane"></span>
										</div>
										<div class="text pl-3">
											<p>
												<span>Email:</span> <a href="mailto:info@yoursite.com">support@shopee.vn</a>
											</p>
										</div>
									</div>
									<div class="dbox w-100 d-flex align-items-center">
										<div
											class="icon d-flex align-items-center justify-content-center">
											<span class="fa fa-globe"></span>
										</div>
										<div class="text pl-3">
											<p>
												<span>Website</span> <a href="#">Shopee.vn</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/customer/footer.jsp"></jsp:include>
	<script src="../js/jquery-3.6.0.min.js"></script>
	<script src="../js/popper.js"></script>
	<script src="../js/validate.js"></script>
	<script src="../js/contact.js"></script>
</body>
</html>


