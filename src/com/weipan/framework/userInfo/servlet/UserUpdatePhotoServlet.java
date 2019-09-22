package com.weipan.framework.userInfo.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.eclipse.jdt.internal.compiler.lookup.IQualifiedTypeResolutionListener;

import com.weipan.commons.exception.ServiceException;
import com.weipan.framework.userInfo.service.UserService;
import com.weipan.framework.userInfo.service.UserServiceImpl;
import com.weipan.framework.userInfo.vo.UserInfo;

@WebServlet("/sys/update/photo")
public class UserUpdatePhotoServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		UserInfo ui=(UserInfo) session.getAttribute("session_user");
		
		UserService userService=new UserServiceImpl();
		String photo=userService.getPhoto(String.valueOf(ui.getUser_id()));
		request.setAttribute("photo", photo);
		
		request.getRequestDispatcher("/WEB-INF/view/user/updatePhoto.jsp").forward(request, response);;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		UserInfo ui=(UserInfo) session.getAttribute("session_user");
		
		UserService userService=new UserServiceImpl();
		
		//1.创建路径
		String path=request.getServletContext().getRealPath("/attr/");
		
		//2.建立磁盘工厂
		DiskFileItemFactory factory =new DiskFileItemFactory();
		//3.获取ServletFileUpload的对象
		ServletFileUpload servletFileUpload =new ServletFileUpload(factory);
		try {
			//4.解析请求
			List<FileItem> fileItemList=servletFileUpload.parseRequest(request);
			for (FileItem fileItem : fileItemList) {
				//5.判断控件类型
				if(!fileItem.isFormField()) {//只是处理文件
					String fileName=fileItem.getName();
					String ext=FilenameUtils.getExtension(fileName);
					String newFileName=System.currentTimeMillis()+"."+ext;
					//构建输入流
					InputStream is=fileItem.getInputStream();
					//构建输出流
					OutputStream os=new FileOutputStream(path+newFileName);
					IOUtils.copy(is, os);
					userService.updatePhoto(ui.getUser_id(), newFileName);
				}
			}
			request.setAttribute("message", "更新个人头像成功");
		} catch (FileUploadException | ServiceException e) {
			e.printStackTrace();
			request.setAttribute("message", e.getMessage());
		}
		request.getRequestDispatcher("/WEB-INF/view/tip.jsp").forward(request, response);
	}

}
