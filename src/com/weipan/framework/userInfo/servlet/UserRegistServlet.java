package com.weipan.framework.userInfo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weipan.commons.exception.ServiceException;
import com.weipan.framework.userInfo.service.UserService;
import com.weipan.framework.userInfo.service.UserServiceImpl;
import com.weipan.framework.userInfo.vo.UserInfo;


@WebServlet("/sys/user/regist")
public class UserRegistServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/user/regist.jsp").forward(request, response);;
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String account=request.getParameter("account");
		String password=request.getParameter("password");
		String phone=request.getParameter("phone");
		
		UserService userService=new UserServiceImpl();
		
		UserInfo userinfo=new UserInfo();
		userinfo.setAccount(account);
		userinfo.setPassword(password);
		userinfo.setPhone(phone);
		
		try {
			userService.add(userinfo);
			response.sendRedirect(request.getContextPath()+"/sys/login");
		} catch (ServiceException e) {
			e.printStackTrace();
			request.setAttribute("message", e.getMessage());
			request.getRequestDispatcher("/WEB-INF/view/user/regist.jsp").forward(request, response);
		}
	}

}
