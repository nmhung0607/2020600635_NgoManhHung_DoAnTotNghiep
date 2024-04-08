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
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <link rel="stylesheet" href="${base}/css/details.css">
        <jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
    </head>
    <body>
    	<!-- Common -->
    	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    	
        <!-- Navigation-->
        <%-- <jsp:include page="/WEB-INF/views/customer/layout/navigation.jsp"></jsp:include> --%>
        
        <!-- Header-->
        <jsp:include page="/WEB-INF/views/customer/layout/header1.jsp"></jsp:include>
        
        
        
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                    	<img src="${base }/upload/${product.avatar}" class="card-img-top mb-5 mb-md-0" alt="...">
                   	</div>
                    <div class="col-md-6">
                        <div class="small mb-1">SKU: BST-498</div>
                        <h1 class="display-5 fw-bolder">${product.title }</h1>
                        <div class="fs-5 mb-5">
                            <fmt:setLocale value="vi_VN"/>
                            <span class="text-decoration-line-through">
                            	<fmt:formatNumber value="${product.price}" type="currency"/>
                           	</span>
                            <span>
                            	<fmt:formatNumber value="${product.price_sale}" type="currency"/>
                           	</span>
                        </div>
                        <p class="lead">
                        	${product.short_description}
                        </p>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="number" value="1" style="max-width: 5rem" />
                            <a class="btn btn-outline-dark flex-shrink-0" type="button" onclick="AddToCart('${base}',${product.id}, 1)" style="font-size:1.4rem">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-9">
                    <ul class="menu-items">
                        <li class="active">Detals</li>
                    </ul>
                    <div style="width:100%;border-top:1px solid silver">
                        <p style="padding:15px;">
                            <small>
                            ${product.details}
                            </small>
                        </p>
                    </div>
                </div>		
        </section>
        
        <!-- Related items section-->
        <c:forEach var="c" items="${pdProducts.data}" varStatus="loop">
									<div class="col mb-5">
										<div class="card h-100">
											<!-- Sale badge-->
											<div class="badge bg-dark text-white position-absolute"
												style="top: 1.2rem; right: 1.2rem">Sale</div>

											<!-- Product image-->
											<img src="${base}/upload/${c.avatar}" class="card-img-top"
												alt="...">

											<!-- Product details-->
											<div class="card-body p-4">
												<div class="text-center">

													<!-- Product name-->
													<h5 class="fw-bolder">
														<a href="${base }/details/${c.seo}">${c.title }</a>
													</h5>

													<!-- Product reviews-->
													<div
														class="d-flex justify-content-center small text-warning mb-2">
														<div class="bi-star-fill"></div>
														<div class="bi-star-fill"></div>
														<div class="bi-star-fill"></div>
														<div class="bi-star-fill"></div>
														<div class="bi-star-fill"></div>
													</div>

													<!-- Product price-->
													<fmt:setLocale value="vi_VN" />
													<span class="text-muted text-decoration-line-through">
														<fmt:formatNumber value="${c.price}" type="currency" />
													</span>
													<fmt:formatNumber value="${c.price_sale}" type="currency" />

												</div>
											</div>

											<!-- Product actions-->
											<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
												<div class="text-center">
													<a class="btn btn-outline-dark mt-auto" href="#"
														onclick="AddToCart('${base}',${c.id}, 1)">Add to cart</a>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
        
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        
        <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
    </body>
</html>


