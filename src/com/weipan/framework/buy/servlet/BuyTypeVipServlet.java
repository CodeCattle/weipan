package com.weipan.framework.buy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

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
import com.weipan.framework.userInfo.vo.UserInfo;
import com.weipan.framework.userType.service.TypeService;
import com.weipan.framework.userType.service.TypeServiceImpl;


@WebServlet("/sys/buy/valid")
public class BuyTypeVipServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		UserInfo userinfo=(UserInfo) session.getAttribute("session_user");
		Buyservice buyService=new BuyserviceImpl();
		

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write(String.valueOf(buyService.isVip(userinfo.getUser_id())));
		out.close();
		
	}

}
