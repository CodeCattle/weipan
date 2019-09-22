package com.weipan.framework.userType.servlet;

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
import com.weipan.framework.userType.service.TypeService;
import com.weipan.framework.userType.service.TypeServiceImpl;


@WebServlet("/sys/type/delete")
public class TypeDeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type_id=request.getParameter("type_id");	
		TypeService typeService=new TypeServiceImpl();
		Map<String, Object> map=new HashMap<String, Object>();
		
		try {
			typeService.delete(type_id);
			map.put("flag", true);
		} catch (ServiceException e) {
			map.put("message", e.getMessage());
		}
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write(JSONObject.toJSONString(map));
		out.close();
	}

}
