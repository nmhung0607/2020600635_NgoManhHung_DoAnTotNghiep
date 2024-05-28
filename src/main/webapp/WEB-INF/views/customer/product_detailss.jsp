<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Product Details</title>
    <style>
    
    .product-container {
  display: flex;
  flex-wrap: wrap; /* Cho phép các sản phẩm xuống dòng khi không đủ không gian */
}
.carousel{
  display:none;
}
.related-product-images {
  width: calc(33.33% - 20px); /* 33.33% width cho mỗi ảnh sản phẩm và margin giữa các sản phẩm */
  margin-bottom: 20px;
}

/* Điều chỉnh margin nếu sản phẩm cuối cùng trên mỗi hàng */
.related-product-images:nth-child(3n+1) {
  margin-right: 20px;
}
.hidden {
    display: none;
}
/* Điều chỉnh chiều rộng của ảnh sản phẩm */
.img-container img {
  width: 100%; /* Chiều rộng tối đa của ảnh là 100% của phần tử cha */
  height: auto;
  transition: transform 0.3s ease-in-out;
}
.related-product-container {
  margin-top: 20px;
}

.related-product {
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  background-color: #f9f9f9;
}

.related-product h3 {
  margin-bottom: 15px;
  font-size: 20px;
  font-weight: bold;
}

.product-container {
  display: flex;
  justify-content: space-between;
}

.related-product-images {
  width: calc(33.33% - 10px); /* 33.33% width cho mỗi ảnh sản phẩm */
  margin-bottom: 20px;
}

.img-container {
  position: relative;
  overflow: hidden;
}

.img-container img {
  width: 100%;
  height: auto;
  transition: transform 0.3s ease-in-out;
}

.img-container img:hover {
  transform: scale(1.1);
}

.name-container {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  padding: 10px;
  background-color: rgba(255, 255, 255, 0.8);
}
.name-container a {
   text-decoration:none!important;
}
.name {
  margin: 0;
  font-size: 16px;
  font-weight: bold;
}

</style>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
      integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100;300;400;500;700&family=Lato:wght@400;700;900&display=swap"
      rel="stylesheet"
    />
    
    <jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
    <link rel="stylesheet" href="${base}/css/product_details.css" />
   
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
<link rel='stylesheet' type='text/css' media='screen'
	href="${base}/css/bootstrap.min.css">
	<link rel='stylesheet' type='text/css' media='screen'
	href="${base}/css/header.css">
  </head>
  <body>
  <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
    <!-- middle section -->
    <div class="middle-section">
      <div class="product">
        <div class="photos-grid">
          <div class="three-photos-container">
          <c:forEach begin="0" end="2" items="${productImg}" var="s">
            <div class="sub-photo">
              <img src="${base }/upload/${s.path }" alt="" />
            </div>
           </c:forEach>
            
          </div>
          <div class="big-photo-container">
            <img src="${base }/upload/${product.avatar}" alt="" />
          </div>
        </div>
        <div class="product-des">
          <h2>${product.title }</h2>
        
          <div class="price">
            <p class="new-price"><fmt:formatNumber value="${product.price_sale}" type="currency" /></p>
            <p class="old-price" style="text-decoration: line-through">
             <fmt:formatNumber value="${product.price}" type="currency" />
            </p>
          </div>
          <p class="color">Mô tả</p>
          <p class="des">
            ${product.short_description }
          </p>
          <div id="quantityDisplay">
          <p class="product-des">
            Số lượng sản phẩm : ${product.soluong }
          </p></div>
		<div class="text-center" id="addToCartSection">
			<a class="btn btn-outline-dark mt-auto" href="#" onclick="AddToCart('${base}',${product.id}, 1)"><i class="fa-solid fa-cart-shopping"></i>Add to cart</a>
		</div>
									
          <p class="cat" style="font-weight: 600">Categories: ${product.getCategories().name}</p>
          <p class="tags" style="font-weight: 600">Tags:${product.getCategories().name}	</p>
          <div class="social-media-sharing" style="font-weight: 600">
            <p class="share">Share</p>
            <i class="fa-brands fa-facebook"></i>
            <i class="fa-brands fa-instagram"></i>
            <i class="fa-brands fa-twitter-square"></i>
          </div>
        </div>
      </div>
      <div class="product-information">
        <div class="attribute-container">
          <div class="description-attribute"><a href="">Mô tả chi tiết</a></div>
          
        </div>
        <div class="various-tempor">
          ${product.details }
        </div>
      </div>
      <div class="related-product-container">
        <div class="related-product">
          <h3>Sản phẩm liên qua</h3>
          <div class="product-container">
    <c:forEach var="ci" items="${products}" varStatus="loop" begin="1" end="3">
        <div class="related-product-images">
            <div class="img-container">
                <img src="${base }/upload/${ci.avatar}" alt=""/>
                <div class="name-container">
                    <p class="name fw-bolder"><a href="${base }/details/${ci.seo}">${ci.title }</a></p>
                </div>
               
            </div>
        </div>
    </c:forEach>
</div>
        </div>
      </div>
    </div>
    <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website</p></div>
     </footer>
    <!-- footer -->
    <script src="${base}/js/scripts.js"></script>
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
    <script>
    // Kiểm tra số lượng sản phẩm và ẩn hiện phần tử tương ứng
    var quantity = ${product.soluong}; // Lấy số lượng sản phẩm từ biến JSP
    var addToCartSection = document.getElementById("addToCartSection");
    var quantityDisplay = document.getElementById("quantityDisplay");
    if (quantity <= 0) {
    	quantityDisplay.classList.add("hidden");
    	var outOfStockMessage = document.createElement("p");
        outOfStockMessage.textContent = "Hết hàng";
        outOfStockMessage.style.fontWeight = "bold";
        outOfStockMessage.style.color = "red";
        addToCartSection.parentNode.insertBefore(outOfStockMessage, addToCartSection);
        document.querySelector("#addToCartSection > a.btn").style.display = "none";// Thay đổi nội dung thành "Hết hàng"
    }
</script>
  </body>
</html>
