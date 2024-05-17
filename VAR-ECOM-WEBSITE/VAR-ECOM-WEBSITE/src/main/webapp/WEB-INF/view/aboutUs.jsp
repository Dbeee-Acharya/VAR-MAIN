<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>VAR |About Us</title>
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
            <a href="">About Us</a>
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
          <a href="<%=request.getContextPath() %>/profilePage" >
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
        <div class="flex items-center justify-between">
          <div
            class="flex flex-col gap-2 min-h-[70vh] max-h-[70vh] overflow-y-auto border rounded-md w-[55%] px-12"
          >
            <div class="text-center py-3 text-4xl font-medium tracking-tighter">
              About Us
            </div>
            <div class="flex flex-col items-center justify-center gap-5">
              <img
                src="/Landing/assets/Frame 1000004201.png"
                alt=""
                class="w-[35rem]"
              />
              <p class="text-lg leading-[2rem]">
                Welcome to VAR, your premier destination for all things Virtual
                Reality (VR) and Augmented Reality (AR). At VAR, we're
                passionate about bringing the future to your fingertips today.
                With a carefully curated selection of cutting-edge VR and AR
                products, we aim to immerse our customers in extraordinary
                experiences that transcend reality. Whether you're an avid gamer
                seeking the latest VR headset, a designer exploring the
                possibilities of AR applications, or a curious enthusiast eager
                to delve into the realms of virtual exploration, we have
                something for you. Our commitment to quality, innovation, and
                customer satisfaction drives everything we do. Join us on the
                frontier of technology and unlock limitless possibilities with
                VAR.
              </p>
            </div>
          </div>
          <div class="flex flex-col gap-4 w-[40%]">
            <div class="flex items-center justify-around w-full">
              <div class="flex items-center gap-2">
                <div class="h-14">
                  <div
                    class="h-14 w-14 bg-slate-900 rounded-full flex items-center justify-center"
                  >
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="20"
                      height="20"
                      viewBox="0 0 24 24"
                      fill="none"
                      stroke="white"
                      stroke-width="2"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      class="lucide lucide-mail"
                    >
                      <rect width="20" height="16" x="2" y="4" rx="2" />
                      <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7" />
                    </svg>
                  </div>
                </div>
                <div class="flex flex-col">
                  <h3 class="text-[0.975rem] font-medium">Email</h3>
                  <h5>info.var@gmail.com</h5>
                </div>
              </div>
              <div class="flex items-center gap-2">
                <div class="h-14">
                  <div
                    class="h-14 w-14 bg-slate-900 rounded-full flex items-center justify-center"
                  >
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="20"
                      height="20"
                      viewBox="0 0 24 24"
                      fill="none"
                      stroke="white"
                      stroke-width="2"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      class="lucide lucide-phone"
                    >
                      <path
                        d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"
                      />
                    </svg>
                  </div>
                </div>
                <div class="flex flex-col">
                  <h3 class="text-[0.975rem] font-medium">Contact</h3>
                  <h5>+977 9803304208</h5>
                </div>
              </div>
            </div>
            <div
              class="flex flex-col gap-6 items-center justify-center px-12 border py-8 rounded-md relative"
            >
              <div class="flex flex-col gap-4 border-b py-5">
                <h1
                  class="text-left text-4xl font-medium tracking-tighter leading-[3.5rem]"
                >
                  Let's Chat, Reach Out to Us
                </h1>

                <h4 class="text-[0.975rem] text-gray-600 text-left">
                  Have questions or feedback? We're here to help. Send us a
                  message and we'll respond within 24 hours
                </h4>
              </div>

              <form
                action="<%=request.getContextPath() %>/contact"
                method = "post"
                class="flex flex-col items-center justify-start gap-4 w-[100%]"
                id="profileForm"
              >
                <div class="flex items-center gap-4 w-full">
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
                      name="email"
                      type="email"
                      class="focus:outline-none w-full disabled:text-slate-500"
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
                      name="phoneNumber"
                      type="number"
                      class="focus:outline-none w-full disabled:text-slate-500"
                    />
                  </div>
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
                    class="lucide lucide-message-circle"
                  >
                    <path d="M7.9 20A9 9 0 1 0 4 16.1L2 22Z" />
                  </svg>
                  <div class="h-[8rem] bg-gray-300 w-[1px]"></div>
                  <textarea
                  	name="text"
                    type="text"
                    class="focus:outline-none w-full disabled:text-slate-500 min-h-[10rem] text-left"
                  >
                  </textarea>
                </div>
                <button
              	type = "submit"
                class="px-4 py-3 bg-slate-800 rounded-2xl w-[70%] text-white text-[1rem] font-medium hover:bg-black duration-300 disabled:bg-slate-400"
              >
                Submit
              </button>
              </form>
              <span>${event }</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
  <script></script>
</html>
