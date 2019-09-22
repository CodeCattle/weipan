package com.weipan.framework.dir.servlet;

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
import com.weipan.framework.dir.vo.Dir;
import com.weipan.framework.userInfo.vo.UserInfo;
import com.weipan.framework.userType.service.TypeService;
import com.weipan.framework.userType.service.TypeServiceImpl;


@WebServlet("/sys/dir/update")
public class DirUpdateServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dirId=request.getParameter("dir_id");
		System.out.println(dirId);
		DirService dirService=new DirServiceImpl();
		request.setAttribute("dir",dirService.load(Integer.parseInt(dirId)));
		
		request.getRequestDispatcher("/WEB-INF/view/dir/update.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		UserInfo userinfo=(UserInfo) session.getAttribute("session_user");
		
		String dir_id=request.getParameter("dir_id");
		String dir_name=request.getParameter("dir_name");
		String remark=request.getParameter("dir_remark");
		
		DirService dirService=new DirServiceImpl();
		Dir dir=new Dir();
		dir.setUser_id(userinfo.getUser_id());
		dir.setDir_name(dir_name);
		dir.setRemark(remark);
		dir.setId(Integer.parseInt(dir_id));
		
		Buyservice buyService=new BuyserviceImpl();
		try {
			dirService.update(dir);
			request.setAttribute("message","更新成功");
		} catch (ServiceException e) {
			request.setAttribute("message", e.getMessage());
		}
		
		request.getRequestDispatcher("/WEB-INF/view/tip3.jsp").forward(request, response);
	}

}
