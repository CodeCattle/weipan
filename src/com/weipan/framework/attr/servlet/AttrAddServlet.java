package com.weipan.framework.attr.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

import com.weipan.commons.exception.ServiceException;
import com.weipan.framework.attr.dto.AttrDto;
import com.weipan.framework.attr.service.AttrService;
import com.weipan.framework.attr.service.AttrServiceImpl;
import com.weipan.framework.attr.vo.AttrFile;
import com.weipan.framework.buy.service.Buyservice;
import com.weipan.framework.buy.service.BuyserviceImpl;
import com.weipan.framework.buy.vo.BuyType;
import com.weipan.framework.dir.service.DirService;
import com.weipan.framework.dir.service.DirServiceImpl;
import com.weipan.framework.dir.vo.Dir;
import com.weipan.framework.userInfo.service.UserService;
import com.weipan.framework.userInfo.service.UserServiceImpl;
import com.weipan.framework.userInfo.vo.UserInfo;
import com.weipan.framework.userType.service.TypeService;
import com.weipan.framework.userType.service.TypeServiceImpl;
import com.weipan.framework.userType.vo.UserType;


@WebServlet("/sys/attr/add")
@MultipartConfig
public class AttrAddServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		UserInfo userinfo=(UserInfo) session.getAttribute("session_user");
		
		UserService userService=new UserServiceImpl();
		userinfo=userService.load(String.valueOf(userinfo.getUser_id()));
		Integer vip_type=userinfo.getVip_type();
		
		TypeService typeService=new TypeServiceImpl();
		UserType userType=typeService.load(String.valueOf(vip_type));
		request.setAttribute("userType", userType);
		
		DirService dirService=new DirServiceImpl();
		request.setAttribute("dirList", dirService.list(userinfo.getUser_id()));

		request.getRequestDispatcher("/WEB-INF/view/attr/add.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AttrDto ad=new AttrDto();
		
		HttpSession session=request.getSession();
		UserInfo userinfo=(UserInfo) session.getAttribute("session_user");
		ad.setUser_id(userinfo.getUser_id());
		
		String dir_id=request.getParameter("dir_id");
		ad.setDir_id(Integer.parseInt(dir_id));
		
		Collection<Part> parts=request.getParts();
		String path=request.getServletContext().getRealPath("/attr/"+userinfo.getUser_id()+"/"+dir_id+"/");
		
		File folder=new File(path);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		for (Part part : parts) {
			String fileType=part.getContentType();
			String fileName=part.getSubmittedFileName();
			if(fileName!=null) {
				String ext=FilenameUtils.getExtension(fileName);	
				String newFileName=System.currentTimeMillis()+"."+ext;
				long size=part.getSize();
				
				InputStream is=part.getInputStream();
				OutputStream os=new FileOutputStream(path+newFileName);
				
				int len = 0;
				byte b[] = new byte[2048];
				while ((len = is.read(b)) != -1) {
					os.write(b, 0, len);
				}
				//存储数据
				AttrFile attrFile=new AttrFile();
				attrFile.setFile_name(fileName);
				attrFile.setServer_name(newFileName);
				attrFile.setFile_size((int)size);
				attrFile.setFile_type(fileType);;
				
				os.close();
				is.close();
				
				/**
				 * 疏忽大意，必须给attrDto的list中存储数据，否则dao层中无法取得数据
				 * 
				 */
				ad.getList().add(attrFile);
			}
		}
		
		AttrService attrService=new AttrServiceImpl();
		String message="";
		try {
			attrService.add(ad);
			message="上传文件成功";
		} catch (ServiceException e) {
			message=e.getMessage();
		}
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		/*
		 * *犯的错误，路径问题，request.getContextPath()代表wp
		 * 必须写$(function(){})
		 */
		out.write("<script type='text/javascript' src='"+request.getContextPath()+"/resources/hplus/js/jquery.min.js?v=2.1.4'></script>");
		out.write("<script type='text/javascript'  src='"+request.getContextPath()+"/resources/hplus/js/plugins/layer/layer.min.js'></script>");
		out.write("<script type='text/javascript'>");
		out.write("$(function(){layer.msg('"+message+"',function(){window.location.href='"+request.getContextPath()+"/sys/attr/add';});})");
		out.write("</script>");
		
	}
}
