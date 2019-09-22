package com.weipan.framework.userType.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weipan.framework.userType.service.TypeService;
import com.weipan.framework.userType.service.TypeServiceImpl;


@WebServlet("/sys/type/list")
public class TypeListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TypeService typeService=new TypeServiceImpl();
		
		request.setAttribute("typeList", typeService.list());
		
		request.getRequestDispatcher("/WEB-INF/view/type/list.jsp").forward(request, response);
	}

}
