package com.weipan.framework.userInfo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weipan.framework.userInfo.service.UserService;
import com.weipan.framework.userInfo.service.UserServiceImpl;

/**
 * Servlet implementation class showImage
 */
@WebServlet("/show")
public class showImageServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  user_id=request.getParameter("userId");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write(new UserServiceImpl().showImage(user_id));
		out.close();
	}

}
