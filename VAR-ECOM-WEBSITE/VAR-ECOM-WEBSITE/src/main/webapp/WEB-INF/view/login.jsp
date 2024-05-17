<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>VAR |Login</title>
    <link rel="stylesheet" href="styles.css" />
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
    <div class="min-h-screen bg-[#f0f2f5] flex items-center justify-center">
      <div class="h-[75vh] w-[90%] bg-white rounded-md shadow-lg flex">
        <img
          src="assets/Virtual reality-cuate (1).svg"
          alt=""
          class="w-[65%] bg-slate-800 rounded-md"
        />

        <div
          class="flex flex-col gap-6 items-center justify-center px-12 w-[35%]"
        >
          <div class="flex flex-col gap-2">
            <h1 class="text-center text-3xl font-semibold tracking-tighter">
              Welcome Back 👋
            </h1>
            <h4 class="text-[0.975rem] text-gray-400 text-center">
              Please enter your details
              <p style="color:red">${error}</p>
              <p style="color:green">${register}</p>   
            </h4>
          </div>
          <div
            class="h-14 rounded-2xl w-[70%] bg-[#f0f2f5] flex gap-2 items-center px-2"
          >
            <a
              href=""
              class="h-10 flex items-center justify-center bg-white w-1/2 rounded-2xl text-sm font-medium"
            >
              Sign In
            </a>
            <a
              href="<%=request.getContextPath() %>/register"
              class="h-10 flex items-center justify-center w-1/2 text-sm font-medium text-gray-500 hover:bg-gray-200 hover:text-slate-800 rounded-2xl duration-300"
            >
              Sign Up
            </a>
          </div>

          <form
          	id = "login-form"
            action="<%=request.getContextPath() %>/login"
            method = "post"
            class="flex flex-col items-center justify-center gap-4 w-[70%]"
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
                class="lucide lucide-mail"
              >
                <rect width="20" height="16" x="2" y="4" rx="2" />
                <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7" />
              </svg>
              <div class="h-6 bg-gray-300 w-[1px]"></div>
              <input
                placeholder="username"
                type= "text"
                id = "userName"
                name = "userName"
                class="focus:outline-none w-full"
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
                class="lucide lucide-square-asterisk"
              >
                <rect width="18" height="18" x="3" y="3" rx="2" />
                <path d="M12 8v8" />
                <path d="m8.5 14 7-4" />
                <path d="m8.5 10 7 4" />
              </svg>
              <div class="h-6 bg-gray-300 w-[1px]"></div>
              <input
                placeholder="password"
                id = "userPassword"
                name = "userPassword"
                type="password"
                class="focus:outline-none w-full"
              />
            </div>
         	</form>

          <button
          	type = "submit"
          	id = "submit"
          	name = "submit"
          	form = "login-form"
            class="px-4 py-3 bg-blue-500 rounded-2xl w-[70%] text-white text-[1rem] font-medium hover:bg-blue-600 duration-300"
          >
            Sign In
          </button>

          <h5 class="text-sm text-gray-800">
          <p style="font: 1rem bold; color: red; margin-bottom:2rem">${error1 }</p>
            Don't have an account?
            <span class="text-black underline cursor-pointer"><a href="<%=request.getContextPath() %>/register">Sign up</a></span>
          </h5>
          <h5 class="text-sm text-gray-800">
            go back home?
            <span class="text-black underline cursor-pointer"><a href="<%=request.getContextPath() %>/homepage">Home</a></span>
          </h5>
        </div>
      </div>
    </div>
  </body>
</html>
