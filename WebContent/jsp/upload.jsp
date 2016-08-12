<%@page import="java.util.List"%>
<%@page import="com.kms.dao.DocumentService"%>
<%@page import="com.kms.dao.LoginService"%>
<%@page import="java.util.Date"%>
<%@page import="com.kms.vo.Post"%>
<%@page import="com.kms.vo.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link href="/KnowledgeManagementSystem/css/Site.css" rel="stylesheet"
	type="text/css" />
<style>
input {
	color: black;
}

label {
	padding-top: 5px;
	color: black;
}

.container {
	width: 600px;
	height: 300px;
	padding: 15px;
	color: white;
	padding-top: 25px;
	padding-bottom: 25px;
	max-width: 100%;
	display: block;
	padding: 15px;
}

.row {
	padding-top: 2px;
}
</style>

<title>Welcome to KMS || Home</title>
</head>
<body>
	<div class="page">

		<div class="header">
			<div class="preLoginTitle">Knowledge Management System</div>
			<nav class="navbar navbar-default">
				<div class="container-fluid">

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li><a href="/KnowledgeManagementSystem/jsp/home.jsp">Home</a></li>
							<li class="active"><a
								href="/KnowledgeManagementSystem/jsp/upload.jsp">Upload</a></li>
							<li><a href="/KnowledgeManagementSystem/jsp/download.jsp">Download</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Setting <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a
										href="/KnowledgeManagementSystem/jsp/changePassword.jsp">Change
											Password</a></li>
									<li><a
										href="/KnowledgeManagementSystem/jsp/UpdateProfile.jsp">Update
											Profile</a></li>
								</ul></li>
						</ul>

						<ul class="nav navbar-nav navbar-right">
							<li><a href="/KnowledgeManagementSystem/jsp/logout.jsp">Logout</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<div style="clear: both;">
			<div class="sidebar">
				<div class="profileImg">
					<img ID="ProfileImage" Width="125px"
						src="https://pbs.twimg.com/profile_images/234905619/logo.gif" />
				</div>
				<div style="text-align: center;">
					<a href="/KnowledgeManagementSystem/jsp/logout.jsp">Logout
						Here! </a>
				</div>
				<div>
					<fieldset>
						<h2
							style="text-align: center; font-family: Tunga; font-size: large; padding-bottom: 0px; margin-bottom: 0px;">
							News</h2>
					</fieldset>
					<fieldset>
						<marquee direction="up" scrolldelay="200" style="height: 150px;">
							<ul style="list-style: none;">
								<li><a style="text-decoration: none; color: #003366;"
									href="#">Placements are on 21st April 2016.</a></li>
								<li><a style="text-decoration: none; color: #003366;"
									href="#">Capston compitition date is 25th April 2016.</a></li>
								<li><a style="text-decoration: none; color: #003366;"
									href="#">...</a></li>
							</ul>
						</marquee>
					</fieldset>
				</div>
			</div>
		</div>
		<div class="content">
			<div id="includedContent">
				<%
					if (null == session.getAttribute("user")) {
						response.sendRedirect("/KnowledgeManagementSystem/jsp/logout.jsp");
					} else {
						User user = (User) session.getAttribute("user");
				%>
				<fieldset>
					<legend>
						<b>Welcome <%=user.getUserName()%></b>
					</legend>
					<div class="container" style="background-color: #fff;">
						<form action="/KnowledgeManagementSystem/upload" method="POST" enctype="multipart/form-data">
							<input type="hidden" name="userName"
								value=<%=user.getUserName()%>>
							<% 
String formErrors = (String) request.getSession().getAttribute("msg");
%>

							<%if (formErrors != null && !formErrors.equals("")){%>
							<ul>
								<font size="2" color="red" face="Arial, Helvetica, sans-serif">
									<%=request.getSession().getAttribute("msg")%></font>
							</ul>
							<%
								request.getSession().removeAttribute("msg");
								}
							%>
							
							<div class="row">
								<div class="col-sm-4">
									<label>Document&nbsp;Type:&nbsp;*</label>
								</div>
								<div class="col-sm-8">
									<select name="postType" id="postType" class="form-control">
										<option value="pdf">PDF</option>
										<option value="ppt">PPT</option>
										<option value="doc">DOC</option>
										<option value="jpg">JPG</option>
									</select>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-4">
									<label> Title:&nbsp;*</label>
								</div>
								<div class="col-sm-8">
									<input type="text" id="postTitle" name="postTitle"
										class="form-control" required />
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-4">
									<label> Course:&nbsp;*</label>
								</div>
								<div class="col-sm-8">
									<select name="domain" id="domain" class="form-control">
										<option value="java">Java</option>
										<option value="database">Database</option>
										<option value="webfront">WebFront</option>
										<option value="networking">Networking</option>
									</select>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-4">
									<label> Description:</label>
								</div>
								<div class="col-sm-8">
									<textarea id="postDescr" name="postDescr" class="form-control"> Enter Description here...</textarea>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-4">
									<label> Attachment:&nbsp;*</label>
								</div>
								<div class="col-sm-8">
									<input id="postLoc" name="postLoc" type="file"
										class="form-control" /> Browse

								</div>
							</div>
							<div class="row">
								<div class="col-sm-4"></div>
								<div class="col-sm-8">
									<input type="submit" value="Upload" class="form-control" />
								</div>
							</div>
						</form>
					</div>

				</fieldset>
				<%
					}
				%>

			</div>
		</div>
	</div>
	<div style="clear: both;">
		<div class="footer">
			<h3>Northwestern Polytechnic University, Fremont.</h3>
			<span>Developing for NPU </span>
			<div class="copyrightDiv">
				<span>Copyright &copy 2016. NPU, Fremont.</span>
			</div>
		</div>
	</div>

</body>
</html>