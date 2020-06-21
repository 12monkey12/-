package com.yc.springblog.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/message.jsp")
public class Filter3 implements Filter{

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		
		if ( request.getSession().getAttribute("user") == null ) {
			//用户没有登录，重定向到主页面
			response.sendRedirect("index.jsp");
			//out.print("<script>location.href = '../index.jsp'</script>");
		} else {
			chain.doFilter(request, response);
		}
	}
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter3..........................................");
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}

}
