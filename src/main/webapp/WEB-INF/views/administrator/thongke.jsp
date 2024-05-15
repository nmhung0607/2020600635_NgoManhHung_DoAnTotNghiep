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
    <title>Admin View Dashboard</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
     <style>
        /* CSS để điều chỉnh kích thước biểu đồ */
        #chartContainer {
            width: 400px;
            height: 200px;
        }
        #revenueChart {
            width: 100%;
            height: 100%;
        }
    </style>
    <link rel='stylesheet' type='text/css' media='screen' href='../css/administrator.css'>
    <script src='main.js'></script>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${base}/css/simplePagination.css">
    <link rel="stylesheet" type="text/css" href="${base}/font/fontawesome-free-6.1.1-web/css/all.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
		<h1>Doanh Số Theo Ngày</h1>
    <div id="chartContainer">
    <!-- Đây là nơi bạn sẽ hiển thị biểu đồ -->
    <canvas id="revenueChart"></canvas>
    </div>
    <%-- Script Java để vẽ biểu đồ --%>
    <script>
        // Lấy dữ liệu từ model và truyền vào biến JavaScript
        var dates = ${dates};
        var revenues = ${revenues};
        dates = dates.map(date => new Date(date).toLocaleDateString('vi-VN'));
        // Tạo biểu đồ
        var ctx = document.getElementById('revenueChart').getContext('2d');
        var revenueChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: dates,
                datasets: [{
                    label: 'Doanh số theo các ngày (tính theo triệu vnđ)',
                    data: revenues,
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
    </script>
		<jsp:include page="/WEB-INF/views/customer/footer.jsp"></jsp:include>
    </div>
    <script src="${base}/js/jquery-3.6.0.min.js"></script>
	<script src="${base}/js/jquery.simplePagination.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
