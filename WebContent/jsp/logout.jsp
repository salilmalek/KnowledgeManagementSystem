<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="/KnowledgeManagementSystem/css/Site.css" rel="stylesheet" type="text/css" />
<title>Welcome to KMS || Logout</title>
 <script src="/KnowledgeManagementSystem/engine/jquery.js"></script> 

</head>
<body>
<div class="page">
       
        <div class="header">
            <div class="preLoginTitle">
                Knowledge Management System
            </div>
        </div>
        <div style="clear: both;">
            <div class="sidebar">
                <div class="profileImg">
                    <img ID="ProfileImage" Width="125px" src="https://pbs.twimg.com/profile_images/234905619/logo.gif" />
                </div>
                <div style="text-align: center;">
                     <a href="/KnowledgeManagementSystem/html/login.html">Login Here! </a>
                </div>
                <div>
                    <h2 style="text-align: center; font-family: Tunga; font-size: large; padding-bottom: 0px; margin-bottom: 0px;">
                        <fieldset>
                            News
                        </fieldset>
                    </h2>
                    <fieldset>
                        <marquee direction="up" scrolldelay="200" style="height: 150px;">
                            <ul style="list-style:none;">
                                <li><a style="text-decoration:none; color:#003366;" href="#">Placements are on 21st April 2016.</a></li>
                                <li><a style="text-decoration:none; color:#003366;" href="#">Capston compitition date is 25th April 2016.</a></li>
                                <li><a style="text-decoration:none; color:#003366;" href="#">...</a></li>                    
                            </ul>
                        </marquee>
                    </fieldset>
                </div>
            </div>
            <div class="content">
                <div id="includedContent">
	 <%		
		 session.removeAttribute("userName");
		 session.removeAttribute("passwd");
		 session.invalidate();
	 %>
<center>
	 <h1>You have successfully logged out</h1>
	 To login again <a href="../html/login.html">click here</a>.
</center>
</div>
            </div>
        </div>
        <div style="clear: both;">
            <div class="footer">
                <h3>
                    Northwestern Polytechnic University, Fremont.</h3>
                <span>Developing for NPU </span>
                <div class="copyrightDiv">
                    <span>Copyright &copy 2016. NPU, Fremont.</span>
                </div>
            </div>
        </div>
        </form>
    </div>
</body>
</html>
