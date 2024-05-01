<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
<div class="super_container">
	
	<!-- Header -->
	
	<header class="header" style="background-image:white!important">

		<!-- Top Bar -->

		<div class="top_bar">
			<div class="container">
				<div class="row">
					<div class="col d-flex flex-row">
						<div class="top_bar_contact_item"><div class="top_bar_icon"><img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918577/phone.png" alt=""></div>0966429003</div>
						<div class="top_bar_contact_item"><div class="top_bar_icon"><img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918597/mail.png" alt=""></div><a href="mailto:fastsales@gmail.com">ngomanhhung0607@gmail.com</a></div>
						<div class="top_bar_content ml-auto">
							<div class="top_bar_user">
								<div class="user_icon"><img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918647/user.svg" alt=""></div>
								<c:if test="${!isLogined }">
								<div><a href="${base}/register">Register</a></div>
								<div><a href="${base}/login">Sign in</a></div>
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
							</div>
						</div>
					</div>
				</div>
			</div>		
		</div>

		<!-- Header Main -->

		<div class="header_main">
			<div class="container">
				<div class="row">

					<!-- Logo -->
					<div class="col-lg-2 col-sm-3 col-3 order-1">
						<div class="logo_container">
							<div class="logo"><a href="${base}/trang-chu">NMH Store</a></div>
						</div>
					</div>

					<!-- Search -->
					<div class="col-lg-6 col-12 order-lg-2 order-3 text-lg-left text-right">
						<div class="header_search">
							<div class="header_search_content">
								<div class="header_search_form_container">
									<form action="${base }/trang-chu" method="get"  class="header_search_form clearfix">
										<input id="keyword" name="keyword" type="search" required="required" class="header_search_input" placeholder="Search for products...">
										<button type="submit" class="header_search_button trans_300" value="Submit"><img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918770/search.png" alt=""></button>
									</form>
								</div>
							</div>
						</div>
					</div>

					<!-- Wishlist -->
					<div class="col-lg-4 col-9 order-lg-3 order-2 text-lg-left text-right">
						<div class="wishlist_cart d-flex flex-row align-items-center justify-content-end">

							<!-- Cart -->
							<div class="cart">
								<div class="cart_container d-flex flex-row align-items-center justify-content-end">
									<div class="cart_icon">
										<img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918704/cart.png" alt="">
										<div class="cart_count"><span id="iconShowTotalItemsInCart">${ totalItems}</span></div>
									</div>
									<div class="cart_content">
										<div class="cart_text"><a href="${base }/cart/checkout">Cart</a></div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Main Navigation -->

		<nav class="main_nav">
			<div class="container">
				<div class="row">
					<div class="col">
						
						<div class="main_nav_content d-flex flex-row">

							<!-- Categories Menu -->

							

							<!-- Main Nav Menu -->

							<div class="main_nav_menu">
								<ul class="standard_dropdown main_nav_dropdown">
									<li><a href="#">Home<i class="fas fa-chevron-down"></i></a></li>
									<li class="hassubs">
										<a href="#">Laptop<i class="fas fa-chevron-down"></i></a>
										<ul>
											<li>
												<a href="#">Lenovo<i class="fas fa-chevron-down"></i></a>
												<ul>
													<li><a href="#">Lenovo 1<i class="fas fa-chevron-down"></i></a></li>
													<li><a href="#">Lenovo 3<i class="fas fa-chevron-down"></i></a></li>
													<li><a href="#">Lenovo 2<i class="fas fa-chevron-down"></i></a></li>
												</ul>
											</li>
											<li><a href="#">DELL<i class="fas fa-chevron-down"></i></a></li>
											<li><a href="#">APPLE<i class="fas fa-chevron-down"></i></a></li>
											<li><a href="#">HP<i class="fas fa-chevron-down"></i></a></li>
										</ul>
									</li>
									<li class="hassubs">
										<a href="#">Featured Brands<i class="fas fa-chevron-down"></i></a>
										<ul>
											<li>
												<a href="#">APPLE<i class="fas fa-chevron-down"></i></a>
												<ul>
													<li><a href="#">Laptop<i class="fas fa-chevron-down"></i></a></li>
													<li><a href="#">Mobiles<i class="fas fa-chevron-down"></i></a></li>
													<li><a href="#">Ipads<i class="fas fa-chevron-down"></i></a></li>
												</ul>
											</li>
											<li><a href="#">Samsung<i class="fas fa-chevron-down"></i></a></li>
											<li><a href="#">Lenovo<i class="fas fa-chevron-down"></i></a></li>
											<li><a href="#">DELL<i class="fas fa-chevron-down"></i></a></li>
										</ul>
									</li>
									<li class="hassubs">
										<a href="#">Pages<i class="fas fa-chevron-down"></i></a>
										<ul>
											<li><a href="shop.html">Shop<i class="fas fa-chevron-down"></i></a></li>
											<li><a href="product.html">Product<i class="fas fa-chevron-down"></i></a></li>
											<li><a href="blog.html">Blog<i class="fas fa-chevron-down"></i></a></li>
											<li><a href="blog_single.html">Blog Post<i class="fas fa-chevron-down"></i></a></li>
											<li><a href="regular.html">Regular Post<i class="fas fa-chevron-down"></i></a></li>
											<li><a href="cart.html">Cart<i class="fas fa-chevron-down"></i></a></li>
											<li><a href="contact.html">Contact<i class="fas fa-chevron-down"></i></a></li>
										</ul>
									</li>
									<li><a href="blog.html">Blog<i class="fas fa-chevron-down"></i></a></li>
									<li><a href="${base }/contact-us">Contact<i class="fas fa-chevron-down"></i></a></li>
								</ul>
							</div>

							<!-- Menu Trigger -->

							<div class="menu_trigger_container ml-auto">
								<div class="menu_trigger d-flex flex-row align-items-center justify-content-end">
									<div class="menu_burger">
										<div class="menu_trigger_text">menu</div>
										<div class="cat_burger menu_burger_inner"><span></span><span></span><span></span></div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</nav>
		
		<!-- Menu -->

		<div class="page_menu">
			<div class="container">
				<div class="row">
					<div class="col">
						
						<div class="page_menu_content">
							
							<div class="page_menu_search">
								<form action="#">
									<input type="search" required="required" class="page_menu_search_input" placeholder="Search for products...">
								</form>
							</div>
							<ul class="page_menu_nav">
								<li class="page_menu_item">
									<a href="#">Home<i class="fa fa-angle-down"></i></a>
								</li>
								<li class="page_menu_item has-children">
									<a href="#">Super Deals<i class="fa fa-angle-down"></i></a>
									<ul class="page_menu_selection">
										<li><a href="#">Super Deals<i class="fa fa-angle-down"></i></a></li>
										<li class="page_menu_item has-children">
											<a href="#">Menu Item<i class="fa fa-angle-down"></i></a>
											<ul class="page_menu_selection">
												<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
												<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
												<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
												<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
											</ul>
										</li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
									</ul>
								</li>
								<li class="page_menu_item has-children">
									<a href="#">Featured Brands<i class="fa fa-angle-down"></i></a>
									<ul class="page_menu_selection">
										<li><a href="#">Featured Brands<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
									</ul>
								</li>
								<li class="page_menu_item has-children">
									<a href="#">Trending Styles<i class="fa fa-angle-down"></i></a>
									<ul class="page_menu_selection">
										<li><a href="#">Trending Styles<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
									</ul>
								</li>
								<li class="page_menu_item"><a href="blog.html">blog<i class="fa fa-angle-down"></i></a></li>
								<li class="page_menu_item"><a href="contact.html">contact<i class="fa fa-angle-down"></i></a></li>
							</ul>
							
							<div class="menu_contact">
								<div class="menu_contact_item"><div class="menu_contact_icon"><img src="images/phone_white.png" alt=""></div>0966429003</div>
								<div class="menu_contact_item"><div class="menu_contact_icon"><img src="images/mail_white.png" alt=""></div><a href="mailto:fastsales@gmail.com">ngomanhhung0607@gmail.com</a></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</header>
    <div style="height: 30px">
		

	</div>
	<div id="mycarousel" class="carousel slide" data-ride="carousel">

        <!--Cho hiện thị chỉ số nếu muốn-->
        <ol class="carousel-indicators">
            <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
            <li data-target="#mycarousel" data-slide-to="1" class=""></li>
            <li data-target="#mycarousel" data-slide-to="2" class=""></li>
        </ol>
        <!--Hết tạo chỉ số-->

        <!--Các slide bên trong carousel-inner-->
        <div class="carousel-inner" style="height:300px">

            <!--Slide 1 thiết lập hiện thị đầu tiên .active-->
            <div class="carousel-item active">
                <img class="d-block w-100 " src="${base }/img/slider1.jpg" >
                <!--Cho thêm hiện thị thông tin-->
                <div class="carousel-caption d-none d-md-block">
                    <h5>Tiêu đề Slide 1</h5>
                    <p>Dòng text chú thích cho Slide 1</p>
                </div>
            </div>

            <!--Slide 2-->
            <div class="carousel-item">
                <img class="d-block w-100" src="${base }/img/slider1.jpg">
            </div>
            <!--Slide 3-->
            <div class="carousel-item">
                <img class="d-block w-100" src="${base }/img/slider1.jpg">
            </div>
        </div>
        


        <!--Cho thêm khiển chuyển slide trước, sau nếu muốn-->
            <a class="carousel-control-prev" href="#mycarousel" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span></a>
            <a class="carousel-control-next" href="#mycarousel" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span> </a>
        <!--Hết tạo điều khiển chuyển Slide--> 
        
    </div>
</div>