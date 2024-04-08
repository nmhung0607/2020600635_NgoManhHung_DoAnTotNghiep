<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Navigation-->
<div class="app">
        <header class="header">
			<div class="gridd">
				<nav class="header__navbar">
					<ul class="header__navbar-list">
						<li class="header__navbar-item header__navbar-item--separate">Vào
							cửa hàng bằng ứng dụng
							<div class="header__qr"></div>
						</li>
						<li class="header__navbar-item"><span
							class="header__navbar--title--no--pointer">Kết nối</span> <a
							href="" class="header__navbar-icon-link"> <i
								class="fab fa-facebook"></i>
						</a> <a href="" class="header__navbar-icon-link"> <i
								class="fab fa-instagram"></i>
						</a></li>
					</ul>
					<ul class="header__navbar-list">
						<li class="header__navbar-item"><a href=""
							class="header__navbar-item-link"> <i class="fas fa-bell"></i>
								Thông báo
						</a></li>
						<li class="header__navbar-item"><a href="${base }/contact-us"
							class="header__navbar-item-link"> <i
								class="fas fa-contact-book"></i>Liên hệ
						</a></li>
						<li class="header__navbar-item"><a href=""
							class="header__navbar-item-link"> <i
								class="far fa-question-circle"></i> Trợ giúp
						</a></li>
						<c:if test="${!isLogined }">
							<li
								class="header__navbar-item header__navbar-item--strong header__navbar-item--separate">
								<a href="${base}/register"> Đăng kí</a>
							</li>
							<li class="header__navbar-item header__navbar-item--strong">
								<a href="${base}/login"> Đăng nhập</a>
							</li>
						</c:if>

						<c:if test="${isLogined}">
							<li class="header__navbar-item header__navbar-user"><img
								src="${base}/img/nmh.jpg" alt="" class="header__navbar-user-img">
								<span class="header__navbar-user-name">${userLogined.email}</span>
								<ul class="header__navbar-user-menu">
									<li class="header__navbar-user-item"><a href="">Đơn
											mua </a></li>
									<li class="header__navbar-user-item"><a
										href="${base}/logout">Đăng xuất</a></li>
								</ul></li>
						</c:if>

					</ul>
				</nav>
				<div class="header-with-search">
					<div class="header__logo">
						<div class="header__logo-img">
							<a href="${base}/trang-chu"><img src="${base}/img/nmh.jpg"
								alt="" width="50px" height="50px"></a>
						</div>
					</div>

					<div class="header__search" >

						<form action="${base }/trang-chu" method="get" style="display:flex" class="header__search-input-wrap">
							<div class="header__search-input-wrap">
								<input type="text" id="keyword" name="keyword"
									class="header__search-input"
									placeholder="Tìm kiếm sản phẩm . ex : Laptop , Macbook.......">

							</div>
							<button class="header__search-btn">
								<i class="fas fa-search header__search-btn-icon"></i>
							</button>
						</form>
					</div>

					<div class="header__cart">
						<div class="header__cart-wrap">
							<a href="${base }/cart/checkout" class="btn"> <i
								class="fas fa-shopping-cart header__cart-icon me-1"></i> <span
								id="iconShowTotalItemsInCart" class="header__cart-notice">
									${totalItems} </span> <span class="header__cart-name">Giỏ hàng
									của bạn</span> <c:if test=" empty ${cart.getCartItems()}">
									<div class="header__cart-list header__cart-list--no-cart">
										<img src="./assets/img/no-cart.png" alt=""
											class="header__cart-no-cart-img">
									</div>
								</c:if> <!--Has cart-->
								<div class="header__cart-list">
									<div class="header__cart-heading">Sản phẩm đã thêm</div>
									<c:forEach items="${cart.getCartItems()}" var="ci">
										<ul class="header__cart-list-item">
											<li class="header__cart-item"><img
												src="${base}/upload/${ci.avatar}" alt=""
												class="header__cart-img">
												<div class="header__cart-item-info">
													<div class="header__cart-item-head">
														<h5 class="header__cart-item-name">${ci.productName}</h5>
														<div class="header__cart-item-price-wrap">
															<span class="header__cart-item-price">${ci.priceUnit}</span>
															<span class="header__cart-item-multiply">x</span> <span
																class="header__cart-item-quanlity">${ci.quanlity}</span>
														</div>
													</div>
													<div class="header__cart-item-body">
														<span class="header__cart-item-des"> Phân loại :
															Gaming </span> <span class="header__cart-item-delete">Xóa</span>
													</div>
												</div></li>

										</ul>
									</c:forEach>

									<button class="btn btn--primary header__cart-view">Xem
										giỏ hàng</button>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>

		</header>
        <div class="container">

        </div>
        <footer class="footer">

        </footer>
    </div>


<!-- Header-->
