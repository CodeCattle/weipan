package com.weipan.framework.share.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;
import com.weipan.commons.exception.ServiceException;
import com.weipan.framework.attr.service.AttrService;
import com.weipan.framework.attr.service.AttrServiceImpl;
import com.weipan.framework.attr.vo.AttrFile;
import com.weipan.framework.buy.service.Buyservice;
import com.weipan.framework.buy.service.BuyserviceImpl;
import com.weipan.framework.buy.vo.BuyType;
import com.weipan.framework.dir.service.DirService;
import com.weipan.framework.dir.service.DirServiceImpl;
import com.weipan.framework.share.service.ShareService;
import com.weipan.framework.share.service.ShareServiceImpl;
import com.weipan.framework.userInfo.vo.UserInfo;
import com.weipan.framework.userType.service.TypeService;
import com.weipan.framework.userType.service.TypeServiceImpl;


@WebServlet("/sys/share/cancel")
public class ShareCancelServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		ShareService shareService=new ShareServiceImpl();
		Map<String, Object> map=new HashMap<String, Object>();
		
		try {
			shareService.delete(id);
			map.put("flag",true);
		} catch (ServiceException e) {
			map.put("message",e.getMessage());
		}
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.write(JSONObject.toJSONString(map));
		out.close();
	}
}
