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


@WebServlet("/sys/user/reset/password")
public class UserResetPasswordServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id=request.getParameter("user_id");
		
		UserService userService=new UserServiceImpl();
		
		Map<String, Object> map=new HashMap<String, Object>();
		try {
			userService.resetPassword(user_id);
			map.put("flag", true);
		} catch (ServiceException e) {
			e.printStackTrace();
			map.put("message", e.getMessage());
		}
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write(JSONObject.toJSONString(map));
		out.close();
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
