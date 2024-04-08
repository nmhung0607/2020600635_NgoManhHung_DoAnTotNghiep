<!-- để hiển thị tiếng việt thêm tất cả vào các trang jsp câu lệnh dưới -->
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
<title>Admin</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' type='text/css' media='screen'
	href='${base}/css/administrator.css'>
<script src='main.js'></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>


<link
	href="${base}/css/summernote-bs4.min.css"
	rel="stylesheet">
	<link href="${base}/font/summernote" rel="stylesheet">
</head>
<body>
	<div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">Start Bootstrap</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Dashboard</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Danh mục</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base }/admin/admin_viewProducts">Sản phẩm</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Đơn hàng</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Profile</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base}/admin/admin_viewContact">Contact</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Subcrible</a>
                </div>
            </div>
            
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                
                <!-- Top navigation-->
            	<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
	<div class="container-fluid">
		<button class="btn btn-primary" id="sidebarToggle">Toggle
			Menu</button>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
				<li class="nav-item active"><a class="nav-link" href="#!">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#!">Link</a></li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
					<div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#!">Action</a> 
						
						<c:if test="${isAdmin }">
							<a class="dropdown-item" href="#!">Another action</a>
						</c:if>						
						
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="${base }/logout">Logout(${userLogined.email })</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
</nav>
		<sf:form modelAttribute="product" style="margin-top:50px"
			action="${base}/admin/admin_addProduct" method="POST"
			enctype="multipart/form-data">
			<div class="form-group mb-2">
								<label for="productId">Product Id</label>
								<sf:input path="id" id="productId" class="form-control"></sf:input>
							</div>
							
							<div class="form-group mb-2">
								<label for="category">Category (required)</label>
								<sf:select path="categories.id" class="form-control" id="category">
									<sf:options items="${categories }" itemValue="id" itemLabel="name" />
								</sf:select>
							</div>
							
							<div class="form-group mb-2">
								<label for="title">Title (required)</label>
								<sf:input path="title" autocomplete="off" type="text" class="form-control" id="title" placeholder="Title" required="required"></sf:input>
							</div>
							
							<div class="form-group mb-2">
								<label for="price">Price (required)</label>
								<sf:input type="number" autocomplete="off" path="price" class="form-control" id="price" placeholder="Price" required="required"></sf:input>
							</div>
							
							<div class="form-group mb-2">
								<label for="priceSale">Price Sale (required)</label>
								<sf:input type="number" autocomplete="off" path="price_sale" class="form-control" id="priceSale" placeholder="Price sale" required="required"></sf:input>
							</div>
							
							<div class="form-group mb-2">
								<label for="short_description">Description (required)</label>
								<sf:textarea autocomplete="off" path="short_description" class="form-control" placeholder="Short Description" id="short_description" rows="3" required="required"></sf:textarea>
							</div>
							
							<div class="form-group mb-2">
								<label for="detail_description">Details (required)</label>
								<sf:textarea autocomplete="off" path="details" class="form-control summernote" id="detail_description" rows="3" required="required"></sf:textarea>
							</div>
							
							<div class="form-group form-check mb-2">
								<sf:checkbox path="is_hot" class="form-check-input" id="isHot" />
								<label class="form-check-label" for="isHot">Is Hot Product?</label>
							</div>
	
							<div class="form-group mb-2">
								<label for="fileProductAvatar">Avatar</label> 
								<input id="fileProductAvatar" name="productAvatar" type="file" class="form-control">
							</div>
							
							<div class="form-group">
								<img alt="" style="width: 100px; height: 100px;" src="${base }/upload/${product.avatar}">
							</div>
	
							<div class="form-group mb-2">
								<label for="fileProductPictures">Picture(Multiple)</label> 
								<input id="fileProductPictures" name="productPictures" type="file" class="form-control" multiple="multiple">
							</div>
							
							<div class="form-group">
								<c:forEach items="${product.productImages }" var="productImage">
									<img alt="" style="width: 100px; height: 100px;" src="${base }/upload/${productImage.path}">
								</c:forEach>
							</div>
						
            <a href="${base}/admin/admin_viewProducts" class="btn btn-secondary active" role="button" aria-pressed="true">Back to list</a>
			<button type="submit" class="btn btn-primary">Save Product</button>
			<div class="form-row">
				<div class="form-group col-sm-6">
					<c:if test="${not empty messageProduct }">
						<div class="alert alert-primary" role="alert">${messageProduct }</div>
					</c:if>
				</div>

			</div>
			</sf:form>

		<jsp:include page="/WEB-INF/views/customer/footer.jsp"></jsp:include>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${base}/js/summernote-bs4.min.js"></script>
	<script type="text/javascript">
			$(document).ready(function() {
				$('#detail_description').summernote();
			});
		</script>
</body>
</html>