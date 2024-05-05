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
      <div class="containerr flexx">
      <div class="leftt">
        <div class="main_imagee">
          <img src="${base }/upload/${product.avatar}" class="slide" style="width: 100%;height: 75%;">
        </div>
        <div class="optionn flexx">
          <img src="${base }/upload/${product.avatar}" onclick="img('${base }/upload/${product.avatar}')">
          <img src="${base }/upload/${product.avatar}" onclick="img('${base }/upload/${product.avatar}')">
          <img src="${base }/upload/${product.avatar}" onclick="img('${base }/upload/${product.avatar}')">
          <img src="${base }/upload/${product.avatar}" onclick="img('${base }/upload/${product.avatar}')">
          <img src="${base }/upload/${product.avatar}" onclick="img('${base }/upload/${product.avatar}')">
          <img src="${base }/upload/${product.avatar}" onclick="img('${base }/upload/${product.avatar}')">
        </div>
      </div>
      <div class="rightt">
        <h3>${product.title}</h3>
        <h4> <fmt:formatNumber value="${product.price}" type="currency"/> </h4>
        <p>${product.short_description} </p>
        
        <div class="colorr flex11">
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          <span></span>
        </div>
        <h5>Quanlity</h5>
        <div class="addd flex11">
          <span>-</span>
          <label>1</label>
          <span>+</span>
        </div>

        <a class="btn btn-outline-dark mt-auto" href="#"
														onclick="AddToCart('${base}',${product.id}, 1)">Add to cart</a>
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
            <div class="img-containerr">
              <img
                src="${base }/upload/${c.avatar}"
                alt=""
              />
              <div class="name-containerr">
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
   </div>
    <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website</p></div>
     </footer>
    <!-- footer -->
    <script src="${base}/js/scripts.js"></script>
    <script>
    function img(anything) {
      document.querySelector('.slide').src = anything;
    }

    function change(change) {
      const line = document.querySelector('.home');
      line.style.background = change;
    }
  </script>
      
    
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
   
  </body>
</html>
