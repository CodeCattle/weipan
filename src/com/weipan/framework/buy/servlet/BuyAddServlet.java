package com.weipan.framework.buy.servlet;

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
import com.weipan.framework.userInfo.vo.UserInfo;
import com.weipan.framework.userType.service.TypeService;
import com.weipan.framework.userType.service.TypeServiceImpl;


@WebServlet("/sys/buy/add")
public class BuyAddServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TypeService typeService=new TypeServiceImpl();
		
		request.setAttribute("type", typeService.listNotnprmal());
		
		request.getRequestDispatcher("/WEB-INF/view/buy/add.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		UserInfo userinfo=(UserInfo) session.getAttribute("session_user");
		
		String type_id=request.getParameter("type_id");
		String month=request.getParameter("month");
		String money=request.getParameter("money");
		
		BuyType bt=new BuyType();
		bt.setUser_id(userinfo.getUser_id());
		bt.setType_id(Integer.parseInt(type_id));
		bt.setMouthNumber(month);
		bt.setMoney(Integer.parseInt(money));
		
		Buyservice buyService=new BuyserviceImpl();
		try {
			buyService.add(bt);
			request.setAttribute("message",userinfo.getAccount()+",恭喜你购买会员成功");
		} catch (ServiceException e) {
			request.setAttribute("message", e.getMessage());
		}
		
		request.getRequestDispatcher("/WEB-INF/view/tip2.jsp").forward(request, response);
	}

}
