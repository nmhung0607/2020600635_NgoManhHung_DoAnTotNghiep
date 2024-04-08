<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="${base}/../css/style.css">
    <link rel="stylesheet" href="${base}/../font/themify-icons/themify-icons.css">
</head>
    <body>
    <div id="main">
        <div id="header">
               <ul id="nav">
                   <li><a href="${base}/#">Home</a></li>
                   <li><a href="${base}/">Top Tours</a></li>
                   <li><a href="${base}/../layouts/tours.html">Tours</a></li>
                   <li><a href="${base}/">Contacts Us</a></li>
                   <li>
                       <a href="${base}/">More
                           <i  class=" nav-arrow-down ti-angle-down"></i>
                       </a>
                       <ul  class="subnav">
                           <li><a href="${base}/">Customers's Feeling</a></li>
                           <li><a href="${base}/">Tips</a></li>
                           <li><a href="${base}/">Call</a></li>
                       </ul>
                    </li>
               </ul>
               <div class="login">
                <ul>
                    <li>
                        <a href="${base}/../layouts/register.html">Login</a>
                    </li>
                    <li>
                        <a href="${base}/">Register</a>
                    </li>
                </ul>
               </div>
               <div  class="search-btn">
               <i  class="search-icon ti-search"></i>
               <input type="text" name="" id="">
        </div>
        </div>
    </div>
    </body>
    <script src="${base}/../js/js1.js"></script>
</body>
</html>