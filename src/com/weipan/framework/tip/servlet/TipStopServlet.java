package com.weipan.framework.tip.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;
import com.weipan.framework.tip.service.TipService;
import com.weipan.framework.tip.service.TipServiceImpl;
import com.weipan.framework.userInfo.vo.UserInfo;

/**
 * Servlet implementation class TipStopServlet
 */
@WebServlet("/sys/tip/stop")
public class TipStopServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TipService tipService =new TipServiceImpl();
		HttpSession session=request.getSession();
		UserInfo userinfo=(UserInfo)session.getAttribute("session_user");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter os=response.getWriter();
		os.write(JSONObject.toJSONString(tipService.tip(userinfo.getUser_id())));
		os.close();
		
	}

}
