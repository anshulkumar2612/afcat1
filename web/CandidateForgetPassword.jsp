<%-- 
    Document   : CandidateForgetPassword
    Created on : 18 Jul, 2018, 1:29:28 AM
    Author     : Anshu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>INDIAN AIRFORCE</title>
        <link rel="icon" type="image/png" sizes="16x16"
         href="images/iaf-logo.png">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="CSS/navbar.css">
        <script>
            function check()
            {
                a=document.getElementById("pwd").value;
                b=document.getElementById("rpwd").value;
                
                if(a!=b)
                    {
                        alert("Re-Type Passwords Doesn't Match");
                        return false;
                    }
                    else
                        {
                            return true;
                        }
            }
            
        </script>
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

                                            while(rs.next())
                                            {
                                                x=rs.getRow();
                                                uid=rs.getInt("uid");
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
        
        <div id="mydiv" class="login-form" style="opacity: 0.7;">
            <form action="userSetPassword" method="post" onsubmit="return check()">
                <h2 class="text-center" style="color: cadetblue;">Set New Password</h2>       
                <div class="form-group">
                    <input type="text" name="username" class="form-control" placeholder="Enter Username" required="required" >
                </div>
                <div class="form-group">
                    <input type="password" id="pwd" name="password" class="form-control" placeholder="Enter New Password" required="required" >
                </div>
                <div class="form-group">
                    <input type="password" id="rpwd" name="retypepassword" class="form-control" placeholder="Re-Type New Password" required="required" >
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block" >Submit</button>
                </div>
                <div class="clearfix">
                    <p class="pull-left checkbox-inline"><a href="CandidateLogin.jsp">Login</a></p>
                    <a href="CandidateSignup.jsp" class="pull-right">Sign Up</a>
                </div>        
            </form>
            <%
                String message=(String)session.getAttribute("Message3");
                if(message==null)
                {
                
                }
                else if("Password Changed Successfully".equalsIgnoreCase(message))
                {
                    
            %>
                <div style="background-color: green;color: white;"><p class="text-center">Password Changed Successfully</p></div>
            <%  session.setAttribute("Message3",null);
                response.setHeader("Refresh", "3;url=CandidateLogin.jsp");
                }
                else
                {
            %>

            <div style="background-color: red;color: white;"><p class="text-center"><%=session.getAttribute("Message3")%></p></div>
            
            <%
                session.setAttribute("Message3",null);
            
                }
                
            %>
            
        </div>
        
    </body>
</html>
