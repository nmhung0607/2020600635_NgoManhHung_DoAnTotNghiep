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
<title>Trang chủ</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link rel='stylesheet' type='text/css' media='screen'
	href="${base}/css/simplePagination.css">
<link rel='stylesheet' type='text/css' media='screen'
	href="${base}/css/header_main.css">
<link rel='stylesheet' type='text/css' media='screen'
	href="${base}/css/header_base.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
<link rel='stylesheet' type='text/css' media='screen'
	href="${base}/css/bootstrap.min.css">
	<link rel='stylesheet' type='text/css' media='screen'
	href="${base}/css/header.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<div class="app"">
		<div class="app_container">
			<div class="gridd">
				<div class="grid__roww">
					<div class="grid__columnn-2">
						<form action="${base }/trang-chu" method="get">
							<nav class="category">
								<h3 class="category__heading">
									<i class="fas fa-list category__heading-icon"></i> Danh Mục
								</h3>
								<ul class="category-list">
									<c:forEach items="${categories}" var="category">
										<li class="category-item"><a class="category-item__link"
											href="/danh-muc?categoryId=${category.id}" id ="categoryId"  title="categoryName" value="${category.name}">${category.name}</a></li>
									</c:forEach>

								</ul>
							</nav>
						</form>
					</div>
					<div class="grid__columnn-10">
						<form action="${base}/danh-muc" class="py-5" method="get">
							<div class="home-filter">
								<input id="page" name="page" class="form-control"
									style="display: none"> <input type="text" id="keyword"
									name="keyword" class="form-control" placeholder="Search"
									style="margin-right: 5px;" value="${searchModel1.keyword}">
								<span class="home-filter__label">Sắp xếp theo</span>
								<div class="select-input"> 
								    <select class="form-control" name="sort_by" id="sort_by"
						style="margin-right: 5px;" value="${searchModel1.sort_by}">
						<option value="0">All</option>
						<option value="giathap">Giá : Thấp đến cao</option>
										<option value="giacao">Giá : Cao đến thấp</option>
					</select>
									

								</div>
								<button type="submit" id="btnSearch" name="btnSearch"
									value="Search" class="btn btn-primary">Tìm kiếm</button>
						</form>
					</div>
					<section>
						<div class="container px-4 px-lg-5 mt-5">
							<div
								class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

								<c:forEach var="c" items="${pdProducts1.data}" varStatus="loop">
									<div class="col mb-5">
										<div class="card h-100">
											<!-- Sale badge-->
											<div class="badge bg-dark text-white position-absolute"
												style="top: 1.2rem; right: 1.2rem">Sale</div>

											<!-- Product image-->
											<img src="${base}/upload/${c.avatar}" class="card-img-top"
												alt="...">

											<!-- Product details-->
											<div class="card-body p-4">
												<div class="text-center">

													<!-- Product name-->
													<h5 class="fw-bolder">
														<a href="${base }/details/${c.seo}">${c.title }</a>
													</h5>
													<!-- Product price-->
													<fmt:setLocale value="vi_VN" />
													<span class="text-muted text-decoration-line-through">
														<fmt:formatNumber value="${c.price}" type="currency" />
													</span>
													<fmt:formatNumber value="${c.price_sale}" type="currency" />

												</div>
											</div>

											<!-- Product actions-->
											<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
												<div class="text-center">
													<a class="btn btn-outline-dark mt-auto" href="#"
														onclick="AddToCart('${base}',${c.id}, 1)">Thêm vào giỏ hàng</a>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="row">
							<div class="col-12 d-flex justify-content-center">
								<div id="paging">1234</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>

	</div>

	<!-- Footer -->
	<!-- Footer -->
	<footer class="bg-white text-center text-dark">
		<!-- Grid container -->
		<div class="container p-4">
			<!-- Section: Social media -->
			<section class="mb-4">
				<!-- Facebook -->
				<a class="btn btn-outline-dark btn-floating m-1" href="#!"
					role="button"><i class="fab fa-facebook-f"></i></a>

				<!-- Twitter -->
				<a class="btn btn-outline-dark btn-floating m-1" href="#!"
					role="button"><i class="fab fa-twitter"></i></a>

				<!-- Google -->
				<a class="btn btn-outline-dark btn-floating m-1" href="#!"
					role="button"><i class="fab fa-google"></i></a>

				<!-- Instagram -->
				<a class="btn btn-outline-dark btn-floating m-1" href="#!"
					role="button"><i class="fab fa-instagram"></i></a>

				<!-- Linkedin -->
				<a class="btn btn-outline-dark btn-floating m-1" href="#!"
					role="button"><i class="fab fa-linkedin-in"></i></a>

				<!-- Github -->
				<a class="btn btn-outline-dark btn-floating m-1" href="#!"
					role="button"><i class="fab fa-github"></i></a>
			</section>
			<!-- Section: Social media -->

			<!-- Section: Form -->
			<section class="">
				<form action="">
					<!--Grid row-->
					<div class="row d-flex justify-content-center">
						<!--Grid column-->
						<div class="col-auto">
							<p class="pt-2">
								<strong>Sign up for our newsletter</strong>
							</p>
						</div>
						<!--Grid column-->

						<!--Grid column-->
						<div class="col-md-5 col-12">
							<!-- Email input -->
							<div class="form-outline form-white mb-4">
								<input type="email" id="form5Example21" class="form-control" />
							</div>
						</div>
						<!--Grid column-->

						<!--Grid column-->
						<div class="col-auto">
							<!-- Submit button -->
							<button type="submit" class="btn btn-outline-dark mb-4">
								Subscribe</button>
						</div>
						<!--Grid column-->
					</div>
					<!--Grid row-->
				</form>
			</section>
			<!-- Section: Form -->

			<!-- Section: Text -->
			<section class="mb-4">
				<p>Sự hài lòng của các bạn là niềm vinh hạnh của chúng tôi</p>
			</section>
			<!-- Section: Text -->

			<!-- Section: Links -->
			<section class="">
				<!--Grid row-->
				<div class="row">
					<!--Grid column-->
					<div class="col-lg-3 col-md-6 mb-4 mb-md-0">
						<h5 class="text-uppercase">Chăm sóc khách hàng</h5>

						<ul class="list-unstyled mb-0">
							<li><a href="#!" class="text-dark">Trung tâm trợ giúp</a></li>
							<li><a href="#!" class="text-dark">Hướng dẫn mua hàng</a></li>
							<li><a href="#!" class="text-dark">Mall</a></li>
						</ul>
					</div>
					<!--Grid column-->

					<!--Grid column-->
					<div class="col-lg-3 col-md-6 mb-4 mb-md-0">
						<h5 class="text-uppercase">Danh mục</h5>

						<ul class="list-unstyled mb-0">
							<li><a href="#!" class="text-dark">Link 1</a></li>
							<li><a href="#!" class="text-dark">Link 2</a></li>
							<li><a href="#!" class="text-dark">Link 3</a></li>
							<li><a href="#!" class="text-dark">Link 4</a></li>
						</ul>
					</div>
					<!--Grid column-->

					<!--Grid column-->
					<div class="col-lg-3 col-md-6 mb-4 mb-md-0">
						<h5 class="text-uppercase">Giới thiệu</h5>

						<ul class="list-unstyled mb-0">
							<li><a href="#!" class="text-dark">Giới thiệu</a></li>
							<li><a href="#!" class="text-dark">Tuyển dụng</a></li>
							<li><a href="#!" class="text-dark">Điều khoản</a></li>
						</ul>
					</div>
					<!--Grid column-->

					<!--Grid column-->
					<div class="col-lg-3 col-md-6 mb-4 mb-md-0">
						<h5 class="text-uppercase">Email Liên Hệ</h5>

						<ul class="list-unstyled mb-0">
							<li><a href="#!" class="text-dark">ngomanhhung0607@gmail.com</a>
							</li>
						</ul>
					</div>
				</div>
			</section>
		</div>
		<div class="text-center p-3"
			style="background-color: rgba(0, 0, 0, 0.2);">
			© 2022 Copyright: <a class="text-dark"
				href="https://mdbootstrap.com/">NMH Company</a>
		</div>
		<!-- Copyright -->
	</footer>
	</div>
	<script src="${base}/js/jquery-3.6.0.min.js"></script>
	<script src="${base}/js/scripts.js"></script>
	<script src="${base}/js/header.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${base}/js/jquery.simplePagination.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#paging").pagination({
			currentPage: ${pdProducts1.currentPage}, //trang hiện tại
	        items: ${pdProducts1.totalItems},	//tổng số sản phẩm
	        itemsOnPage: ${pdProducts1.sizeOfPage}, //số sản phẩm trên 1 trang
	        cssStyle: 'compact-theme',
	        onPageClick: function(pageNumber, event) {
	        	$('#page').val(pageNumber);
	        	$('#btnSearch').trigger('click');
	        	$('categoryId').val(pdProducts1.getCategoryId());
			},
	    });
	});
	</script>
	<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
<df-messenger
  intent="WELCOME"
  chat-title="AI_Chat"
  agent-id="97f7183b-b2b8-49ea-a4b8-b192fb8a08f8"
  language-code="en"
></df-messenger>
<script type="text/javascript">
	
	$(document).ready(function() {
		$('#categoryId').val(${searchModel1.categoryId});
		$("#paging").pagination({
			currentPage: ${pdProducts1.currentPage}, //trang hiện tại
	        items: ${pdProducts1.totalItems},	//tổng số sản phẩm
	        itemsOnPage: ${pdProducts1.sizeOfPage}, //số sản phẩm trên 1 trang
	        cssStyle: 'light-theme',
	        onPageClick: function(pageNumber, event) {
	        	$('#page').val(pageNumber);
	        	$('#btnSearch').trigger('click');
	        	$('categoryId').val(pdProducts1.getCategoryId());
			},
	    });
	});
	</script>
</body>
</html>
