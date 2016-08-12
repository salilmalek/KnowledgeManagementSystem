package com.kms.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kms.vo.User;
import com.kms.dao.RegisterService;


public class RegisterServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	 response.setContentType("text/html;charset=UTF-8");
	
	 String userName = request.getParameter("userName");	
	 String passwd = request.getParameter("password");
	 String userType = request.getParameter("userType");
	 
	 User user = new User(userName,passwd,userType);			
	
		 RegisterService registerService = new RegisterService();
		 boolean result = registerService.register(user);		
		 if(result){
			 response.sendRedirect("html/successRegister.html");
		 }else{
			 response.sendRedirect("html/errorRegister.html");
		 }
		
	 
}

}