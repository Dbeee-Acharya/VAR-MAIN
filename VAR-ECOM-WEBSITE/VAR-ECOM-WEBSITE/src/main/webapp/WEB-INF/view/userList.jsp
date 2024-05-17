<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>
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
<div class="flex flex-col gap-4 p-10">
            <a href="<%=request.getContextPath()%>/dashboard">
            <button 
            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
  					Go Back
			</button>
			</a>
            <table style="width: 100%">
            <thead>
              <tr style="height: 4.3rem; border-bottom-width: 1px">
              	<th>Username</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>Address</th>
               
              </tr>
            </thead>
            <tbody>
              <!-- Table rows with data go here -->
    		<c:forEach var="user" items="${listOfUsers}">
       		 <tr style="height: 4.5rem; text-align: center; border-bottom-width: 1px;" class="w-full">
            	<td class="w-[25%]"><c:out value="${user.userName}"/></td>
            	<td class="w-[25%]"><c:out value="${user.phoneNumber}"/></td>
            	<td class="w-[25%]"><c:out value="${user.email}"/></td>
            	<td class="w-[25%]"><c:out value="${user.userAddress}"/></td>
        	</tr>
  		  </c:forEach>
            </tbody>
          </table>
          </div>
</body>
</html>