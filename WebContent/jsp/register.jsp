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
<link href="/KnowledgeManagementSystem/css/SiteBeforeLogin.css" rel="stylesheet"
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

<title>Welcome to KMS || Register</title>
</head>
<body>
	<div class="page">

		<div class="header">
			<div class="preLoginTitle">Knowledge Management System</div>
		</div>
		<div style="clear: both;">
			<div class="sidebar">
				<div class="profileImg">
					<img ID="ProfileImage" Width="125px"
						src="https://pbs.twimg.com/profile_images/234905619/logo.gif" />
				</div>
				<div style="text-align: center;">
				 <a href="/KnowledgeManagementSystem/html/login.html">Login Here! </a>
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

			<div class="content">
				<div id="includedContent">

					<fieldset>
						<legend>Register:</legend>
						<div class="container" style="background-color: #fff;">
							<form action="/KnowledgeManagementSystem/register" method="post">
								<div class="row">
									<div class="col-sm-4">
										<label>User&nbsp;Name:&nbsp;*</label>
									</div>
									<div class="col-sm-8">
										<input type="text" id="userName" name="userName"
											class="form-control" required />
									</div>
								</div>

								<div class="row">
									<div class="col-sm-4">
										<label> Password:&nbsp;*</label>
									</div>
									<div class="col-sm-8">
										<input type="password" id="password" name="password"
											class="form-control" required />
									</div>
								</div>
								<div class="row">
									<div class="col-sm-4">
										<label> Usertype:&nbsp;*</label>
									</div>
									<div class="col-sm-8">
										<select name="userType" id="userType" class="form-control">
											<option value="student">Student</option>
											<option value="staff">Staff</option>
										</select>
									</div>
								</div>

								<div class="row">
									<div class="col-sm-4"></div>
										<div class="col-sm-4">
									
										<input class="form-control" type="submit" value="Register"
											id="btnRegister" />
											</div>
										<div class="col-sm-4"> <input class="form-control" id="reset"
											type="reset" />
									</div>
								</div>
							</form>
						</div>
					</fieldset>
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
	</div>
</body>
</html>
