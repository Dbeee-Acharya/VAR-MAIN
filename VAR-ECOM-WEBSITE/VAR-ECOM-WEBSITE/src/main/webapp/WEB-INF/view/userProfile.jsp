<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>VAR |User Profile</title>
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
    <div class="flex flex-col gap-20 min-h-screen w-full relative">
      <nav class="h-20 flex items-center justify-between mx-[12rem]">
        <img
          src="${pageContext.request.contextPath}/assets/VAR.png"
          alt=""
          class="h-10 w-10 object-contain"
        />
        <ul class="flex items-center gap-6">
          <li
            class="font-medium text-[1rem] text-slate-600 hover:text-black duration-300"
          >
            <a href="<%=request.getContextPath()%>/homepage">Home</a>
          </li>
          <li
            class="font-medium text-[1rem] text-black hover:text-black duration-300"
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
          <a href="<%=request.getContextPath() %>/cart">
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
          </a>
          <a href="<%=request.getContextPath() %>/login" >
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
		
	  <form action="<%=request.getContextPath() %>/logout" method="post">
      <button
        class="absolute right-[12rem] top-[7rem] px-3 text-sm rounded-md py-1 bg-slate-900 hover:bg-black hover:-translate-y-[0.1rem] hover:shadow-md text-white duration-300"
        type = "submit"
      >
        Log out
      </button>
      </form>

      <div class="mx-[12rem] flex flex-col gap-4">
        <h1 class="text-3xl font-semibold tracking-tighter">User Profile</h1>
        <h4 style="color:maroon">${updateStatus }</h4>
        <div class="flex items-center justify-between">
          <div
            class="flex flex-col gap-6 items-center justify-center px-12 w-[49%] border rounded-md py-[6.6rem] relative"
          >
            <div class="flex flex-col gap-2">
              <h1 class="text-center text-2xl font-semibold tracking-tighter">
                Profile
              </h1>
              <div
                class="absolute top-6 right-6 flex items-center gap-1 cursor-pointer"
                id="editIcon"
                onclick="toggleEdit()"
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="20"
                  height="20"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor "
                  stroke-width="2"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  class="lucide lucide-file-pen-line cursor-pointer"
                >
                  <path
                    d="m18 5-3-3H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2"
                  />
                  <path d="M8 18h1" />
                  <path d="M18.4 9.6a2 2 0 1 1 3 3L17 17l-4 1 1-4Z" />
                </svg>
                <h5 class="text-sm font-medium">Edit</h5>
              </div>
              <h4 class="text-[0.975rem] text-gray-400 text-center">
                Update your personal details here.
              </h4>
            </div>

            <form
              action="<%=request.getContextPath() %>/updateUser"
              method = "post"
              class="flex flex-col items-center justify-center gap-4 w-[70%]"
              id="profileForm"
            >
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
                  class="lucide lucide-user-round"
                >
                  <circle cx="12" cy="8" r="5" />
                  <path d="M20 21a8 8 0 0 0-16 0" />
                </svg>
                <div class="h-6 bg-gray-300 w-[1px]"></div>
                <input
                  placeholder="Username"
                  name = "userName"
                  type="text"
                  class="focus:outline-none w-full disabled:text-slate-500"
                  value="${user.userName}"
                  disabled="true"
                />
              </div>
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
                  class="lucide lucide-phone"
                >
                  <path
                    d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"
                  />
                </svg>
                <div class="h-6 bg-gray-300 w-[1px]"></div>
                <input
                  placeholder="Phone Number"
                  type="number"
                  name = "phoneNumber"
                  class="focus:outline-none w-full disabled:text-slate-500"
                  value="${user.phoneNumber }"
                  disabled="true"
                />
              </div>
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
                  class="lucide lucide-mail"
                >
                  <rect width="20" height="16" x="2" y="4" rx="2" />
                  <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7" />
                </svg>
                <div class="h-6 bg-gray-300 w-[1px]"></div>
                <input
                  placeholder="Email"
                  type="email"
                  name = "email"
                  class="focus:outline-none w-full disabled:text-slate-500"
                  value="${user.email }"
                  disabled="true"
                />
              </div>
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
                  type="text"
                  name = "address"
                  class="focus:outline-none w-full disabled:text-slate-500"
                  value="${user.userAddress }"
                  disabled="true"
                />
              </div>
              
            	 <button
              form="profileForm"
              class="px-4 py-3 bg-slate-800 rounded-2xl w-[70%] text-white text-[1rem] font-medium hover:bg-black duration-300 disabled:bg-slate-400"
              disabled="true"
              id="updateButton"
            >
              Update
            </button>
            </form>

          </div>
          <div
            class="flex flex-col gap-2 min-h-[70vh] max-h-[70vh] overflow-y-auto border rounded-md w-[50%]"
          >
            <div
              class="text-center py-3 border-b text-xl font-medium tracking-tight"
            >
              Order History
            </div>
            <div
              class="flex items-center justify-between w-full p-4 border-b relative"
            >
              <div class="flex items-center gap-4 py-6 w-full">
                <img
                  src="/Landing/assets/vrProduct.jpg"
                  alt=""
                  class="w-[10rem] rounded-md"
                />
                <div class="flex flex-col">
                  <h3 class="text-lg font-medium">Oculus Rift 3</h3>
                  <h3 class="text-[0.975rem] text-gray-500">
                    Virtual Reality Headset
                  </h3>
                </div>
              </div>
              <div class="flex items-center gap-1">
                <h1 class="text-[1rem] tracking-tight">Total:</h1>
                <h1 class="text-[1rem] font-medium tracking-tight w-full">
                  $429.99
                </h1>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
  <script>
    function toggleEdit() {
      var inputs = document.querySelectorAll("#profileForm input:not([name='userName'])");
      var button = document.getElementById("updateButton");
      var editIcon = document.getElementById("editIcon").querySelector("svg");

      inputs.forEach(function (input) {
        input.disabled = !input.disabled;
      });

      button.disabled = !button.disabled;

      if (inputs[0].disabled) {
        editIcon.setAttribute(
          "class",
          "lucide lucide-file-pen-line cursor-pointer"
        );
        editIcon.nextElementSibling.textContent = "Edit";
      } else {
        editIcon.setAttribute(
          "class",
          "lucide lucide-square-cross cursor-pointer"
        );
        editIcon.nextElementSibling.textContent = "Stop Editing";
      }
    }
  </script>
</html>
