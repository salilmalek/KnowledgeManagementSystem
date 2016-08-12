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
							<li class="active"><a
								href="/KnowledgeManagementSystem/jsp/home.jsp">Home</a></li>
							<li><a href="/KnowledgeManagementSystem/jsp/upload.jsp">Upload</a></li>
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
						response.sendRedirect("/KnowledgeManagementSystem/html/login.html");
					} else {
						User user = (User) session.getAttribute("user");
				%>
				<fieldset>
					<legend>
						<b>Welcome <%=user.getUserName()%></b>
					</legend>
					<%
						String formErrors = (String) request.getSession().getAttribute(
									"msg");
					%>

					<%
						if (formErrors != null && !formErrors.equals("")) {
					%>
					<ul>
						<font size="2" color="red" face="Arial, Helvetica, sans-serif">
							<%=request.getSession().getAttribute("msg")%></font>
					</ul>
					<%
						request.getSession().removeAttribute("msg");
							}
					%>
					<table class="table table-striped">
						<thead>
							<tr>
								<th colspan="6"><center>Your Uploads</center></th>
							</tr>

							<tr>
								<th>Title</th>
								<th>Domain</th>
								<th>Description</th>
								<th>Type</th>
								<th>Download Link</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
							<%
								DocumentService documentService = new DocumentService();
									List<Post> list = documentService.getListOfPostsByUserName(user
											.getUserName());
									for (Post u : list) {
							%>
							<tr>
								<td><%=u.getPostTitle()%></td>
								<td><%=u.getDomain()%></td>
								<td><%=u.getPostDescr()%></td>
								<td><%=u.getPostType()%></td>
								<%
									String postLoc = u.getPostLoc();
									postLoc=postLoc.replace(" ", "+");
								%>
								<td><a href=/KnowledgeManagementSystem/download?fileName=<%=postLoc%>>Download</a></td>
								<td><a href=/KnowledgeManagementSystem/delete?fileName=<%=u.getPostId()%>>Delete</a></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
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