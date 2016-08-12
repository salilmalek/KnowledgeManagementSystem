package com.kms.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.output.*;

import com.kms.vo.Post;
import com.kms.dao.DocumentService;

public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletFileUpload uploader = null;

	public void init() {
		DiskFileItemFactory fileFactory = new DiskFileItemFactory();
		File filesDir = (File) getServletContext().getAttribute(
				"FILES_DIR_FILE");
		fileFactory.setRepository(filesDir);
		this.uploader = new ServletFileUpload(fileFactory);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		
		if (!ServletFileUpload.isMultipartContent(request)) {
			 request.getSession().setAttribute("msg",
					 "Error: Content type is not multipart/form-data");
				response.sendRedirect("jsp/upload.jsp");
					
		}


		PrintWriter out = response.getWriter();
		try {
			System.out.println("1");
			List<FileItem> fileItemsList = uploader.parseRequest(request);
			System.out.println("2");
			Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();

			String userName =fileItemsList.get(0).getString();
			String postType = fileItemsList.get(1).getString();
			String postTitle =  fileItemsList.get(2).getString();
			String domain = fileItemsList.get(3).getString();
			String postDescr =  fileItemsList.get(4).getString();
			
		//	System.out.println(postLoc);
			
				FileItem fileItem = fileItemsList.get(5);
				System.out.println("5");
			if(fileItem.getName().equals(null) || fileItem.getName().equals("")){
				
					 request.getSession().setAttribute("msg",
								"Error: No File Uploaded. Please Select File");
					response.sendRedirect("jsp/upload.jsp");
				
			}
			else{
			
			System.out.println("FieldName=" + fileItem.getFieldName());
				System.out.println("FileName=" + fileItem.getName());
				System.out.println("ContentType=" + fileItem.getContentType());
				System.out.println("Size in bytes=" + fileItem.getSize());
				System.out.println("6");
				File file = new File(request.getServletContext().getAttribute(
						"FILES_DIR")
						+userName);
				if(!file.exists()) file.mkdirs();
				file = new File(request.getServletContext().getAttribute(
						"FILES_DIR")
						+userName+File.separator+ fileItem.getName());
		    	System.out.println("File Directory created to be used for storing files");
		    	
				System.out.println("Absolute Path at server="
						+ file.getAbsolutePath());
				fileItem.write(file);
				String postLoc=userName+File.separator+ fileItem.getName();

				Post post = new Post(userName, postType, postTitle, domain, postDescr,
						postLoc);

				DocumentService documentService = new DocumentService();
				boolean result = documentService.load(post);
				if (result) {
					request.getSession().setAttribute("msg",
							"File Successfully uploaded");
					response.sendRedirect("jsp/upload.jsp");
				} else {
					  request.getSession().setAttribute("msg",
								"Error: No File Uploaded. Database Connection Problem.");
					response.sendRedirect("jsp/upload.jsp");
				}
			}

			
		} catch (FileUploadException e) {
			System.out.println(e);
		} catch (Exception e) {
			System.out.println(e);
		}	     
	}

}