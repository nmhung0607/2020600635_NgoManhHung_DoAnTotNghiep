<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Cart</title>
<style>
.carousel{
  display:none;
}</style>
<!-- COMMON -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
<link rel='stylesheet' type='text/css' media='screen'
	href="${base}/css/bootstrap.min.css">
	<link rel='stylesheet' type='text/css' media='screen'
	href="${base}/css/header.css">
	<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link rel='stylesheet' type='text/css' media='screen'
	href="${base}/css/header_main.css">
<link rel='stylesheet' type='text/css' media='screen'
	href="${base}/css/header_base.css">
<!-- CSS -->


</head>

<body>

	<!-- Navigation-->
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>

	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			
			<!-- Danh sách sản phẩm trong giỏ hàng -->
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
						<th scope="col" class="border-0 bg-light">
								<div class="p-2 px-3 text-uppercase">Hình ảnh</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="p-2 px-3 text-uppercase">Sản phẩm</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Giá</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Số lượng</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Xóa</div>
							</th>
						</tr>
					</thead>
					<tbody>
						
						<!-- hiển thị danh sách sản phẩm trong giỏ hàng -->
						<c:forEach items="${cart.cartItems}" var="ci">
							<tr>
								    <td class="border-0 align-middle">
    <img src="${base}/upload/${ci.avatar}" alt="Product Image" width="70px" class="img-fluid rounded shadow-sm">
</td>

									<td class="border-0 align-middle ">
									<strong>${ci.productName}</strong>
								    </td>
							
								
								<td class="border-0 align-middle ">
									<strong>${ci.priceUnit}</strong>
								</td>
								<td class="border-0 align-middle change-slg">
								    <div class="addd flex11">
									<button onclick="UpdateQuanlityCart('${base }', ${ci.productId}, -1)" value="-">-</button>
									<strong><span  id="quanlity_${ci.productId}" class="total_1_sp" style="font-size:15px">${ci.quanlity}</span></strong>
									<button onclick="UpdateQuanlityCart('${base }', ${ci.productId}, 1)" value="+">+</button>
								</td>
								<td class="border-0 align-middle">
									<a href="#" class="text-dark" onclick="deleteProduct(${ci.productId})"><i class="fa fa-trash remove-product">Xóa</i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- form cho việc thanh toán -->
			<form action="${base }/cart/checkout" method="post">
			
				<div class="row py-5 p-4 bg-white rounded shadow-sm">
					<div class="col-lg-6">
						<div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thông tin khách hàng</div>
						<div class="p-4">
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerPhone">Tên khách hàng</label>
								<input type="text" class="form-control" id="customerFullName" name="customerFullName" value="${userLogined.username}"  required>
							</div>
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerEmail">Địa chỉ email</label>
								<input type="email" class="form-control" id="customerEmail" name="customerEmail" value="${userLogined.email }"  required>
								<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							</div>
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerPhone">Số điện thoại</label>
								<input type="tel" class="form-control" id="customerPhone" name="customerPhone" value="${userLogined.phone}" required>
							</div>
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerAddress">Địa chỉ</label>
								<input type="text" class="form-control" id="customerAddress" name="customerAddress"  value="${userLogined.shipping_address}" required>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thông tin thanh toán</div>
						<div class="p-4">
							<ul class="list-unstyled mb-4">
								<li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng tiền dự tính</strong><fmt:formatNumber value="${cart.totalPrice}" type="currency"/></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng tiền trả</strong> <h5 class="font-weight-bold"><fmt:formatNumber value="${cart.totalPrice}" type="currency"/></h5></li>
							</ul>
							<button type="submit" class="btn btn-dark rounded-pill py-2 btn-block">Thanh toán</button>
						</div>
					</div>
				</div>

			</form>

		</div>

	</section>

	<!-- Footer-->
	<jsp:include page="/WEB-INF/views/customer/footer.jsp"></jsp:include>

	<!-- JS -->
	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
	<script type="text/javascript">
    function deleteProduct(productId) {
		// javascript object.
		// data la du lieu ma day len action cua controller
		//alert(1);
		let data = {
			productId: productId,
		};
		
		// $ === jQuery
		// json == javascript object
		$.ajax({
			url : "/cart-delete",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),//biến trong (stringify) là phần trên khai báo let data;

			dataType : "json", // kieu du lieu tra ve tu controller la json
			success : function(jsonResult) {
				$("#totalCartItemId").html(jsonResult.totalItems);
				alert('Successfully removed !');
				location.reload();
			},
			error : function(jqXhr, textStatus, errorMessage) { // error callback 
				
			}
		});}
    
	</script>
</body>
</html>
