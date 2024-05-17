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
    <title>VAR |Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminPageStyle.css" />
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
            <a href="<%=request.getContextPath() %>/dashboard" class="link">
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
                >Products</span
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
        <div
          class="w-full h-[7rem] flex flex-col items-start justify-center gap-6 bg-white px-10"
        >
          <h5 class="text-sm text-slate-600">
            Admin / <span class="text-black">Products</span>
          </h5>
          <h1 class="text-xl font-medium">Inventory</h1>
          <h6 style="color: red;">${productAddError }</h6>
        </div>

        <div class="flex items-center justify-end w-full mt-4 px-6 -mb-1">
          <button
            data-modal-target="#modal"
            class="px-4 py-2 bg-blue-500 text-white rounded-md text-sm font-medium hover:bg-blue-600 hover:-translate-y-[0.1rem] duration-300"
          >
            Add Product +
          </button>
        </div>
        <div
          class="m-6 min-h-[80vh] border rounded-md bg-white max-h-[80vh] overflow-y-auto"
        >
          <table style="width: 100%">
            <thead>
              <tr style="height: 4.3rem; border-bottom-width: 1px">
                <th>Id</th>
                <!--  <th>Image</th>-->
                <th>Name</th>
                <th>Image</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Description</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <!-- Table rows with data go here -->
             <c:forEach var="product" items="${listOfProducts}">
              <tr
                style="
                  height: 3.5rem;
                  text-align: center;
                  border-bottom-width: 1px;
                "
                class="w-full"
              >
                <td class="w-[15%]"><c:out value="${product.productId}"/></td>
                <td class="w-[10%]">
                  <img
                    src="data:image/jpeg;base64,${product.base64ImageData}"
                    alt=""
                    class="w-full max-w-[23rem]"
                  />
                </td>
                <td class="w-[20%]"><c:out value="${product.productName}"/></td>
                <td class="w-[20%]"><c:out value="${product.productPrice}"/></td>
                <td class="w-[10%]"><c:out value="${product.productStock}"/></td>
                <td class="w-[25%]"><c:out value="${product.productDescription}"/></td>
                <td
                  style="
                    display: flex;
                    align-items: center;
                    gap: 1rem;
                    height: 13rem;
                    justify-content: center;
                  "
                  class="w-full h-[100%] px-8"
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
                    class="lucide lucide-upload cursor-pointer"
                    data-modal-target="#uploadModal"
                  >
                    <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4" />
                    <polyline points="17 8 12 3 7 8" />
                    <line x1="12" x2="12" y1="3" y2="15" />
                  </svg>
                  
                  <form action="<%=request.getContextPath() %>/editProduct" method="post">
                  <input type="hidden" name="productId" value="${product.productId}"> 
                  <button type = "submit">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="20"
                      height="20"
                      viewBox="0 0 24 24"
                      fill="none"
                      stroke="#3b82f6"
                      stroke-width="2"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      class="lucide lucide-file-pen-line"
                      style="cursor: pointer"
                      data-modal-target="#editModal"
                    >
                      <path
                        d="m18 5-3-3H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2"
                      />
                      <path d="M8 18h1" />
                      <path d="M18.4 9.6a2 2 0 1 1 3 3L17 17l-4 1 1-4Z" />
                    </svg>
                    </button>
                    </form>
                  
                  
				 <form action="<%=request.getContextPath() %>/delete" method = "post">
                  
                 <!-- Hidden input to store product ID -->
                 <input type="hidden" name="productId" value="${product.productId}" />
                 <button type="submit">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="20"
                    height="20"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="red"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    class="lucide lucide-trash-2"
                    style="cursor: pointer"
                    data-modal-target="#deleteModal"
                  >
                    <path d="M3 6h18" />
                    <path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6" />
                    <path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2" />
                    <line x1="10" x2="10" y1="11" y2="17" />
                    <line x1="14" x2="14" y1="11" y2="17" />
                  </svg>
                  </button>
                  </form>
                </td>
              </tr>
              </c:forEach>
              
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <!-- ADD MODAL -->
    <div class="modal" id="modal">
      <div class="modal-header">
        <div></div>
        <div class="title">ADD PRODUCT</div>
        <button data-close-button class="close-button">&times;</button>
      </div>
      <form action="<%=request.getContextPath()%>/addProduct" method="post" enctype="multipart/form-data" class="modal-body">
        <div style="display: flex; align-items: center; gap: 2rem; width: 100%">
          <div
            style="
              display: flex;
              flex-direction: column;
              gap: 0.5rem;
              align-items: start;
              justify-content: center;
              width: 100%;
            "
          >
            <label for="" class="font-medium text-[0.9rem]">Name</label>
            <input
              type="text"
              name = "productName"
              placeholder="Enter product name"
              style="
                border-width: 1px;
                padding: 0.85rem 2rem;
                width: 100%;
                border-radius: 8px;
              "
              class="focus:outline-none"
            />
          </div>
          <div
            style="
              display: flex;
              flex-direction: column;
              gap: 0.5rem;
              align-items: start;
              justify-content: center;
              width: 100%;
            "
          >
            <label for="" class="font-medium text-[0.9rem]">Price</label>
            <input
              type="text"
              name="productPrice"
              placeholder="Enter product price"
              style="
                border-width: 1px;
                padding: 0.85rem 2rem;
                width: 100%;
                border-radius: 8px;
              "
              class="focus:outline-none"
            />
          </div>
        </div>
        <div style="display: flex; align-items: center; gap: 2rem; width: 100%">
          <div
            style="
              display: flex;
              flex-direction: column;
              gap: 0.5rem;
              align-items: start;
              justify-content: center;
              width: 100%;
            "
          >
            <label for="" class="font-medium text-[0.9rem]">Stock</label>
            <input
              type="text"
              name="productStock"
              placeholder="Enter avaible product stock"
              style="
                border-width: 1px;
                padding: 0.85rem 2rem;
                width: 100%;
                border-radius: 8px;
              "
              class="focus:outline-none"
            />
          </div>
          <div
            style="
              display: flex;
              flex-direction: column;
              gap: 0.5rem;
              align-items: start;
              justify-content: center;
              width: 100%;
            "
          >
            <label for="" class="font-medium text-[0.9rem]">Image</label>
            <input
              type="file"
              name="image"
              placeholder="Enter product price"
              style="
                border-width: 1px;
                padding: 0.85rem 2rem;
                width: 100%;
                border-radius: 8px;
              "
              class="focus:outline-none"
            />
          </div>
        </div>
        <div style="display: flex; align-items: center; gap: 2rem; width: 100%">
          <div
            style="
              display: flex;
              flex-direction: column;
              gap: 0.5rem;
              align-items: start;
              justify-content: center;
              width: 100%;
            "
          >
            <label for="" class="font-medium text-[0.9rem]">Description</label>
            <textarea
              type="text"
              name = "productDescription"
              placeholder="Enter product description"
              style="
                border-width: 1px;
                padding: 0.85rem 0.5rem;
                width: 100%;
                border-radius: 8px;
              "
              class="focus:outline-none"
            >
            </textarea>
          </div>
        </div>
        <div
          style="display: flex; align-items: center; justify-content: flex-end"
        >
          <button
          	type = "submit"
            class="px-4 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 duration-300"
          >
            Add Product
          </button>
        </div>
      </form>
    </div>

    <div class="modal" id="uploadModal">
      <div class="modal-header">
        <div></div>
        <div class="title">UPDATE PRODUCT IMAGE</div>
        <button data-close-button class="close-button">&times;</button>
      </div>
      <form action="<%=request.getContextPath() %>/imageUpdate" method="post" enctype="multipart/form-data" class="modal-body">
        <div style="display: flex; align-items: center; gap: 2rem; width: 100%">
          <div
            style="
              display: flex;
              flex-direction: column;
              gap: 0.5rem;
              align-items: start;
              justify-content: center;
              width: 100%;
            "
          >
			<label for="" class="font-medium text-[0.9rem]">Product ID</label>
            <input
              type="number"
              name="productId"
              placeholder="ProductId"
              style="
                border-width: 1px;
                padding: 0.85rem 2rem;
                width: 20%;
                border-radius: 8px;
              "
              class="focus:outline-none"
            />
            <label for="" class="font-medium text-[0.9rem]">Image</label>
            <input
              type="file"
              name = "image"
              placeholder="Enter product price"
              style="
                border-width: 1px;
                padding: 0.85rem 2rem;
                width: 100%;
                border-radius: 8px;
              "
              class="focus:outline-none"
            />
          </div>
        </div>

        <div
          style="display: flex; align-items: center; justify-content: flex-end"
        >
          <button
            class="px-4 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 duration-300"
          >
            Upload Image
          </button>
        </div>
      </form>
    </div>

    <script>
      const openModalButtons = document.querySelectorAll("[data-modal-target]");
      const closeModalButtons = document.querySelectorAll(
        "[data-close-button]"
      );
      const overlay = document.getElementById("overlay");

      openModalButtons.forEach((button) => {
        button.addEventListener("click", () => {
          const modal = document.querySelector(button.dataset.modalTarget);
          openModal(modal);
        });
      });

      closeModalButtons.forEach((button) => {
        button.addEventListener("click", () => {
          const modal = button.closest(".modal");
          closeModal(modal);
        });
      });

      function openModal(modal) {
        if (modal === null) return;
        modal.classList.add("active");
        overlay.classList.add("active");
      }
      function closeModal(modal) {
        if (modal === null) return;
        modal.classList.remove("active");
        overlay.classList.remove("active");
      }
    </script>
  </body>
</html>
