package com.weipan.commons.fileter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class session implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
			HttpServletRequest request=(HttpServletRequest)req;
			HttpServletResponse response=(HttpServletResponse)resp;
			
			String path=request.getRequestURI();
			//排除路径
			if(path.endsWith("/sys/login") || path.endsWith("sys/user/regist")) {
				chain.doFilter(req, resp);
			}else {
				HttpSession session=request.getSession();
				if(session.getAttribute("session_user")==null) {
					response.sendRedirect(request.getContextPath()+"/sys/login");
				}else {
					chain.doFilter(req, resp);
				}
			}
			
			
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
