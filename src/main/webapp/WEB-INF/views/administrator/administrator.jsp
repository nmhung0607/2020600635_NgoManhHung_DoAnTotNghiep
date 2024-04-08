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
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Simple Sidebar - Start Bootstrap Template</title>
        
        <!-- Favicon-->
        <!-- <link rel="icon" type="image/x-icon" href="assets/favicon.ico" /> -->
		
		<!-- COMMON -->
		<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
		
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/administrator.css" rel="stylesheet" />
        
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
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${base}/admin/admin_viewOrder">Đơn hàng</a> 
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
						
						<c:if test="${isLogined}">
							<a class="dropdown-item" href="#!">Another action</a>
						</c:if>						
						
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="${base }/logout">Logout(${userLogined.email})</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
</nav>   
                
                <!-- Page content-->
                <div class="container-fluid">
                    <h1 class="mt-4">Simple Sidebar</h1>
                    <p>The starting state of the menu will appear collapsed on smaller screens, and will appear non-collapsed on larger screens. When toggled using the button below, the menu will change.</p>
                    <p>
                        Make sure to keep all page content within the
                        <code>#page-content-wrapper</code>
                        . The top navbar is optional, and just for demonstration. Just create an element with the
                        <code>#sidebarToggle</code>
                        ID which will toggle the menu when clicked.
                    </p>
                </div>
            </div>
        </div>
        
		<!-- JS -->
		<script src="../js/administrator.js"></script>
		
    </body>
</html>