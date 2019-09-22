package com.weipan.framework.userInfo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weipan.framework.userInfo.service.UserService;
import com.weipan.framework.userInfo.service.UserServiceImpl;
import com.weipan.framework.userInfo.vo.UserInfo;

@WebServlet("/sys/user/valid/password")
public class checkPasswordServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String password=request.getParameter("password");
			
			HttpSession session=request.getSession();
			UserInfo userInfo=(UserInfo) session.getAttribute("session_user");
			UserService userService=new UserServiceImpl();
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write(String.valueOf(userService.checkPasswordCount(userInfo.getUser_id(), password)));
			out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
