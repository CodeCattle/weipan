package com.weipan.framework.data.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.weipan.framework.attr.vo.AttrFile;
import com.weipan.framework.data.service.DataService;
import com.weipan.framework.data.service.DataServiceImpl;

@WebServlet("/sys/file/data/list")
public class FileDataListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dirName =request.getParameter("dirName");
		DataService dataService=new DataServiceImpl();
		List<Object> list=dataService.fileList(dirName);
		
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.write(JSONObject.toJSONString(list));
		out.close();
	}

}
