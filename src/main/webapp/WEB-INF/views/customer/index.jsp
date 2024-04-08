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

</head>
<body>
	<div class="app">
		<header class="header">
			<div class="gridd">
				<nav class="header__navbar">
					<ul class="header__navbar-list">
						<li class="header__navbar-item header__navbar-item--separate">Vào
							cửa hàng bằng ứng dụng
							<div class="header__qr"></div>
						</li>
						<li class="header__navbar-item"><span
							class="header__navbar--title--no--pointer">Kết nối</span> <a
							href="" class="header__navbar-icon-link"> <i
								class="fab fa-facebook"></i>
						</a> <a href="" class="header__navbar-icon-link"> <i
								class="fab fa-instagram"></i>
						</a></li>
					</ul>
					<ul class="header__navbar-list">
						<li class="header__navbar-item"><a href=""
							class="header__navbar-item-link"> <i class="fas fa-bell"></i>
								Thông báo
						</a></li>
						<li class="header__navbar-item"><a href="${base }/contact-us"
							class="header__navbar-item-link"> <i
								class="fas fa-contact-book"></i>Liên hệ
						</a></li>
						<li class="header__navbar-item"><a href=""
							class="header__navbar-item-link"> <i
								class="far fa-question-circle"></i> Trợ giúp
						</a></li>
						<c:if test="${!isLogined }">
							<li
								class="header__navbar-item header__navbar-item--strong header__navbar-item--separate">
								<a href="${base}/register"> Đăng kí</a>
							</li>
							<li class="header__navbar-item header__navbar-item--strong">
								<a href="${base}/login"> Đăng nhập</a>
							</li>
						</c:if>

						<c:if test="${isLogined}">
							<li class="header__navbar-item header__navbar-user"><img
								src="${base}/img/nmh.jpg" alt="" class="header__navbar-user-img">
								<span class="header__navbar-user-name">${userLogined.email}</span>
								<ul class="header__navbar-user-menu">
									<li class="header__navbar-user-item"><a href="">Đơn
											mua </a></li>
									<li class="header__navbar-user-item"><a
										href="${base}/logout">Đăng xuất</a></li>
								</ul></li>
						</c:if>

					</ul>
				</nav>
				<div class="header-with-search">
					<div class="header__logo">
						<div class="header__logo-img">
							<a href="${base}/trang-chu"><img src="${base}/img/nmh.jpg"
								alt="" width="50px" height="50px"></a>
						</div>
					</div>

					<div class="header__search" >

						<form action="${base }/trang-chu" method="get" style="display:flex" class="header__search-input-wrap">
							<div class="header__search-input-wrap">
								<input type="text" id="keyword" name="keyword"
									class="header__search-input"
									placeholder="Tìm kiếm sản phẩm . ex : Laptop , Macbook.......">

							</div>
							<button class="header__search-btn">
								<i class="fas fa-search header__search-btn-icon"></i>
							</button>
						</form>
					</div>

					<div class="header__cart">
						<div class="header__cart-wrap">
							<a href="${base }/cart/checkout" class="btn"> <i
								class="fas fa-shopping-cart header__cart-icon me-1"></i> <span
								id="iconShowTotalItemsInCart" class="header__cart-notice">
									${totalItems} </span> <span class="header__cart-name">Giỏ hàng
									của bạn</span> <c:if test=" empty ${cart.getCartItems()}">
									<div class="header__cart-list header__cart-list--no-cart">
										<img src="./assets/img/no-cart.png" alt=""
											class="header__cart-no-cart-img">
									</div>
								</c:if> <!--Has cart-->
								<div class="header__cart-list">
									<div class="header__cart-heading">Sản phẩm đã thêm</div>
									<c:forEach items="${cart.getCartItems()}" var="ci">
										<ul class="header__cart-list-item">
											<li class="header__cart-item"><img
												src="${base}/upload/${ci.avatar}" alt=""
												class="header__cart-img">
												<div class="header__cart-item-info">
													<div class="header__cart-item-head">
														<h5 class="header__cart-item-name">${ci.productName}</h5>
														<div class="header__cart-item-price-wrap">
															<span class="header__cart-item-price">${ci.priceUnit}</span>
															<span class="header__cart-item-multiply">x</span> <span
																class="header__cart-item-quanlity">${ci.quanlity}</span>
														</div>
													</div>
													<div class="header__cart-item-body">
														<span class="header__cart-item-des"> Phân loại :
															Gaming </span>
													</div>
												</div></li>

										</ul>
									</c:forEach>

									<button class="btn btn--primary header__cart-view">Xem
										giỏ hàng</button>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>

		</header>

		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="${base}/img/slider5.jpg"
						alt="First slide" style="height: 460px;">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="${base}/img/slider2.jpg"
						alt="Second slide" style="height: 460px;">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="${base}/img/slider3.jpg"
						alt="Third slide" style="height: 460px;">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="${base}/img/slider4.jpg"
						alt="Fourth slide" style="height: 460px;">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="${base}/img/slider1.jpg"
						alt="Five slide" style="height: 460px;">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>

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
											href="${base}/trang-chu" title="keyword">${category.name}</a></li>
									</c:forEach>

								</ul>
							</nav>
						</form>
					</div>
					<div class="grid__columnn-10">
						<form action="${base}/trang-chu" class="py-5" method="get">
							<div class="home-filter">
								<input id="page" name="page" class="form-control"
									style="display: none"> <input type="text" id="keyword"
									name="keyword" class="form-control" placeholder="Search"
									style="margin-right: 5px;" value="${searchModel.keyword}">
								<span class="home-filter__label">Sắp xếp theo</span>
								<div class="select-input">
									<select class="select-input__label" name="sort_by" id="sort_by"
										style="margin-right: 5px;">
										<option value="0">Lọc theo</option>
										<option value="giathap">Giá : Thấp đến cao</option>
										<option value="giacao">Giá : Cao đến thấp</option>
									</select> <i class="fas fa-angle-down"></i>

								</div>
								<button type="submit" id="btnSearch" name="btnSearch"
									value="Search" class="btn btn-primary">Seach</button>
						</form>
					</div>
					<section>
						<div class="container px-4 px-lg-5 mt-5">
							<div
								class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

								<c:forEach var="c" items="${pdProducts.data}" varStatus="loop">
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

													<!-- Product reviews-->
													<div
														class="d-flex justify-content-center small text-warning mb-2">
														<div class="bi-star-fill"></div>
														<div class="bi-star-fill"></div>
														<div class="bi-star-fill"></div>
														<div class="bi-star-fill"></div>
														<div class="bi-star-fill"></div>
													</div>

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
														onclick="AddToCart('${base}',${c.id}, 1)">Add to cart</a>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="row">
							<div class="col-12 d-flex justify-content-center">
								<div id="paging"></div>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${base}/js/jquery.simplePagination.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#paging").pagination({
			currentPage: ${pdProducts.currentPage}, //trang hiện tại
	        items: ${pdProducts.totalItems},	//tổng số sản phẩm
	        itemsOnPage: ${pdProducts.sizeOfPage}, //số sản phẩm trên 1 trang
	        cssStyle: 'compact-theme',
	        onPageClick: function(pageNumber, event) {
	        	$('#page').val(pageNumber);
	        	$('#btnSearch').trigger('click');
	        	$('categoryId').val(pdProducts.getCategoryId());
			},
	    });
	});
	</script>

</body>
</html>
