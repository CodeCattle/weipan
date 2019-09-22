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
import com.weipan.framework.userInfo.vo.UserInfo;
import com.weipan.framework.userType.service.TypeService;
import com.weipan.framework.userType.service.TypeServiceImpl;


@WebServlet("/sys/file/update")
public class FileUpdateServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		HttpSession session=request.getSession();
		UserInfo userinfo=(UserInfo) session.getAttribute("session_user");
		
		DirService dirService =new DirServiceImpl();
		List<Dir> dirList=dirService.list(userinfo.getUser_id());
		
		request.setAttribute("dirList",dirList);
		request.setAttribute("file_id", id);
		request.getRequestDispatcher("/WEB-INF/view/teacher-file-manger/update.jsp").forward(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		System.out.println(id);
		String dir_id=request.getParameter("dir_id");
		
		AttrService attrService=new AttrServiceImpl();
		AttrFile attrFile =attrService.load(id);
		
		String path=request.getServletContext().getRealPath("/attr/"+attrFile.getUser_id()+"/"+attrFile.getDir_id())+"/"+attrFile.getServer_name();
		String newPath=request.getServletContext().getRealPath("/attr/")+attrFile.getUser_id()+"/"+dir_id+"/";
		File folder=new File(path);
		File newfolder=new File(newPath);
		try {
			attrService.updateFileDir(dir_id, id);;	
			if(!newfolder.exists()) {
				newfolder.mkdir();
			}		
			File f = new File(newPath+attrFile.getServer_name());
			folder.renameTo(f);
			request.setAttribute("message", "移动文件夹成功");
		} catch (ServiceException e) {
			e.printStackTrace();
			request.setAttribute("message", e.getMessage());
		}
		request.getRequestDispatcher("/WEB-INF/view/tip3.jsp").forward(request, response);
		
	}
	
}
