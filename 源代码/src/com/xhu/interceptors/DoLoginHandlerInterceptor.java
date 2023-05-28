package com.xhu.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class DoLoginHandlerInterceptor implements HandlerInterceptor {
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		//System.out.println("MyHandlerInterceptor2 preHandle");
		boolean flag = false;

//		  System.out.println("servletPath:"+request.getServletPath());
//        System.out.println("contextPath:"+request.getContextPath());     //contextPath:/OnlineExamSystem
//        System.out.println("contextPath2:"+request.getServletContext().getContextPath());
//        System.out.println("pageInfo:"+request.getPathInfo());
//        System.out.println("uri:"+request.getRequestURI());
//        System.out.println("url:"+request.getRequestURL());
//        System.out.println("realPath:"+request.getServletContext().getRealPath("/"));
		
		
		String servletPath = request.getServletPath();		  //    servletPath:/login/index
		String requestURI = request.getRequestURI();          //    uri:/OnlineExamSystem/login/index
		String uri = requestURI.substring(requestURI.indexOf("/", 2),requestURI.lastIndexOf("/"));    
		/*
		 * 示例�?   uri.substring(uri.indexOf('/',8)+1)    字符串分�?,从第8个字符开始出现的第一�?"/'的下�?个字符开始截�?
		 */
		
		System.out.println("uri: "+uri);      //   uri:/login    静�?�资源（css、image等）也会发请�?
		
		/*  if(a.startsWith(b))
			判断字符串a 是不是以字符串b�?�?.
			if(a.endsWith(b))
			判断字符串a 是不是以字符串b结尾.
		 */     
		
		 if(uri.startsWith("/login")){  //以login�?头的请求放行
			 return true;
		 }
		
		 
		 //不拦截的静�?�资源路径（不能与jsp请求路径名字冲突？）
         final String[] PRE_UNIGNORE_URI={
        		 "/log/",
        		 "/lib/",
        		 "/lib/",
         };
       //前台拦截
       //跳转指定资源而未登录�?
     	 for (String preURI : PRE_UNIGNORE_URI) {
     		 //设定前台�?要拦截登录的相反结果�?
             if(requestURI.contains(preURI)){     //requestURI中是否包含preURI
             	//System.out.println("已拦截的页面******************"+preURI);
             	 return true;
             }
     	}
		 
		String  username = (String) request.getSession().getAttribute("username");
		//System.out.println(username);

		 
	    if(username == null){
	        response.setCharacterEncoding("UTF-8");
	        request.getRequestDispatcher("/login/index").forward(request, response);;
	        return false;
	    }else
	        return true;
//		if(username==null){
//			System.out.println("1111111111111");
//			String loginUrl = "/WEB-INF/login.jsp"; 
//		    request.getRequestDispatcher(loginUrl).forward(request, response);
//			return false;
//		}
//		
//		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3)
			throws Exception {
		System.out.println("MyHandlerInterceptor2 postHandle");

	}
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}
}
