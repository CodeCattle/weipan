package com.weipan.framework.userInfo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weipan.commons.exception.ServiceException;
import com.weipan.framework.userInfo.service.UserService;
import com.weipan.framework.userInfo.service.UserServiceImpl;
import com.weipan.framework.userInfo.vo.UserInfo;

@WebServlet("/sys/update")
public class UserUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String id = request.getParameter("id");*/
		HttpSession session=request.getSession();
		UserInfo userInfo=(UserInfo) session.getAttribute("session_user");
		System.out.println(userInfo.getUser_id());
		
		String message = request.getParameter("message");

		UserService userService=new UserServiceImpl();
		request.setAttribute("user", userService.load(String.valueOf(userInfo.getUser_id())));
		
		request.setAttribute("message", message);
		request.getRequestDispatcher("/WEB-INF/view/user/update.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String user_id=request.getParameter("user_id");
		String user_name=request.getParameter("user_name");
		String phone=request.getParameter("phone");
		
		UserService userService=new UserServiceImpl();
		UserInfo userinfo=new UserInfo();
		
		userinfo.setUser_id(Integer.parseInt(user_id));
		userinfo.setPhone(phone);
		userinfo.setUser_name(user_name);
		
		try {
			userService.update(userinfo);
			response.sendRedirect(request.getContextPath()+"/sys/update");
		} catch (ServiceException e) {
			e.printStackTrace();
			String message = e.getMessage();
			message = new String(message.getBytes("UTF-8"),"ISO8859-1");
			response.sendRedirect(request.getContextPath()+"/sys/update?id="+user_id+"&message="+message);
		}
	}

}
