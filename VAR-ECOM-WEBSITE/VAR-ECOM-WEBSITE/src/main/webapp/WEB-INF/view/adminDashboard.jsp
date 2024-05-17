<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="model.Contact" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboardStyle.css" >
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
                class="lucide lucide-layout-dashboard"
              >
                <rect width="7" height="9" x="3" y="3" rx="1" />
                <rect width="7" height="5" x="14" y="3" rx="1" />
                <rect width="7" height="9" x="14" y="12" rx="1" />
                <rect width="7" height="5" x="3" y="16" rx="1" />
              </svg>
              <span style="color: #111827; font-size: 0.92rem; font-weight: 600"
                >Dashboard</span
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
            <a href="<%=request.getContextPath() %>/adminPanel	" class="link">
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
            <a href="<%=request.getContextPath() %>/adminOrder" class="link">
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
              <span style="color: #111827; font-size: 0.92rem; font-weight: 500"
                >Orders</span
              >
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
          <h5 class="text-sm text-slate-600">Admin / <span class="text-black">Dashboard</span></h5>
          <h1 class="text-xl font-medium">Dashboard</h1>
        </div>

        <div class="m-6 min-h-[85vh] flex flex-col border rounded-md bg-white">
          <div class="flex items-center gap-4 w-full p-10 border-b">
            <div class="h-[7rem] bg-slate-50 flex flex-col items-start justify-center gap-1 px-7 w-full rounded-md border">
              <div class="flex items-center justify-between w-full">
                <h1 class="text-lg tracking-tight font-medium">Users</h1>
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-package"><path d="m7.5 4.27 9 5.15"/><path d="M21 8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16Z"/><path d="m3.3 7 8.7 5 8.7-5"/><path d="M12 22V12"/></svg>
              </div>
              <h1 class="text-3xl font-medium tracking-tighter">${numberOfUsers }</h1>
              <a href="<%=request.getContextPath()%>/listOfUsers">Click to get a list of users</a>
            </div>
            <div class="h-[7rem] bg-pink-50 flex flex-col items-start justify-center gap-4 px-7 w-full rounded-md border">
              <div class="flex items-center justify-between w-full">
                <h1 class="text-lg tracking-tight font-medium ">Products</h1>
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-puzzle"><path d="M19.439 7.85c-.049.322.059.648.289.878l1.568 1.568c.47.47.706 1.087.706 1.704s-.235 1.233-.706 1.704l-1.611 1.611a.98.98 0 0 1-.837.276c-.47-.07-.802-.48-.968-.925a2.501 2.501 0 1 0-3.214 3.214c.446.166.855.497.925.968a.979.979 0 0 1-.276.837l-1.61 1.61a2.404 2.404 0 0 1-1.705.707 2.402 2.402 0 0 1-1.704-.706l-1.568-1.568a1.026 1.026 0 0 0-.877-.29c-.493.074-.84.504-1.02.968a2.5 2.5 0 1 1-3.237-3.237c.464-.18.894-.527.967-1.02a1.026 1.026 0 0 0-.289-.877l-1.568-1.568A2.402 2.402 0 0 1 1.998 12c0-.617.236-1.234.706-1.704L4.23 8.77c.24-.24.581-.353.917-.303.515.077.877.528 1.073 1.01a2.5 2.5 0 1 0 3.259-3.259c-.482-.196-.933-.558-1.01-1.073-.05-.336.062-.676.303-.917l1.525-1.525A2.402 2.402 0 0 1 12 1.998c.617 0 1.234.236 1.704.706l1.568 1.568c.23.23.556.338.877.29.493-.074.84-.504 1.02-.968a2.5 2.5 0 1 1 3.237 3.237c-.464.18-.894.527-.967 1.02Z"/></svg>
              </div>
              <h1 class="text-3xl font-medium tracking-tighter">${numberOfProducts }</h1>
            </div>
            <div class="h-[7rem] bg-cyan-50 flex flex-col items-start justify-center gap-4 px-7 w-full rounded-md border">
              <div class="flex items-center justify-between w-full">
                <h1 class="text-lg tracking-tight font-medium">Delivery</h1>
               <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-truck"><path d="M14 18V6a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2v11a1 1 0 0 0 1 1h2"/><path d="M15 18H9"/><path d="M19 18h2a1 1 0 0 0 1-1v-3.65a1 1 0 0 0-.22-.624l-3.48-4.35A1 1 0 0 0 17.52 8H14"/><circle cx="17" cy="18" r="2"/><circle cx="7" cy="18" r="2"/></svg>
              </div>
              <h1 class="text-3xl font-medium tracking-tighter">10</h1>
            </div>
            <div class="h-[7rem] bg-green-50 flex flex-col items-start justify-center gap-4 px-7 w-full rounded-md border">
              <div class="flex items-center justify-between w-full">
                <h1 class="text-lg tracking-tight font-medium">Total Sales</h1>
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-badge-dollar-sign"><path d="M3.85 8.62a4 4 0 0 1 4.78-4.77 4 4 0 0 1 6.74 0 4 4 0 0 1 4.78 4.78 4 4 0 0 1 0 6.74 4 4 0 0 1-4.77 4.78 4 4 0 0 1-6.75 0 4 4 0 0 1-4.78-4.77 4 4 0 0 1 0-6.76Z"/><path d="M16 8h-6a2 2 0 1 0 0 4h4a2 2 0 1 1 0 4H8"/><path d="M12 18V6"/></svg>
              </div>
              <h1 class="text-3xl font-medium tracking-tighter">$ 40,323</h1>
            </div>
           
          </div>

          <div class="flex flex-col gap-4 p-10">
            <h1 class="text-4xl font-medium tracking-tighter">Queries</h1>
            <table style="width: 100%">
            <thead>
              <tr style="height: 4.3rem; border-bottom-width: 1px">
                <th>Phone Number</th>
                <th>Email</th>
                <th>Message</th>
               
              </tr>
            </thead>
            <tbody>
              <!-- Table rows with data go here -->
    		<c:forEach var="message" items="${messages}">
       		 <tr style="height: 4.5rem; text-align: center; border-bottom-width: 1px;" class="w-full">
            	<td class="w-[25%]"><c:out value="${message.phoneNumber}"/></td>
            	<td class="w-[25%]"><c:out value="${message.email}"/></td>
            	<td class="w-[25%]"><c:out value="${message.text}"/></td>
        	</tr>
  		  </c:forEach>
            </tbody>
          </table>
          </div>
        </div>
      </div>
  </body>
</html>
