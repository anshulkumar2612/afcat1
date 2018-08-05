<%-- 
    Document   : Registration
    Created on : 18 Jul, 2018, 8:04:13 PM
    Author     : Anshu
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <style>
            
            .form-group.last { margin-bottom:0px; }
        </style>
    </head>
    <body>
        <div>
		<nav class="navbar navbar-inverse navbar-inner navbar-custom navbar-fixed-top  navbar-dark" role="navigation">
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
		    			
                                                <li>
                                                    <a class="margin-width" href="userLogout" style="color: white;"><span class="glyphicon glyphicon-log-out"></span>Logout</a>
                                                </li>
                                        </ul>
                                        
                                        </div>
                                </div>
	    		</div>
			
		</nav>
        </div>
        <%
                                            str="select completed from loginbit;";
                                            ps=con.prepareStatement(str);
                                            rs=ps.executeQuery();
                                            rs.next();
                                            int completed=rs.getInt("completed");
                                            if(completed==1)
                                            {
                                                %>
                                                <center><p class="font-alt  titan-title-size-4" style="letter-spacing: 1px; font-size: 40px; color: red;padding-top: 20%">Already Registered</p></center>

                                                <%response.setHeader("Refresh", "2;url=index.jsp");
                                            }
                                            else
                                            {
        %>
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-7">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <span class="glyphicon glyphicon-list-alt"></span> Afcat Registration</div>
                                <div class="panel-body">
                                    <form action="registerAfcat" class="form-horizontal" role="form" method="post">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            Name:</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="fname" placeholder="First Name" required>
                                            <input type="text" class="form-control" name="lname" placeholder="Last Name" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            Gender:</label>
                                        <div class="col-sm-9" >
                                            <input type="radio" class="checkbox checkbox-inline" name="gender" value="male" required="required">Male
                                            <input type="radio" class="checkbox checkbox-inline" name="gender" value="female" required="required">Female
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            DOB</label>
                                        <div class="col-sm-9">
                                            <input type="date" class="form-control" name="dob" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            Father's Name:</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="faname" placeholder="Father's Name" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            Mother's Name:</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="mname" placeholder="Mother's Name" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            Email:</label>
                                        <div class="col-sm-9">
                                            <input type="Email" class="form-control" name="email" placeholder="Email" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            <strong style="">Education</strong></label>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            <strong style="">10th/SSLC Percentage</strong></label>
                                        <div class="col-sm-9">
                                            <input type="number" class="form-control" name="sslc" placeholder="Percentage" required min="60" max="100" maxlength="2">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            <strong style="">12th/PUC Percentage:</strong></label>
                                        <div class="col-sm-9">
                                            <input type="number" class="form-control" name="puc" placeholder="Percentage" required min="60" max="100" maxlength="2">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            <strong style="">Maximum Qualification:</strong></label>
                                        <div class="col-sm-9">
                                            <select name="qal" required class="form-control">
                                                <option></option>
                                                <option>B.tech</option>
                                                <option>M.tech</option>
                                                <option>MBA</option>
                                                <option>B.Sc</option>
                                                <option>M.Sc</option>
                                                <option></option>
                                        </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            <strong style="">College Name:</strong></label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="clname" placeholder="College's Name" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">
                                            <strong style="">Entries:</strong></label>

                                            <div class="checkbox checkbox-inline">
                                                <label>
                                                    <input type="checkbox" name="entry" value="Pilot(SSC)"/>
                                                    Pilot(SSC)
                                                </label>
                                                <label>
                                                    <input type="checkbox" name="entry" value="Aeronautical Engineer(PC)"/>
                                                    Aeronautical Engineer(PC)
                                                </label>
                                                <label>
                                                    <input type="checkbox" name="entry" value="Logistics(PC)"/>
                                                    Logistics(PC)
                                                </label>
                                            </div>

                                    </div>
                                    <div class="form-group last">
                                        <div class="col-sm-offset-3 col-sm-9">
                                            <button type="submit" class="btn btn-success btn-sm">
                                                Register</button>
                                                 <button type="reset" class="btn btn-default btn-sm">
                                                Reset</button>
                                        </div>
                                    </div>
                                    </form>
                                </div>

                            
                       
                    <%
                String message=(String)session.getAttribute("Message4");
                if(message==null)
                {
                
                }
                else
                {
            %>

            <div style="background-color: red;opacity: 1;color: red;"><p class="panel-footer"><strong><%=session.getAttribute("Message4")%></strong></p></div>
            
            <%
                session.setAttribute("Message4",null);
            
                }
                
            %>
            </div>
             </div>
                    </div>
                </div>
	
                                            <%}}
                                            else
                                            {
                                            response.setHeader("Refresh", "0;url=CandidateLogin.jsp");
                                               %>
}
		      		
                                        <%}%>
	    		
        <img src="images/rafaelbackground.jpg" id="myBackgroundImg"/>
        

    </body>
</html>
