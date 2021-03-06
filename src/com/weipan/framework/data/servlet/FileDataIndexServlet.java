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

@WebServlet("/sys/file/data/index")
public class FileDataIndexServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/data/file_data.jsp").forward(request, response);
	}

}
