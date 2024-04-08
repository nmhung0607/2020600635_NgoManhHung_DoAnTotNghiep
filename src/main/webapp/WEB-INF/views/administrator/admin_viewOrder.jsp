<!-- để hiển thị tiếng việt thêm tất cả vào các trang jsp câu lệnh dưới -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Admin View Contact</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='../css/administrator.css'>
    <script src='main.js'></script>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${base}/css/simplePagination.css">
</head>
<body>
    <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">ADMIN</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Dashboard</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base }/admin/admin_viewProducts">Sản phẩm</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Đơn hàng</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Profile</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base}/admin/admin_viewContact">Contact</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Subcriber</a>
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
<form action="${base }/admin/admin_viewOrder" class="form-inline"
			method="get">
			<div class="d-flex flex-row justify-content-between mt-4">
				<div class="d-flex flex-row">
				<input name="page" id="page" class="form-control" style="display:none">
					<!-- tìm kiếm theo tên sản phẩm -->
					<input type="text" id="keyword" name="keyword" class="form-control"
						placeholder="Search" style="margin-right: 5px;" value="${searchModel.keyword}">
                    <select class="form-control" name="orderAddress" id="orderAddress"
						style="margin-right: 5px;" value="${searchModel.orderAddress}">
						<option value="0">Địa chỉ</option>
						<c:forEach items="${saleOrders}" var="s">
							<option value="${s.customerAddress}">${s.customerAddress }</option>
						</c:forEach>
					</select>
					<!-- tìm kiếm theo danh mục sản phẩm -->
					<button type="submit" id="btnSearch" name="btnSearch"
						value="Search" class="btn btn-primary">Seach</button>
				</div>
			</div>
     <table border="1" class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Tên Khách Hàng</th>
                    <th scope="col">Địa chỉ khách hàng</th>
                    <th scope="col">Điện thoại liên lạc</th>
                    <th scope="col">Email</th>
    
                </tr>
            </thead>
        <c:forEach var="c" items="${orderList.data}" varStatus="loop">
            <tbody>
                <tr>
                    <td>${c.id}</td>
                    <td>${c.customerName}</td>
                    <td>${c.customerAddress}</td>
                    <td>${c.customerPhone}</td>
                    <td>${c.customerEmail}</td>
                   
                </tr>
            </tbody>

        </c:forEach>
        
        </table>
            <div class="row">
				<div class="col-12 d-flex justify-content-center">
					<div id="paging"></div>
				</div>
		     </div>
		</form>
		
		<jsp:include page="/WEB-INF/views/customer/footer.jsp"></jsp:include>
    </div>
    <script src="${base}/js/jquery-3.6.0.min.js"></script>
	<script src="${base}/js/jquery.simplePagination.js"></script>
    <script type="text/javascript">
	
	$(document).ready(function() {
		$('#categoryId').val(${searchModel.categoryId});
		$("#paging").pagination({
			currentPage: ${orderList.currentPage}, //trang hiện tại
	        items: ${orderList.totalItems},	//tổng số sản phẩm
	        itemsOnPage: ${orderList.sizeOfPage}, //số sản phẩm trên 1 trang
	        cssStyle: 'light-theme',
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