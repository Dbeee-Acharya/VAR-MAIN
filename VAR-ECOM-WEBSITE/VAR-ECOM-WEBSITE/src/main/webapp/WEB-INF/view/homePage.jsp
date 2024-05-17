<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@page import="model.Product"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>VAR | Homepage</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homePageStyle.css" >
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
      integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Arimo:ital,wght@0,400..700;1,400..700&family=Inter:wght@100..900&display=swap"
      rel="stylesheet"
    />
    <script src="https://cdn.tailwindcss.com"></script>
  </head>
  <body>
    <div class="viewport">
      <nav class="navigation">
        <img src="${pageContext.request.contextPath}/assets/VAR.png" alt="Brand Logo" class="logo" />
        <ul class="nav-links">
          <li>
            <a href="">Home</a>
          </li>
          <li>
            <a href="<%=request.getContextPath()%>/about">About Us</a>
          </li>
        </ul>

        <div class="user-actions">
          <i class="fa-solid fa-magnifying-glass"></i>
          <a href="<%=request.getContextPath() %>/cart"><i class="fa-solid fa-cart-shopping"></i></a>
          <a href="<%=request.getContextPath() %>/profilePage" ><i class="fa-regular fa-user"></i></a>
        </div>
      </nav>

      <!-- HERO SECTION -->

      <div class="hero">
        <div class="hero-content">
          <h1 class="hero-title">AR & VR</h1>
          <h5 class="hero-description">
            Shop AR and VT. Choose from the ergonomic, comfort, portable,
            Bluetooth, multi-device, and multi-OS product range.
          </h5>
          <span
            class="text-lg underline text-slate-500 hover:text-slate-700 duration-300 cursor-pointer"
            >Learn more</span
          >
        </div>
        <img src="${pageContext.request.contextPath}/assets/VR.png" alt="" width="50%" />
      </div>

      <!-- PRODUCT -->
      <div class="products">
        <h1 class="products-heading">Our Products</h1>
        <div class="product-grid">
          <!-- Loop the following div -->
          
          <c:forEach var="product" items="${listOfProducts}">
          <form action="<%=request.getContextPath() %>/cart" method="post">
          <input type="hidden" name="productId" value="${product.productId }">
          <div class="product-card">
            <img src="data:image/jpeg;base64,${product.base64ImageData}" alt="" width="100%" />
            <div class="product-details">
              <!-- Add product name -->
              <h2 class="product-title"><c:out value="${product.productName}"/></h2>
              <!-- Add product Price -->
              <h2 class="product-title">$<c:out value="${product.productPrice}"/></h2>
            </div>
            <span class="stock">In Stock: <c:out value="${product.productStock}"/></span>
            <p class="product-description">
  				<c:out value="${product.productDescription}"/>
            </p>
            <button type = submit>
            <div class="add-to-cart">
              <h2>Add to Cart</h2>
              <i class="fa-solid fa-cart-shopping"></i>
            </div>
            <span>${insufficientStock}</span>
            </button>
          </div>
          </form>
          </c:forEach>
          
        </div>
      </div>

      <footer class="site-footer">
        <div class="footer">
          <img src="${pageContext.request.contextPath}/assets/VAR.png" alt="Brand Logo" />
          <div class="socials">
            <i class="fa-brands fa-instagram"></i>
            <i class="fa-brands fa-x-twitter"></i>
            <i class="fa-brands fa-tiktok"></i>
          </div>
        </div>
      </footer>
    </div>
    <script src="https://unpkg.com/lucide@latest/dist/umd/lucide.js"></script>
  </body>
</html>
