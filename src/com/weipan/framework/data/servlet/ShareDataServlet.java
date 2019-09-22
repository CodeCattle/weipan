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

@WebServlet("/sys/share/data")
public class ShareDataServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataService dataService=new DataServiceImpl();
		List<Map<String, Object>> list=dataService.show();
		
		List<String> nameList=new ArrayList<>();
		List<Integer> numList=new ArrayList<>();
		
		for (Map<String, Object> map : list) {
			nameList.add(map.get("name").toString());
			numList.add(Integer.parseInt(map.get("num").toString()));
		}
		
		Map<String , Object> tempmap=new HashMap<>();
		tempmap.put("nameDatas", nameList);
		tempmap.put("numDatas", numList);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.write(JSONObject.toJSONString(tempmap));
		out.close();
	}

}
