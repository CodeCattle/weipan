package com.weipan.framework.userInfo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weipan.commons.model.Page;
import com.weipan.framework.userInfo.service.UserServiceImpl;

@WebServlet("/sys/user/find")
public class UserInfoServlet extends HttpServlet {
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageNow=request.getParameter("pageNow");
		
		String status=request.getParameter("status");
		//System.out.println(status);
		String user_name=request.getParameter("user_name");
		//System.out.println(user_name);
		
		Page page=new Page();
		if(pageNow!=null) {
			page.setPageNow(Integer.parseInt(pageNow));
		}
		
		if(status!=null&&status.length()>0) {
			page.getQuery().put("status",status);
		}
		if(user_name!=null&&user_name.trim().length()>0) {
			page.getQuery().put("user_name",user_name);
		}
		
		request.setAttribute("page", new UserServiceImpl().find(page));
		request.getRequestDispatcher("/WEB-INF/view/user/find.jsp").forward(request, response);;
		
	}

	
}
