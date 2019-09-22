package com.weipan.framework.teacherFileManger;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.InputBuffer;
import org.apache.commons.io.IOUtils;
import org.apache.coyote.http11.filters.BufferedInputFilter;

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
import com.weipan.framework.userInfo.vo.UserInfo;
import com.weipan.framework.userType.service.TypeService;
import com.weipan.framework.userType.service.TypeServiceImpl;


@WebServlet({"/sys/file/download","/share/download"})
public class FileDownloadServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		AttrService attrService=new AttrServiceImpl();
		AttrFile attrFile =attrService.load(id);
		String path=request.getServletContext().getRealPath("/attr/"+attrFile.getUser_id()+"/"+attrFile.getDir_id()+"/"+attrFile.getServer_name());
		System.out.println(path);
		File file=new File(path);
		
		if(file.exists()) {
		   response.setContentType("multipart/form-data");
		   String fileName =new String(attrFile.getFile_name().getBytes("UTF-8"),("ISO8859-1"));
		   response.setHeader("content-disposition", "attachment;filename="+fileName);

		   
		   InputStream is=new BufferedInputStream(new FileInputStream(file));
		   OutputStream os=new BufferedOutputStream(response.getOutputStream());
		   IOUtils.copy(is, os);
		   is.close();
		   os.close();
		   
		   attrService.updateDownloadCount(id);
		 
		}else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write("<script type='text/javascript' src='"+request.getContextPath()+"/resources/hplus/js/jquery.min.js?v=2.1.4'></script>");
			out.write("<script type='text/javascript'  src='"+request.getContextPath()+"/resources/hplus/js/plugins/layer/layer.min.js'></script>");
			out.write("<script type='text/javascript'>");
			out.write("$(function(){layer.msg('该文件已经消失啦！');})");
			out.write("</script>");
		}
	}
}
