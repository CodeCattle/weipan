package com.weipan.framework.userType.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weipan.commons.exception.ServiceException;
import com.weipan.framework.userType.service.TypeService;
import com.weipan.framework.userType.service.TypeServiceImpl;
import com.weipan.framework.userType.vo.UserType;


@WebServlet("/sys/type/update")
public class TypeUpdateServlet extends HttpServlet {
	private TypeService typeService=new TypeServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type_id=request.getParameter("type_id");
		request.setAttribute("type", typeService.load(type_id));
		
		request.getRequestDispatcher("/WEB-INF/view/type/update.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type_name=request.getParameter("type_name");
		String file_size=request.getParameter("file_size");
		String max_size=request.getParameter("max_size");
		String money=request.getParameter("money");
		String user_id=request.getParameter("user_id");
		
		UserType userType=new UserType();
		userType.setType_id(Integer.parseInt(user_id));
		userType.setType_name(type_name);
		userType.setFile_size(Integer.parseInt(file_size));
		userType.setMax_size(Integer.parseInt(max_size));
		userType.setMoney(Integer.parseInt(money));	
		try {
			typeService.update(userType);;
			request.setAttribute("message", "更新会员类型成功");
		} catch (ServiceException e) {
			e.printStackTrace();
			request.setAttribute("message", e.getMessage());
		}
		
		request.getRequestDispatcher("/WEB-INF/view/tip.jsp").forward(request, response);
	}
	

}
