
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
--> 
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>INDIAN AIRFORCE</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" type="image/png" sizes="16x16"
         href="images/iaf-logo.png">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="CSS/navbar.css">
        

</head>
<body>
    
	<div>
		<nav class="navbar navbar-inverse navbar-inner navbar-custom navbar-fixed-top navbar-transparent navbar-dark" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#custom-collapse">
						<span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>           
				    </button>
				    <a class="navbar-brand" style="padding-top: 10px; font-size: 22px; font-weight: bold;" href="#">
				    	<img style="display: inline; margin-bottom: 0px;" alt="IAF" src="images/rsz_1iaf-logo.png">
				    	<span style="color: white;" class="tx">INDIAN AIRFORCE</span>
				    	<span style="color: orange;" class="tx">/</span>
					<span style="color: white;" class="tx">/</span>
					<span style="color: green;" class="tx">/</span>
					<span style="color: white;" class="tx">भारतीय वायु सेना</span>
                                    </a>
				</div>
				<div class="collapse navbar-collapse" id="custom-collapse">
					<div style="float: left; text-align: left; padding-top: 10px;">
		    			<ul class="nav navbar-nav">
		        			<li class="active"><a href="index.jsp">Home</a></li>
		        			<li class="dropdown">
		          				<a class="dropdown-toggle margin-width" data-toggle="dropdown" href="#" style="color: white;">About
		          				<span class="caret"></span></a>
		          				<ul class="dropdown-menu">
		            				<li><a href="#">Page 1-1</a></li>
		            				<li><a href="#">Page 1-2</a></li>
		            				<li><a href="#">Page 1-3</a></li>
		          				</ul>
		        			</li>
		        			<li class="dropdown">
		        				<a class="dropdown-toggle margin-width" data-toggle="dropdown" href="#" style="color: white;">Life In IAF
		        				<span class="caret"></span></a>
		          				<ul class="dropdown-menu">
		            				<li><a href="#">Page 1-1</a></li>
		            				<li><a href="#">Page 1-2</a></li>
		            				<li><a href="#">Page 1-3</a></li>
		          				</ul>
		        			</li>
		        			<li><a href="#" style="color: white;">Training</a></li>
		        			<li class="dropdown">
		        				<a class="dropdown-toggle margin-width" data-toggle="dropdown" href="#" style="color: white;">Pay & Benefits
		        				<span class="caret"></span></a>
		          				<ul class="dropdown-menu">
		            				<li><a href="#">Page 1-1</a></li>
		            				<li><a href="#">Page 1-2</a></li>
		            				<li><a href="#">Page 1-3</a></li>
		          				</ul>
		        			</li>
		        			<li><a href="#" style="color: white;">Contact Us</a></li>
		      			</ul>
                                            
                                            <%

                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/afcat", "root", "");

                                            String str="select * from loginbit;";

                                            PreparedStatement ps=con.prepareStatement(str);


                                            ResultSet rs=ps.executeQuery();

                                            int x=0;
                                            int uid=0;
                                            int completed=0;

                                            while(rs.next())
                                            {
                                                x=rs.getRow();
                                                uid=rs.getInt("uid");
                                                completed=rs.getInt("completed");
                                            }
                                            if(x==1)
                                            {
                                                String str1="select * from login where id=?";
                                                ps=con.prepareStatement(str1);
                                                ps.setInt(1, uid);
                                                rs=ps.executeQuery();
                                                rs.next();
                                            %>
                                        <ul class="nav navbar-nav navbar-right">
		        			<li>
                                                    <a href="#" style="color: white;"><span class="glyphicon glyphicon-log-in"></span> Welcome <%=rs.getString("uname")%></a>
                                                </li>
                                                <li>
                                                    <a class="margin-width" href="Registration.jsp"><img style="height: 20px;" src="images/applyOnline.png"></a>
                                                </li>
		    			
                                                <li>
                                                    <a class="margin-width" href="userLogout" style="color: white;"><span class="glyphicon glyphicon-log-out"></span>Logout</a>
                                                </li>
                                        </ul>
                                            <%}
                                            else
                                            {
                                               %>
}
		      			<ul class="nav navbar-nav navbar-right">
		        			<li>
                                                    <a href="CandidateLogin.jsp" style="color: white;"><span class="glyphicon glyphicon-log-in"></span> Candidate Login</a>
                                                </li>
                                                <li>
                                                    <a class="margin-width" href="Registration.jsp"><img style="height: 20px;" src="images/applyOnline.png"></a>
                                                </li>
		    			</ul>
                                        <%}%>
	    			</div>
	    		</div>
			</div>
		</nav>
	</div>

        <img src="images/rafaelbackground.jpg" id="myBackgroundImg"/>

	<div><video autoplay loop id="myVideo" onclick="playVid()">
		<source src="images/Rafale Fighter In Action.mp4" type="video/mp4">
	<script>
	function playVid()
	{
		document.getElementById('myVideo').play();
	} 
	 </script>
	</video>
	</div>
	
        <marquee class="footer" onmouseover="this.stop();" onmouseout="this.start();">
            <h3 style="color: white;font-weight: bold;"> Registration for AFCAT 02/2018 is still open. <span style="color: red;">Last Date-15 July 2018</span> Please hurry and submit online application form. </h3>
    	</marquee>
        
    <div id="mydiv">
    	<div>
            <%if(completed==1){ %>
            <div class="font-alt  titan-title-size-4" style="letter-spacing: 1px; font-size: 20px; color: greenyellow;">Registration Successful
            </div>
            <%}%>
            <img alt="" src="images/2.png">
            <div class="font-alt  titan-title-size-4" style="letter-spacing: 1px; font-size: 40px; color: white;">Indian Air Force
            </div>
            <div class="font-alt mb-30 titan-title-size-3">
                <h1 style="letter-spacing: 1px; font-size: 40px; color: white;">भारतीय वायु सेना
                </h1>
            </div>
            <div>
                <a class="margin-width" href="Registration.jsp"><img style="height: 45px;" src="images/applyOnline.png">
                </a>
      		</div>
    	</div>
    </div>
</body> 


</html>
