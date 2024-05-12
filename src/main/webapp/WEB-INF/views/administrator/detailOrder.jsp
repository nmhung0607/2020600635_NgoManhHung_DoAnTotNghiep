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
    <link rel='stylesheet' type='text/css' media='screen' href='${base}/css/administrator.css'>
    <script src='${base}/js/main.js'></script>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${base}/css/simplePagination.css">
</head>
<style>
    /* CSS cho h2 */
    h2 {
        font-size: 24px;
        color: #333; /* Màu chữ */
        margin-bottom: 10px;
    }

    /* Kiểu cho thông tin khách hàng */
    .customer-info {
        margin-bottom: 20px;
    }

    .customer-info h3 {
        font-size: 18px;
        color: #555;
        margin-bottom: 5px;
    }

    .customer-info h4 {
        font-size: 16px;
        color: #777;
        margin-bottom: 5px;
    }
</style>
<body>
    <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">ADMIN</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Dashboard</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base }/admin/admin_viewCategory"">Danh mục</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base }/admin/admin_viewProducts">Sản phẩm</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base}/admin/admin_viewOrder">Đơn hàng</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base }/admin/admin_viewAccount"">Profile</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base}/admin/admin_viewContact">Contact</a>
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
							<a class="dropdown-item" href="#!"> ${userLogined.username }</a>
						</c:if>						
						
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="${base }/logout">Logout(${userLogined.username })</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
</nav>
   <h2>Thông tin khách hàng</h2>
<div class="customer-info">
    <label>Tên khách hàng </label>
    <h3>${order.customerName}</h3>
    <label>Email</label>
    <h4>${order.customerEmail}</h4>
    <label>Số điện thoại</label>
    <h4>${order.customerPhone}</h4>
    <label>Địa chỉ</label>
    <h4>${order.customerAddress}</h4>
</div>

<h2>Danh sách sản phẩm đơn hàng</h2>
     <table border="1" class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Hình ảnh</th>
                    <th scope="col">Tên hàng</th>
                    <th scope="col">Số lượng</th>
                    <th scope="col">Giá tiền</th>
                    <th scope="col">Action</th>
    
                </tr>
            </thead>
       
            <tbody>
                <c:forEach var="product" items="${orderProducts}">
        <tr>
            <td>${product.getProduct().getId()}</td>
            <td><img alt="" style="width: 100px; height: 100px;"
								src="${base }/upload/${product.getProduct().getAvatar()}"></td> 
            <td>${product.getProduct().getTitle()}</td>
            <td>${product.quality}</td>
            <td><fmt:setLocale value="vi_VN" scope="session" /> <fmt:formatNumber
									value="${product.getProduct().getPrice()}" type="currency" /></td>
            <td><a href="${base}/admin/adminViewOrderDetails/${product.saleOrder.id}">Chi tiết</a></td>
        </tr>
       
    </c:forEach>
            </tbody>

  
        <label>Tổng số tiền :</label> <fmt:setLocale value="vi_VN" scope="session" /> <fmt:formatNumber
									value="${order.total}" type="currency" /></p>
        </table>
		</div>
    </div>
    <script src="${base}/js/jquery-3.6.0.min.js"></script>
	<script src="${base}/js/jquery.simplePagination.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
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