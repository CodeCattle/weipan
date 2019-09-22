package com.weipan.framework.attr.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weipan.commons.exception.ServiceException;
import com.weipan.framework.buy.service.Buyservice;
import com.weipan.framework.buy.service.BuyserviceImpl;
import com.weipan.framework.buy.vo.BuyType;
import com.weipan.framework.dir.service.DirService;
import com.weipan.framework.dir.service.DirServiceImpl;
import com.weipan.framework.userInfo.vo.UserInfo;
import com.weipan.framework.userType.service.TypeService;
import com.weipan.framework.userType.service.TypeServiceImpl;


@WebServlet("/sys/attr/list")
public class AttrListServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dir_id=request.getParameter("dir_id");
		request.setAttribute("dir_id", dir_id);
		System.out.println(dir_id);
		request.getRequestDispatcher("/WEB-INF/view/attr/list.jsp").forward(request, response);
	}
}
