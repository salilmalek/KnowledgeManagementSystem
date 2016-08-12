package com.kms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kms.vo.User;
import com.kms.dao.LoginService;


public class LoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

	 String userName = request.getParameter("userName");	
	 String passwd = request.getParameter("password");
	 LoginService loginService = new LoginService();
	 boolean result = loginService.authenticateUser(userName, passwd);
	 User user = loginService.getUserByuserName(userName);
	 if(result == true){
		 request.getSession().setAttribute("user", user);		
		 response.sendRedirect("jsp/home.jsp");
	 }
	 else{
		 response.sendRedirect("html/error.html");
	 }
}

}