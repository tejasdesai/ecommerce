package com.ecommerce.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.service.cartService;
import com.ecommerce.service.loginService;

public class ControllerServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private loginService loginservice = null;
	private cartService cartservice = null;
	public static HttpSession session;

	@Override
	public void init() throws ServletException {
		loginservice = new loginService();
		cartservice = new cartService();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String nextPage = "/login.jsp";
		if(request.getMethod().equals("GET")) {
			if(action.equalsIgnoreCase("logout")) {
				nextPage="/login.jsp";
			} else if(action.equalsIgnoreCase("help")) {
				nextPage="/help.jsp";
			}
		} else if(request.getMethod().equals("POST")) {
			String page = request.getParameter("page");
			session = request.getSession();
			if(page.equalsIgnoreCase("loginpage")) {
				if(action.equalsIgnoreCase("Login")) {
					String username = request.getParameter("username");
					String password = request.getParameter("password");
					boolean isValidUser = loginservice.authenticate(username, password);
					if(isValidUser) {
						nextPage = "/cart.jsp";
						session.setAttribute("selectedProducts", "");
						session.setAttribute("productList", cartservice.fetchAll());
					} else {
						nextPage = "/login.jsp";
						request.setAttribute("loginError", "Invalid Username/Password");
					}
				}
			} else if(page.equalsIgnoreCase("cartpage")) {
				System.out.println("POST".equalsIgnoreCase(request.getMethod()));
				if(action.equalsIgnoreCase("addToCart")) {
					Map<String, String> selectedProducts = new HashMap<String, String>();
					String products[] = request.getParameterValues("products");
					if (products != null && products.length != 0) {
						for (int i = 0; i < products.length; i++) {
							if (!products[i].isEmpty()) {
								String quantity = request.getParameter(products[i].split("\\|")[0]);
								selectedProducts.put(products[i], quantity);
							}
						}
					}
					if(session.getAttribute("selectedProducts") != null && !session.getAttribute("selectedProducts").equals("")) {
						session.setAttribute("selectedProducts", "");
						session.setAttribute("selectedProducts", selectedProducts);
					} else {
						session.setAttribute("selectedProducts", selectedProducts);
					}
					request.setAttribute("cartsuccess", "success");
					nextPage = "/cart.jsp";
				} else if(action.equalsIgnoreCase("checkOut")) {
					if(session.getAttribute("selectedProducts") == null || session.getAttribute("selectedProducts").equals("")) {
						request.setAttribute("noProduct", "Cart is empty. Please add a product.");
						nextPage = "/cart.jsp";
					} else {
						nextPage = "/summary.jsp";
					}
				}
			} else if(page.equalsIgnoreCase("summarypage")) {
				if(action.equalsIgnoreCase("backToCart")) {
					nextPage = "/cart.jsp";
				} else if(action.equalsIgnoreCase("Checkout")) {
					session.setAttribute("selectedProducts", null);
					nextPage = "/thankyou.jsp";
				}
			} else if(page.equalsIgnoreCase("thankyoupage")) {
				if(action.equalsIgnoreCase("logout")) {
					session.setAttribute("selectedProducts", "");
					nextPage = "/login.jsp";
				} else if(action.equalsIgnoreCase("help")) {
					nextPage = "/help.jsp";
				}
			}
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(nextPage);
		rd.forward(request, response);
	}	

}
