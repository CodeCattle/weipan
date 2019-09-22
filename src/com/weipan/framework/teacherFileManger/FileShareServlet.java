package com.weipan.framework.teacherFileManger;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
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
import com.weipan.framework.dir.vo.Dir;
import com.weipan.framework.share.service.ShareService;
import com.weipan.framework.share.service.ShareServiceImpl;
import com.weipan.framework.share.vo.shareFile;
import com.weipan.framework.userInfo.vo.UserInfo;
import com.weipan.framework.userType.service.TypeService;
import com.weipan.framework.userType.service.TypeServiceImpl;


@WebServlet("/sys/file/share")
public class FileShareServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		
		AttrService attrService=new AttrServiceImpl();
		AttrFile attrFile =attrService.load(id);
		
		request.setAttribute("attrFile", attrFile);
		request.getRequestDispatcher("/WEB-INF/view/teacher-file-manger/share.jsp").forward(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title=request.getParameter("title");
		String path=request.getParameter("path");
		String user_id=request.getParameter("user_id");
		
		shareFile sf =new shareFile();
		sf.setPath(path);
		sf.setTitle(title);
		sf.setUser_id(Integer.parseInt(user_id));
		ShareService shareService=new ShareServiceImpl();
		try {
			shareService.add(sf);
			request.setAttribute("message","分享成功<br/>路径为:"+path);
		} catch (ServiceException e) {
			request.setAttribute("message", e.getMessage());
		}
		
		request.getRequestDispatcher("/WEB-INF/view/tip3.jsp").forward(request, response);	
	}
	
}
