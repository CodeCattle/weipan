package com.weipan.framework.userInfo.servlet;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weipan.commons.exception.AccountException;
import com.weipan.commons.exception.ServiceException;
import com.weipan.framework.userInfo.service.UserService;
import com.weipan.framework.userInfo.service.UserServiceImpl;
import com.weipan.framework.userInfo.vo.UserInfo;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/sys/login")
public class LoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);;
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String account=req.getParameter("account");
		String pwd=req.getParameter("password");
		
		UserService userService=new UserServiceImpl();
		try {
			UserInfo user=userService.login(account, pwd);
			HttpSession session=req.getSession();
			
			if(session.getAttribute("session_user")==null) {
				String ip=user.getIp_address();
				userService.updateLogin(ip, user.getUser_id());
			}
			session.setAttribute("session_user", user);
			resp.sendRedirect(req.getContextPath()+"/sys/main");
			
		} catch (AccountException | ServiceException e) {
			e.printStackTrace();
			req.setAttribute("message", e.getMessage());
			req.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(req, resp);
		}
	}
	
	
}
