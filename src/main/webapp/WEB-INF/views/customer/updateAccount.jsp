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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập nhật tài khoản</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel='stylesheet' type='text/css' media='screen'
	href="${base}/css/header_main.css">
<link rel='stylesheet' type='text/css' media='screen'
	href="${base}/css/header_base.css">
	<link rel='stylesheet' type='text/css' media='screen'
	href="${base}/css/header.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
    <div class="container">
        <h2 class="mt-5">Cập nhật thông tin tài khoản</h2>
        <form action="${base}/cap-nhat-account/${userLogined.username}" method="post">
  
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name ="email" required>
            </div>
            
            <div class="form-group">
                <label for="phone">Số điện thoại:</label>
                <input type="text" class="form-control" id="phone" name="phone" required>
            </div>
            
            <div class="form-group">
                <label for="shippingAddress">Địa chỉ giao hàng:</label>
                <input type="text" class="form-control" id="shipping_address" name="shipping_address" required>
            </div>
            
            <button type="submit" class="btn btn-primary">Cập nhật</button>
        </form>
    </div>
    <jsp:include page="/WEB-INF/views/customer/footer.jsp"></jsp:include>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
