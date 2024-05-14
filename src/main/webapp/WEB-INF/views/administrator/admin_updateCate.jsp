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
	<link rel="stylesheet" type="text/css" href="${base}/font/fontawesome-free-6.1.1-web/css/all.css">
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
                <div class="sidebar-heading border-bottom bg-light "><i class="fa-solid fa-user-tie"></i>   ADMIN</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base }/admin/doanhso"><i class="fa-solid fa-chart-simple"></i>   Dashboard</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3 " href="${base }/admin/admin_viewCategory"> <i class="fa-solid fa-list"></i>   Danh mục</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base }/admin/admin_viewProducts"><i class="fa-solid fa-bag-shopping"></i>   Sản phẩm</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base}/admin/admin_viewOrder"><i class="fa-solid fa-dollar-sign"></i>   Đơn hàng</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base }/admin/admin_viewAccount""><i class="fa-solid fa-user"></i>   Profile</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base}/admin/admin_viewContact"><i class="fa-solid fa-message"></i>   Contact</a>
                </div>
            </div>
            
            
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                
                <!-- Top navigation-->
            	<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
	<div class="container-fluid">
		
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
				<li class="nav-item active"><a class="nav-link" href="${base }/admin/admin_viewProducts">Home</a></li>
				
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Account</a>
					<div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
					
						
						<c:if test="${isAdmin }">
							<a class="dropdown-item" href="#!">${userLogined.username }</a>
						</c:if>						
						
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="${base }/logout">Logout(${userLogined.username })</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
</nav>
		<sf:form modelAttribute="category" style="margin-top:50px"
			action="${base}/admin/update_category/${category.id}" method="POST"
			enctype="multipart/form-data">
			<div class="form-group mb-2">
								<label for="categoryId">Category Id</label>
								<sf:input path="id" id="categoryId" class="form-control" name="categoryId"></sf:input>
							</div>
							<div class="form-group mb-2">
								<label for="name">Name</label>
								<sf:input path="name" autocomplete="off" type="text" class="form-control" id="name" placeholder="name" required="required"></sf:input>
						
            <a href="${base}/admin/admin_viewCategory" class="btn btn-secondary active" role="button" aria-pressed="true">Back to list</a>
			<button type="submit" class="btn btn-primary">Save Category</button>
			<div class="form-row">
				<div class="form-group col-sm-6">
					<c:if test="${not empty message }">
						<div class="alert alert-primary" role="alert">${message}</div>
					</c:if>
				</div>

			</div>
			</sf:form>

		<jsp:include page="/WEB-INF/views/customer/footer.jsp"></jsp:include>
	</div>
	<script src="${base}/js/jquery-3.6.0.min.js"></script>
	<script src="${base}/js/jquery.simplePagination.js"></script>
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