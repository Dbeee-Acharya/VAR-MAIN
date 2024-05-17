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
    <title>Orders</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminOrderStyle.css" />
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
    <nav class="nav">
      <h1 style="font-size: 1.25rem; font-weight: 600; color: #fff">VAR</h1>
    </nav>
    <div class="viewport">
      <aside class="sidenav">
        <ul class="sidebar-links">
          <li>
            <a href="<%=request.getContextPath() %>/adminPanel" class="link">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
                class="lucide lucide-layout-dashboard"
              >
                <rect width="7" height="9" x="3" y="3" rx="1" />
                <rect width="7" height="5" x="14" y="3" rx="1" />
                <rect width="7" height="9" x="14" y="12" rx="1" />
                <rect width="7" height="5" x="3" y="16" rx="1" />
              </svg>
              <span style="color: #111827; font-size: 0.92rem; font-weight: 500"
                >Dashboard</span
              >
            </a>
          </li>
          <li>
            <a href="<%=request.getContextPath() %>/adminPanel" class="link">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
                class="lucide lucide-scroll-text"
              >
                <path d="M15 12h-5" />
                <path d="M15 8h-5" />
                <path d="M19 17V5a2 2 0 0 0-2-2H4" />
                <path
                  d="M8 21h12a2 2 0 0 0 2-2v-1a1 1 0 0 0-1-1H11a1 1 0 0 0-1 1v1a2 2 0 1 1-4 0V5a2 2 0 1 0-4 0v2a1 1 0 0 0 1 1h3"
                />
              </svg>
              <span style="color: #111827; font-size: 0.92rem; font-weight: 500"
                >Products</span
              >
            </a>
          </li>
          <li>
            <a
              href=""
              class="link"
              style="background-color: #eff3f5; position: relative"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
                class="lucide lucide-truck"
              >
                <path
                  d="M14 18V6a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2v11a1 1 0 0 0 1 1h2"
                />
                <path d="M15 18H9" />
                <path
                  d="M19 18h2a1 1 0 0 0 1-1v-3.65a1 1 0 0 0-.22-.624l-3.48-4.35A1 1 0 0 0 17.52 8H14"
                />
                <circle cx="17" cy="18" r="2" />
                <circle cx="7" cy="18" r="2" />
              </svg>
              <span style="color: #111827; font-size: 0.92rem; font-weight: 600"
                >Orders</span
              >
              <div
                style="
                  height: 57px;
                  width: 3px;
                  background-color: #0d1118;
                  position: absolute;
                  right: 0;
                "
              ></div>
            </a>
          </li>
                    <li>
            <a href="<%=request.getContextPath() %>/homepage" class="link">
             <svg 
             xmlns="http://www.w3.org/2000/svg" 
             width="20"
             height="20"
             viewBox="0 0 576 512"
             fill="none"
             stroke="currentColor"
             stroke-width="50"
             stroke-linecap="round"
             stroke-linejoin="round"
             class="lucide lucide-scroll-text"
            >
            	<path d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/>
          	</svg>
              <span style="color: #111827; font-size: 0.92rem; font-weight: 500"
                >Home</span
              >
            </a>
          </li>
           <li>
            <form action="<%=request.getContextPath() %>/logout" method="post" style="position: absolute; left: 1.3rem; padding-top: 0.8rem">
            <button type="submit">
				<i class="fa-solid fa-right-from-bracket"></i>
              	<span style="color: #111827; font-size: 0.92rem; font-weight: 500"
                >Logout</span
              >
              </button>
            </form>
          </li>
          
        </ul>
      </aside>
      <div class="flex flex-col w-full">
        <div class="w-full h-[7rem] flex flex-col items-start justify-center gap-6 bg-white px-10">
          <h5 class="text-sm text-slate-600">Admin / <span class="text-black">Order</span></h5>
          <h1 class="text-xl font-medium">Preview Orders</h1>
        </div>

        <div class="m-6 min-h-[85vh] max-h-[85vh] overflow-y-auto border rounded-md bg-white">
          <table style="width: 100%">
            <thead>
              <tr style="height: 4.3rem; border-bottom-width: 1px">
                <th>Order Id</th>
                <th>Name</th>
                <th>Current Status</th>
                <th>Total Amount</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              <!-- Table rows with data go here -->
              <c:forEach var="order" items="${orders}">
              <tr
                style="
                  height: 4.5rem;
                  text-align: center;
                  border-bottom-width: 1px;
                "
              >
                <td><c:out value="${order.orderId}"/></td>
                <td><c:out value="${order.userName}"/></td>
                <td><c:out value="${order.orderStatus}"/></td>
                <td><c:out value="${order.orderTotal}"/></td>
                <td>
                  <select class="cursor-pointer w-full bg-white rounded-md focus:outline-none focus:border-blue-300 focus:ring focus:ring-blue-200 text-center" >
                    <option value="pending" class="cursor-pointer ">Pending</option>
                    <option value="approved" class="cursor-pointer">Approved</option>
                    <option value="approved" class="cursor-pointer">Shipped</option>
                    <option value="rejected" class="cursor-pointer">Rejected</option>
                  </select>
                </td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
  </body>
</html>
