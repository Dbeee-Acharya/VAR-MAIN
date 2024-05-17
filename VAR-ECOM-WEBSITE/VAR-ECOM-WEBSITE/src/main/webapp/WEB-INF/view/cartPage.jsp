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
    <title>Cart</title>
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
    <div class="flex flex-col gap-20 min-h-screen w-full">
      <nav class="h-20 flex items-center justify-between mx-[12rem]">
        <img src="${pageContext.request.contextPath}/assets/VAR.png" alt="" class="h-10 w-10 object-contain" />
        <ul class="flex items-center gap-6">
          <li
            class="font-medium text-[1rem] text-slate-600 hover:text-black duration-300"
          >
            <a href="<%=request.getContextPath() %>/homepage">Home</a>
          </li>
          <li
            class="font-medium text-[1rem] text-slate-600 hover:text-black duration-300"
          >
            <a href="<%=request.getContextPath()%>/about">About Us</a>
          </li>

        </ul>
        <div class="flex items-center gap-4">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="20"
            height="20"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            class="lucide lucide-search cursor-pointer"
          >
            <circle cx="11" cy="11" r="8" />
            <path d="m21 21-4.3-4.3" />
          </svg>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="20"
            height="20"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            class="lucide lucide-shopping-cart cursor-pointer"
          >
            <circle cx="8" cy="21" r="1" />
            <circle cx="19" cy="21" r="1" />
            <path
              d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12"
            />
          </svg>
          <a href = "<%=request.getContextPath() %>/profilePage">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="20"
            height="20"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
            class="lucide lucide-circle-user cursor-pointer"
          >
            <circle cx="12" cy="12" r="10" />
            <circle cx="12" cy="10" r="3" />
            <path d="M7 20.662V19a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v1.662" />
          </svg>
          </a>
        </div>
      </nav>

      <div class="mx-[12rem] flex flex-col gap-4">
        <h1 class="text-3xl font-semibold tracking-tighter">My Cart</h1>
        <div class="flex items-center justify-between">
          <div
            class="flex flex-col gap-2 min-h-[70vh] max-h-[70vh] overflow-y-auto border rounded-md w-[50%]"
          >
          
          <c:forEach var="product" items="${listOfProducts}">
            <div
              class="flex items-center justify-between w-full p-4 border-b relative"
            >
              <div class="flex items-center gap-4 py-6 w-full">
                <img
                  src="data:image/jpeg;base64,"
                  alt="${product.ImageBase64}"
                  class="w-[10rem] rounded-md"
                />
                <div class="flex flex-col">
                  <h3 class="text-lg font-medium"><c:out value="${product.productName} }"/> </h3>
                  <h3 class="text-[0.975rem] text-gray-500">
                    <c:out value="${product.productDescripion}"/>
                  </h3>	
                </div>
              </div>
              <div class="flex items-center gap-4">
                <h1 class="text-lg font-medium tracking-tight">$<c:out value="${product.productPrice}"/></h1>
                <span id="quantityDisplay" class="text-lg"><c:out value="${product.productStock}"/></span>
              </div>

              <div class="absolute top-4 right-4 cursor-pointer">
              <form action = "<%=request.getContextPath() %>/removeItem" method = "post">
              <input name = "productId" type="hidden" value = "${product.productId}"/>
              <button type = "submit">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="18"
                  height="18"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="red"
                  stroke-width="2"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  class="lucide lucide-trash-2"
                >
                  <path d="M3 6h18" />
                  <path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6" />
                  <path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2" />
                  <line x1="10" x2="10" y1="11" y2="17" />
                  <line x1="14" x2="14" y1="11" y2="17" />
                </svg>
                </button>
                </form>
              </div>
            </div>
            </c:forEach>
          </div>

          <div
            class="flex flex-col gap-6 items-center justify-center px-12 w-[35%]"
          >
            <div class="flex flex-col gap-2">
              <h1 class="text-center text-3xl font-semibold tracking-tighter">
                Total: ${totalPrice}
              </h1>
              <h4 class="text-[0.975rem] text-gray-400 text-center">
                Please enter your shipping details
              </h4>
            </div>

            <form
              action="<%=request.getContextPath() %>/productOrder"
              method = "post"
              class="flex flex-col items-center justify-center gap-4 w-[70%]"
            >
            <input type = "hidden" name = "totalPrice" value = "${totalPrice }">

              <div
                class="flex items-center gap-2 w-full border px-4 py-3 rounded-2xl"
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="20"
                  height="20"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  class="lucide lucide-map-pin"
                >
                  <path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z" />
                  <circle cx="12" cy="10" r="3" />
                </svg>
                <div class="h-6 bg-gray-300 w-[1px]"></div>
                <input
                  placeholder="Delivery Address"
                  name="address"
                  type="text"
                  class="focus:outline-none w-full"
                />
              </div>


            <button
              type = "submit"
              class="px-4 py-3 bg-slate-800 rounded-2xl w-[70%] text-white text-[1rem] font-medium hover:bg-black duration-300"
            >
              Check Out
            </button>
            </form>
            <span>${orderStatus }</span>

            <!-- <h5 class="text-sm text-gray-800">
              Don't have an account?
              <span class="text-black underline cursor-pointer">Sign up</span>
            </h5> -->
          </div>
        </div>
      </div>
    </div>
  </body>
  <script>

    function updateQuantityDisplay() {
      document.getElementById("quantityDisplay").textContent = quantity;
    }

    function incrementQuantity() {
      quantity++;
      updateQuantityDisplay();
    }

    function decrementQuantity() {
      if (quantity > 1) {
        quantity--;
        updateQuantityDisplay();
      }
    }

    // Initialize the quantity display
    updateQuantityDisplay();
  </script>
</html>
