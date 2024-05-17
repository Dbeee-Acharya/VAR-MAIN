package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AuthenticationFilter
 */
@WebFilter("/*")
public class AuthenticationFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public AuthenticationFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Get the session
        HttpSession session = httpRequest.getSession(false); // false means do not create session if it doesn't exist
        String url = httpRequest.getRequestURI();

        // Check if the request is for the homepage and the user is not logged in
        if((url.endsWith(".css") || url.endsWith(".jpg") || url.endsWith(".jpeg") || url.endsWith(".svg") || url.endsWith(".png"))) {
        	chain.doFilter(httpRequest, httpResponse);
        	return;
        	
        }  else  if ((url.endsWith("/homepage") || url.endsWith("/") || url.endsWith("/logout") || url.endsWith("/about") || url.endsWith("/delete")
        		|| url.endsWith("/addProduct") || url.endsWith("/contact") || url.endsWith("/imageUpdate")  )) {
            chain.doFilter(request, response); // Allow access to these pages
            return;
            
        } else if((url.endsWith("/adminPanel") || url.endsWith("/profilePage") || url.endsWith("/login") || url.endsWith("/register") || url.endsWith("editProduct") 
        		|| url.endsWith("/dashboard") || url.endsWith("/update") || url.endsWith("/cart") || url.endsWith("/productOrder") || url.endsWith("/updateUser") 
        		|| url.endsWith("/adminOrder") || url.endsWith("/removeItem") || url.endsWith("/listOfUsers"))) {
        	if(session == null) {
        		request.getRequestDispatcher("homepage").forward(httpRequest, httpResponse);
        		
        	}else if((session.getAttribute("userName") == null || session == null)) { // user is not logged in
        		
        		if(url.endsWith("/register")) {
        			request.getRequestDispatcher("register").forward(httpRequest, httpResponse);
        			
        		} else if(url.endsWith("/profilePage")) {
            		request.getRequestDispatcher("login").forward(httpRequest, httpResponse);   
            		
        		} else {
        			request.getRequestDispatcher("login").forward(httpRequest, httpResponse);
        		}
        		
        	} else if((session.getAttribute("role") != null) && session.getAttribute("userName") != null) { // user is logged in
        		if(((url.endsWith("/adminPanel")) && session.getAttribute("role").equals("admin"))) {
        			request.getRequestDispatcher("adminPanel").forward(httpRequest, httpResponse);
        			
        		} else if(url.endsWith("/adminPanel") && (session.getAttribute("role").equals("user"))) {
        			request.getRequestDispatcher("homepage").forward(httpRequest, httpResponse);
        			
        		} else if(url.endsWith("/profilePage") && (session.getAttribute("role").equals("user"))) {
        			request.getRequestDispatcher("profilePage").forward(httpRequest, httpResponse);
        	
        		} else if(url.endsWith("/profilePage") && (session.getAttribute("role").equals("admin"))) {
        			request.getRequestDispatcher("adminPanel").forward(httpRequest, httpResponse);
        			
        		} else if(url.endsWith("/login") || url.endsWith("/register")) {
        			request.getRequestDispatcher("homepage").forward(httpRequest, httpResponse);
        		}else if((url.endsWith("/editProduct") && session.getAttribute("role").equals("admin"))) {
        			request.getRequestDispatcher("editProduct").forward(httpRequest, httpResponse);
        
        		} else if((url.endsWith("/dashboard") && session.getAttribute("role").equals("admin"))) {
        			request.getRequestDispatcher("dashboard").forward(httpRequest, httpResponse);
        			
        		} else if(url.endsWith("/update") && session.getAttribute("role").equals("admin")) {
        			request.getRequestDispatcher("update").forward(httpRequest, httpResponse);
        			
        		} else if(url.endsWith("/cart")) {
        			request.getRequestDispatcher("cart").forward(httpRequest, httpResponse);
        		} else if(url.endsWith("/productOrder")) {
        			request.getRequestDispatcher("productOrder").forward(httpRequest, httpResponse);
        			
        		} else if(url.endsWith("/updateUser")) {
        			request.getRequestDispatcher("updateUser").forward(httpRequest, httpResponse);
        			
        		} else if(url.endsWith("/adminOrder") && session.getAttribute("role").equals("admin")) {
        			chain.doFilter(httpRequest, httpResponse);
        			
        		} else if(url.endsWith("removeItem") && session.getAttribute("role").equals("admin")) {
        			request.getRequestDispatcher("removeItem").forward(httpRequest, httpResponse);
        			
        		} else if(url.endsWith("/listOfUsers") && session.getAttribute("role").equals("admin")) {
        			request.getRequestDispatcher("listOfUsers").forward(httpRequest, httpResponse);	
        		}
        	}
        }      
        
     }
		

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
