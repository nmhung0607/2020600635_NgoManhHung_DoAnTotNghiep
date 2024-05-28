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
<style>

.grid__columnn-10 .home-filter input[type="number"] {
    width: 100%;
    padding: 8px;
    border: 1px solid #ced4da;
    border-radius: 4px;
    background-color: #fff;
    font-size: 16px;
    color: #495057;
    margin-top: 5px; /* Khoảng cách giữa các ô input */
}
.grid__columnn-10 .home-filter label {
    display: block; /* Hiển thị mỗi label trên một dòng */
    margin-bottom: 5px; /* Khoảng cách giữa các label */
    font-weight: bold; /* Định dạng chữ in đậm */
}
/* Định dạng khi input được focus */
.grid__columnn-10 .home-filter input[type="number"]:focus {
    outline: none; /* Loại bỏ đường viền khi input được focus */
    border-color: #80bdff; /* Màu viền khi input được focus */
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25); /* Hiệu ứng shadow khi input được focus */
}
label {
    display: block; /* Hiển thị nhãn trên mỗi dòng */
    margin-bottom: 5px; /* Khoảng cách giữa các nhãn */
    font-weight: bold; /* Định dạng chữ đậm */
}

/* Định dạng trường nhập */
.input-field {
    width: 150px; /* Độ rộng của trường nhập */
    padding: 8px; /* Khoảng cách bên trong trường nhập */
    border: 1px solid #ccc; /* Viền của trường nhập */
    border-radius: 5px; /* Độ cong của góc */
    box-sizing: border-box; /* Tính cả kích thước padding và border vào kích thước */
    margin-bottom: 10px; /* Khoảng cách giữa các trường nhập */

}
</style>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${base}/font/fontawesome-free-6.1.1-web/css/all.css">
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
											href="/danh-muc?categoryId=${category.id}" id ="categoryName"  title="${category.name}" value="${category.name}">${category.name}</a></li>
									</c:forEach>

								</ul>
							</nav>
						</form>
					</div>
					<div class="grid__columnn-10">
						<form action="${base}/trang-chu" class="py-5" method="get">
							<div class="home-filter">
								<input id="page" name="page" class="form-control" type="hidden"> 
								<input type="text" id="keyword"
									name="keyword" class="form-control" placeholder="Tìm kiếm"
									style="margin-right: 5px;" value="${searchModel.keyword}">
								<span class="home-filter__label">Sắp xếp theo</span>
								<div class="select-input"> 
								    <select class="form-control" name="sort_by" id="sort_by"
						style="margin-right: 5px;" value="${searchModel.sort_by}">
						<option value="${searchModel.sort_by}">Tất cả</option>
						<option value="giathap">Giá : Cao đến thấp</option>
						<option value="giacao">Giá : Thấp đến cao</option>
					</select>
									

								</div> <br/>
								<span class="home-filter__label">   Lọc theo giá</span>
								<label for="minValue">Từ:</label>
    <input type="number" id="minValue" name="minValue">

    <label for="maxValue">Đến:</label>
    <input type="number" id="maxValue" name="maxValue">
								<button type="submit" id="btnSearch" name="btnSearch"
									value="Search" class="btn btn-primary">Tìm kiếm</button>
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
												style="top: 1.2rem; right: 1.2rem">${giamgia[loop.index+1] }</div>
                                          
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
													<span class="text-muted " style="text-decoration:line-through;">
														<fmt:formatNumber value="${c.price}" type="currency" />
													</span>
													<fmt:formatNumber value="${c.price_sale}" type="currency" />

												</div>
											</div>

											<!-- Product actions-->
											<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
												<div class="text-center">
													<a class="btn btn-outline-dark mt-auto" href="#"
														onclick="AddToCart('${base}',${c.id}, 1)"><i class="fa-solid fa-cart-shopping"></i>  Thêm vào giỏ hàng</a>
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
<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
<df-messenger
  intent="WELCOME"
  chat-title="ChatBox"
  agent-id="d76c3bdf-63d4-450b-b1fa-6238444e0277"
  language-code="vi"
></df-messenger>
</body>
</html>
