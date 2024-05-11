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
            <p class="new-price"><fmt:formatNumber value="${product.price}" type="currency" /></p>
            <p class="old-price" style="text-decoration: line-through">
             <fmt:formatNumber value="${product.price_sale}" type="currency" />
            </p>
          </div>
          <p class="color">Mô tả</p>
          <p class="des">
            ${product.short_description }
          </p>
												<div class="text-center">
													<a class="btn btn-outline-dark mt-auto" href="#"
														onclick="AddToCart('${base}',${product.id}, 1)">Add to cart</a>
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
          <div class="description-attribute"><a href="">Description</a></div>
          <div class="additional-info-attribute">
            <a href="">Additional Info</a>
          </div>
          <div class="reviews-attribute"><a href="">Reviews</a></div>
          <div class="video-attribute"><a href="">Video</a></div>
        </div>
        <div class="various-tempor">
          ${product.details }
        </div>
      </div>
      <div class="related-product-container">
        <div class="related-product">
          <h3>Related Products</h3>
          <div class="related-product-images">
            <div class="img-container">
              <img
                src="./product_details_images/related_products/Rectangle 128.png"
                alt=""
              />
              <div class="name-container">
                <p class="name"><a href="">Top Wall Digital Clock</a></p>
                <div class="stars">
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                </div>
              </div>
              <p class="price">$51.00</p>
            </div>

            <div class="img-container">
              <img
                src="./product_details_images/related_products/Rectangle 130.png"
                alt=""
              />
              <div class="name-container">
                <p class="name"><a href="">Mens Fashion Wear</a></p>
                <div class="stars">
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                </div>
              </div>
              <p class="price">$43.00</p>
            </div>

            <div class="img-container">
              <img
                src="./product_details_images/related_products/Rectangle 131.png"
                alt=""
              />
              <div class="name-container">
                <p class="name"><a href="">Women’s Fashion</a></p>
                <div class="stars">
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                </div>
              </div>
              <p class="price">$67.00</p>
            </div>

            <div class="img-container">
              <img
                src="./product_details_images/related_products/Rectangle 133.png"
                alt=""
              />
              <div class="name-container">
                <p class="name"><a href="">Wolx Dummy Fashion</a></p>
                <div class="stars">
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                  <i class="fa-solid fa-star"></i>
                </div>
              </div>
              <p class="price">$67.00</p>
            </div>
          </div>

          <div class="sponsor-bottom">
            <img src="login_images/sponsors.png" alt="" />
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
  </body>
</html>
