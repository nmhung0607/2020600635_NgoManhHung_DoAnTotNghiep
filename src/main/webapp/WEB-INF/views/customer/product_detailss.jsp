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
    <link rel="stylesheet" href="${base}/css/general.css" />
    <link rel="stylesheet" href="${base}/login_page.css" />
    <jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
    <link rel="stylesheet" href="${base}/css/product_details.css" />
    <link rel='stylesheet' type='text/css' media='screen'
	href="${base}/css/header_main.css">
<link rel='stylesheet' type='text/css' media='screen'
	href="${base}/css/header_base.css">
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
            <div class="sub-photo">
              <img src="product_details_images/Rectangle 134.png" alt="" />
            </div>
            <div class="sub-photo">
              <img src="product_details_images/Rectangle 136.png" alt="" />
            </div>
            <div class="sub-photo">
              <img src="product_details_images/Rectangle 137.png" alt="" />
            </div>
          </div>
          <div class="big-photo-container">
            <img src="${base }/upload/${product.avatar}" alt="" />
          </div>
        </div>
        <div class="product-des">
          <h2>${product.title }</h2>
          <div class="five_stars">
            <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i
            ><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i
            ><i class="fa-solid fa-star"></i>
            (22)
          </div>
          <div class="price">
            <p class="new-price">${product.price_sale }</p>
            <p class="old-price" style="text-decoration: line-through">
              ${product.price }
            </p>
          </div>
          <p class="color">Dung lượng</p>
          <p class="des">
            Laptop văn phòng
          </p>
          <div class="add_love">
            <div class="add">Add To cart</div>
            <button type="button" class="love">
              <i class="fa-solid fa-heart"></i>
            </button>
          </div>
          <p class="cat" style="font-weight: 600">Categories:</p>
          <p class="tags" style="font-weight: 600">Tags</p>
          <div class="social-media-sharing" style="font-weight: 600">
            <p class="share">Share</p>
            <i class="fa-brands fa-facebook"></i>
            <i class="fa-brands fa-instagram"></i>
            <i class="fa-brands fa-twitter-square"></i>
          </div>
        </div>
      </div>
      </div>
      <div class="product-information">
        <div class="attribute-container">
          <div class="description-attribute"><a href="">Description</a></div>
          <div class="additional-info-attribute">
            <a href="">Additional Info</a>
          </div>
          <div class="reviews-attribute"><a href="">Reviews</a></div>
          <div class="video-attribute"><a href="">Video</a></div>
        </div>
        <div class="various-tempor">
         
          <p>
           ${product.details }
          </p>
        </div>
      <div class="related-product-container">
        <div class="related-product">
          <h3>Related Products</h3> 
          
          <div class="related-product-images">
          <c:forEach var="c" items="${products}" varStatus="loop">
            <div class="img-container">
              <img
                src="${base }/upload/${c.avatar}"
                alt=""
              />
              <div class="name-container">
                <p class="name"><a href="">${c.title }</a></p>
                </div>
                <div class="stars">
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                </div>
              </div>
              <p class="price">$51.00</p>
              <div class="add_love">
            <button class="add">Add To cart</button>>
            
          </div>
             </c:forEach>
        </div>
      </div>
    </div>
   
    <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website</p></div>
     </footer>
    <!-- footer -->
    
      
    
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
  </body>
</html>
