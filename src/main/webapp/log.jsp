<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
 <%

 Connection connect = null;
 Statement stmt = null;
 ResultSet rs = null;
 String ID=(String)session.getAttribute("ID");
 

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/first","root","anuj3107");
	stmt=connect.createStatement();
	String sql="select Name,CPI,Resume from candidate where Candidate_ID=?";
	PreparedStatement pst=connect.prepareStatement(sql);
    pst.setString(1,ID);
	rs=pst.executeQuery();
	while(rs.next())
	{
 %> 
    
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="icon" href="images/logo.png" type="image/gif" sizes="20x20">
    <title>Dashboard</title>
      
      <link rel="stylesheet" href="css/afterloginstyle.css">
      <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
      <link rel="stylesheet" href="fonts/icomoon/style.css">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <script type="text/javascript">
        window.history.forward();
        function noBack() {
            window.history.forward();
        }
        </script>
  </head>
  <body>
    <!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
  <div class="container">
     <a class="navbar-brand" href="#">
          <img src="images/logo.jpg" height="70px" width="70px" style="border-radius:50%;">
        </a>
        <h3 style="color:white;">Logged In as: <%= ID %></h3>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto"> 
        <li class="nav-item">
          <a class="nav-link" href="logout.jsp">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Page Content -->

    
        <div class="card">
            <form  class="box">
            <pre>
                <h1 style="color:white;">Name:  <%= rs.getString(1) %></h1>
                <h1 style="color:white;">ID: <%= ID %></h1>
                <h1 style="color:white;">CPI: <%= rs.getString(2) %></h1> 
                <% if(rs.getString(3)!=null){ %>
                <h1 style="color:white;">Resume Link:<a href="<%= rs.getString(3) %>" target="_blank">Link</a></h1>  
                <%}else{%>
                <h1 style="color:white;">Resume Link: Not Uploaded</h1>
                <%} %>
            </pre>
            </form>
            
            
        </div>
    

<nav class="navbar navbar-expand-lg  static-top" style=" text-align:center; margin-top:475px; margin-bottom:5px; background:#2b5876;">
<div class="container">
<div class="row">
             <div class="col-lg-12">
             <form action="formupload" method="post" style=" font-family:'Lato', Arial, sans-serif;">
             <br>
             <hr>
             <h2 style="text-align:center; color:white;">Upload Resume</h2><br><br>
             <label style="color:white;">Enter Resume link:</label><input type="text" accept="application/pdf" name="resume">&nbsp&nbsp&nbsp
             <label style="color:white;">Enter Password:</label><input type="password" name="password"><br><br>
                <input type="submit" value="Upload" class="btn btn-dark">
             </form>
             </div>
             
             <div class="col-lg-12">
             <form action="fetch" method="post" name="form1" style="font-family:'Lato', Arial, sans-serif;">
             <br>
             <hr>
             <h2 style="text-align:center; color: white;">Enter your CPI and ID to fetch companies</h2><br><br>
             <label style="color:white">Enter CPI:</label> <input type="text" name="cpi"><br><br>
             <label style="color:white">Enter ID:</label> <input type="text" name="ID"><br><br>
                    <input type="submit" value="Fetch" class="btn btn-dark">
             <br>
             <hr>
             </form>
             </div>
</div>
</div>
</nav>   

<div class="footer" id="footers">
      <div class="container">
        <div class="row">
          <div class="col-lg-3">
            <p class="mb-4"><img src="images/logo.png" alt="Image" class="img-fluid" width="100px" height="100px"><br><strong>IIIT Vadodara</strong></p>

          </div>
          <div class="col-lg-6">
            <h3 class="footer-heading"><span>Contact</span></h3>
            <p><strong>Email:</strong>
              <a href="placement@iiitvadodara.ac.in" target="_blank"></a>placement@iiitvadodara.ac.in<br><strong>Address: </strong>c/o Block No.9, Government Engineering College, Sector-28, Gandhinagar, Gujarat - 382028</p>
            <a href="https://www.google.com/maps/place/Indian+Institute+of+Information+Technology+Vadodara+(Gandhinagar+Campus)/@23.2588279,72.6481031,16.75z/data=!4m5!3m4!1s0x395c2c777c4b5e63:0xf2af0643c7186398!8m2!3d23.2591039!4d72.6504058" target="_blank">See on Google Map</a>
            <br>
            <div class="ml-auto">
            <div class="social-wrap">
              <br>
             <p>FOLLOW US ON</p>
              <a href="https://www.facebook.com/iiitvadodara.ac.in" target="_blank"><span class="icon-facebook"></span></a> &nbsp &nbsp &nbsp &nbsp
              <a href="https://www.youtube.com/channel/UCunsVCRB_ihuQQwmFURrUpQ" target="_blank"><span class="icon-youtube"></span></a>&nbsp &nbsp &nbsp &nbsp
              <a href="https://www.linkedin.com/school/iiitvadodara/" target="_blank"><span class="icon-linkedin"></span></a>
            </div>
          </div>
          </div>
          <div class="col-lg-3">
            <h3 class="footer-heading"><span>Links</span></h3>
            <a href="about.html">Home</a><br>
            <a href="http://iiitvadodara.ac.in/" target="_blank">Institute Site</a><br>
            <a href=""></a>
          </div>
        </div>


      </div>
    </div>
          
</body>
</html>            
<!-- /.container -->


<%
	}
    }
	catch(Exception e)
	{
		out.println(e);
	}
	
%>

