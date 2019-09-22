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

@WebServlet("/sys/user/update/password")
public class UserUpdatePasswordServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String id = request.getParameter("id");
		
		UserService userService=new UserServiceImpl();
		request.setAttribute("user", userService.load(id));
		
		request.getRequestDispatcher("/WEB-INF/view/user/updatePassword.jsp").forward(request, response);;
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String user_id=request.getParameter("user_id");
		String password=request.getParameter("password");	
		UserService userService=new UserServiceImpl();
		
		try {
			userService.updatepassword(Integer.parseInt(user_id), password);
			response.sendRedirect(request.getContextPath()+"/sys/user/update/password");
		} catch (ServiceException e) {
			e.printStackTrace();
			request.setAttribute("message", e.getMessage());
			request.getRequestDispatcher("/WEB-INF/view/user/updatePassword.jsp").forward(request, response);
		}
	}

}
