package com.kms.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.kms.dao.DocumentService;

public class DeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String fileName = request.getParameter("fileName");
		System.out.println(fileName);
		if (fileName == null || fileName.equals("")) {
			request.getSession()
					.setAttribute("msg",
							"Error: No File deleted. File Name can't be null or empty");
			response.sendRedirect("jsp/home.jsp");
			

		} else {
		/*	File file = new File(request.getServletContext().getAttribute(
					"FILES_DIR")
					+ File.separator + fileName);
			if (!file.exists()) {
				request.getSession()
						.setAttribute("msg",
								"Error: No File deleted. File doesn't exists on server.");
				response.sendRedirect("jsp/home.jsp");
				
			} else {
				System.out.println("File location on server::"
						+ file.getAbsolutePath());
				ServletContext ctx = getServletContext();
				InputStream fis = new FileInputStream(file);
				String mimeType = ctx.getMimeType(file.getAbsolutePath());
				response.setContentType(mimeType != null ? mimeType
						: "application/octet-stream");
				response.setContentLength((int) file.length());
				response.setHeader("Content-Disposition",
						"attachment; filename=\"" + fileName + "\"");

				ServletOutputStream os = response.getOutputStream();
				byte[] bufferData = new byte[1024];
				int read = 0;
				while ((read = fis.read(bufferData)) != -1) {
					os.write(bufferData, 0, read);
				}
				os.flush();
				os.close();
				fis.close();*/
			DocumentService documentService= new DocumentService();
			int result=documentService.deletePostByPostLoc(fileName);
			
				System.out.println("File deleted successfully  : " +result);
				request.getSession().setAttribute("msg",
						"");
				response.sendRedirect("jsp/home.jsp");
	//		}
		}
	}

}
