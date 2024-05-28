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
    <link rel="stylesheet" type="text/css" href="${base}/font/fontawesome-free-6.1.1-web/css/all.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${base}/css/simplePagination.css">
</head>
<style>
        .customer-info {
            display: flex;
            flex-wrap: wrap;
            background-color: #f9f9f9;
            padding: 10px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 10px auto;
            font-family: Arial, sans-serif;
        }

        .customer-info > div {
            flex: 1 1 50%; /* Chia đôi màn hình */
            padding: 10px;
        }

        .customer-info label {
            font-weight: bold;
            color: #333;
        }

        .customer-info h3, 
        .customer-info h4 {
            margin: 5px 0;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
            color: #555;
        }

        .customer-info h3 {
            font-size: 1.5em;
            color: black;
        }

        .customer-info h4 {
            font-size: 1.2em;
        }
    </style>
<body>
   <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
             <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light "><i class="fa-solid fa-user-tie"></i>   ADMIN</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base }/admin/doanhso"><i class="fa-solid fa-chart-simple"></i>   Thống kê</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3 " href="${base }/admin/admin_viewCategory"> <i class="fa-solid fa-list"></i>   Danh mục</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base }/admin/admin_viewProducts"><i class="fa-solid fa-bag-shopping"></i>   Sản phẩm</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base}/admin/admin_viewOrder"><i class="fa-solid fa-dollar-sign"></i>   Đơn hàng</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base }/admin/admin_viewAccount""><i class="fa-solid fa-user"></i>   Tài khoản</a> 
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base}/admin/admin_viewContact"><i class="fa-solid fa-message"></i>   Liên hệ</a>
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
				<li class="nav-item active"><a class="nav-link" href="${base }/admin/admin_viewProducts">Thống kê</a></li>
				
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Tài khoản</a>
					<div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
					
						
						<c:if test="${isAdmin }">
							<a class="dropdown-item" href="#!">${userLogined.username }</a>
						</c:if>						
						
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="${base }/logout">Đăng xuất(${userLogined.username })</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
</nav>
  <div class="customer-info">
        <div>
            <label>Tên khách hàng</label>
            <h3>${order.customerName}</h3>
        </div>
        <div>
            <label>Email</label>
            <h4>${order.customerEmail}</h4>
        </div>
        <div>
            <label>Số điện thoại</label>
            <h4>${order.customerPhone}</h4>
        </div>
        <div>
            <label>Địa chỉ</label>
            <h4>${order.customerAddress}</h4>
        </div>
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