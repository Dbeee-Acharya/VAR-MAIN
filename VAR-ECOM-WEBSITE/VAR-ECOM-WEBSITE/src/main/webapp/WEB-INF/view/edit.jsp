<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
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
    <!-- <link rel="stylesheet" href="styles.css" /> -->
    <script src="https://cdn.tailwindcss.com"></script>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/editProductStyle.css" >
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
            <a href="" class="link">
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
            <a href="" class="link">
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
        </ul>
      </aside>
      <div class="flex flex-col w-full">
        <div
          class="w-full h-[7rem] flex flex-col items-start justify-center gap-6 bg-white px-10"
        >
          <h5 class="text-sm text-slate-600">
            Admin / <span class="text-black">Update Product</span>
          </h5>
          <h1 class="text-xl font-medium">Inventory</h1>
        </div>

        <div
          class="m-6 min-h-[80vh] border rounded-md bg-white max-h-[80vh] overflow-y-auto"
        >
          <div class="modal" id="editModal">
            <div class="modal-header">
              <div class="title">EDIT PRODUCT</div>
              <a href="<%=request.getContextPath() %>/adminPanel">&times;</a>
            </div>
            <form action="<%=request.getContextPath() %>/update" method="post" class="modal-body">
            <input type = "hidden" name = "productId" value="${product.productId }">
              <div
                style="
                  display: flex;
                  align-items: center;
                  gap: 2rem;
                  width: 100%;
                "
              >
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
                  	name = "productName"
                    type="text"
                    placeholder="Enter product name"
                    value = "${product.productName }"
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
                  	name = "productPrice"
                  	value = "${product.productPrice }"
                    type="text"
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
                style="
                  display: flex;
                  align-items: center;
                  gap: 2rem;
                  width: 100%;
                "
              >
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
                  	name = "productStock"
                  	value = "${product.productStock }"
                    type="text"
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
              </div>
              <div
                style="
                  display: flex;
                  align-items: center;
                  gap: 2rem;
                  width: 100%;
                "
              >
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
                  <label for="" class="font-medium text-[0.9rem]"
                    >Description</label
                  >
                  <textarea
                  	name = "productDescription"
                    type="text"
                    placeholder="Enter product description"
                    style="
                      border-width: 1px;
                      padding: 0.85rem 0.5rem;
                      width: 100%;
                      border-radius: 8px;
                    "
                    class="focus:outline-none"
                  >
                  ${product.productDescription }
                  </textarea>
                </div>
              </div>
              <div
                style="
                  display: flex;
                  align-items: center;
                  justify-content: flex-end;
                "
              >
                <button
                  type = "submit"
                  class="px-4 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 duration-300"
                >
                  Update
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <div id="overlay"></div>
  </body>
</html>
