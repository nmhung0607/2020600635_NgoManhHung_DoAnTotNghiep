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
	href='../css/administrator.css'>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${base}/font/fontawesome-free-6.1.1-web/css/all.css">
<link rel='stylesheet' type='text/css' media='screen'
	href="${base}/css/simplePagination.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
				<li class="nav-item active"><a class="nav-link" href="${base }/admin/admin_viewProducts">Thống kê</a></li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Tài khoản</a>
					<div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
						
						<c:if test="${isAdmin }">
							<a class="dropdown-item" href="#!"> ${userLogined.username }</a>
						</c:if>						
						
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="${base }/logout">Đăng xuất(${userLogined.username })</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
</nav>
	<div class="content-right">
		<form action="${base }/admin/admin_viewProducts" class="form-inline"
			method="get">
			<div class="d-flex flex-row justify-content-between mt-4">
				<div class="d-flex flex-row">
				    <input name="page" id="page" class="form-control" type="hidden">
					<!-- tìm kiếm theo tên sản phẩm -->
					<input type="text" id="keyword" name="keyword" class="form-control"
						placeholder="Tìm kiếm" style="margin-right: 5px;" value="${searchModel.keyword}">

					<!-- tìm kiếm theo danh mục sản phẩm -->
					<select class="form-control" name="categoryId" id="categoryId"
						style="margin-right: 5px;" value="${searchModel.categoryId}">
						<option value="0">Tất cả</option>
						<c:forEach items="${categories}" var="category">
							<option value="${category.id }">${category.name }</option>
						</c:forEach>
					</select>

					<button type="submit" id="btnSearch" name="btnSearch"
						value="Search" class="btn btn-primary">Tìm kiếm</button>
				</div>
				<div class="d-flex flex-row" style="margin-left: 200px">
					<a class="btn btn-outline-primary mb-1"
						href="${base }/admin/admin_addProduct" role="button"> Thêm sản phẩm
					</a>
				</div>
			</div>
			<table border="1" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">ID</th>
						<th scope="col">Tên sản phẩm</th>
						<th scope="col">Hình ảnh</th>
						<th scope="col">Giá gốc</th>
						<th scope="col">Giá giảm</th>
						<th scope="col">Mô tả ngắn gọn</th>
						<th scope="col">Mô tả chi tiết</th>
					</tr>
				</thead>
				<c:forEach var="c" items="${pdProducts.data}" varStatus="loop">
					<tbody>
						<tr>
							<th scope="row" width="5%">${loop.index + 1}</th>
							<td>${c.id}</td>
							<td>${c.title}</td>
							<td><img alt="" style="width: 100px; height: 100px;"
								src="${base }/upload/${c.avatar}"></td>
							<td><fmt:setLocale value="vi_VN" scope="session" /> <fmt:formatNumber
									value="${c.price }" type="currency" /></td>
							<td><fmt:setLocale value="vi_VN" scope="session" /> <fmt:formatNumber
									value="${c.price_sale}" type="currency" /></td>
							<td>${c.short_description}</td>
							<td>${c.details}</td>
							<td>
							  <span id="_product_status_${c.id }">
							     <c:choose>
							         <c:when test="${c.status}">
							            <input type="checkbox" checked="checked" readonly="readonly">
							         </c:when>
							         <c:otherwise>
							             <input type="checkbox"  readonly="readonly">
							             </c:otherwise>
							             </c:choose>
							   </span>
							</td>
							<td><a class="btn btn-danger" role="button"
								onclick="DeleteProduct(${c.id});">Xóa</a> 
								<a
								href="${base}/admin/admin_addProduct/${c.id}"
								class="btn btn-primary">Chỉnh sửa</a></td>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
function DeleteProduct(productId) {
    Swal.fire({
        title: 'Bạn có chắc chắn?',
        text: "Bạn sẽ không thể hoàn tác hành động này!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Xóa!',
        cancelButtonText: 'Hủy'
    }).then((result) => {
        if (result.isConfirmed) {
            // tạo javascript object.
            var data = {
                id: productId,
            };

            // $ === jQuery
            // json == javascript object
            jQuery.ajax({
                url:  '${base}' + "/admin/product/delete",
                type: "post",
                contentType: "application/json",
                data: JSON.stringify(data),
                dataType: "json",
                success: function(jsonResult) {
                    Swal.fire(
                        'Đã xóa!',
                        'Sản phẩm đã được xóa.',
                        'success'
                    ).then(() => {
                        location.reload();
                    });
                },
                error: function(jqXhr, textStatus, errorMessage) {
                    Swal.fire(
                        'Lỗi!',
                        'Đã có lỗi xảy ra khi xóa sản phẩm.',
                        'error'
                    );
                }
            });
        }
    });
    }

	
	$(document).ready(function() {
		$('#categoryId').val(${searchModel.categoryId});
		$("#paging").pagination({
			currentPage: ${pdProducts.currentPage}, //trang hiện tại
	        items: ${pdProducts.totalItems},	//tổng số sản phẩm
	        itemsOnPage: ${pdProducts.sizeOfPage}, //số sản phẩm trên 1 trang
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