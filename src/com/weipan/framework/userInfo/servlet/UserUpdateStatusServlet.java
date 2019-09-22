package com.weipan.framework.userInfo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.weipan.commons.exception.ServiceException;
import com.weipan.framework.userInfo.service.UserService;
import com.weipan.framework.userInfo.service.UserServiceImpl;



@WebServlet("/sys/user/update/status")
public class UserUpdateStatusServlet extends HttpServlet {
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_id=request.getParameter("user_id");
		String status=request.getParameter("status");
		
		UserService userService=new UserServiceImpl();
		
		try {
			userService.updateStatus(user_id,Integer.parseInt(status));
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath()+"/sys/user/find");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
