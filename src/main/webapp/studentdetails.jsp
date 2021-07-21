<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<% 
Connection connect = null;
Statement stmt = null;
ResultSet rs = null;
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="images/logo.png" type="image/gif" sizes="20x20">
<title>Student Details</title>
<link rel="stylesheet" href="aftertpologin.css">
<link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
  <div class="container">
    <a class="navbar-brand" href="#">
          <img src="images/logo.jpg" height="70px" width="70px" style="border-radius:50%;">
        </a> 
    <h3 style="color:white;">Training & Placement Office IIIT Vadodara</h3>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">  
        <li class="nav-item">
          <a class="nav-link" href="aftertpologin.jsp">Back</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<form action="getstat" method="post" style="margin-left: 600px; margin-top:50px;">
<input type="submit" value="Students Placed" class="btn btn-dark">
</form>
<div class="container" style="text-align:center;">
<div class="col-lg-12">

<hr>
<h1>Students</h1>
<br>
<table class="table">
<thead class="thead-dark">
<tr >
<th>ID</th>
<th>Name</th>
<th>CPI</th>
<th>Resume</th>
</tr>
</thead>
<% 
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/first","root","anuj3107");
	String sql="select Candidate_ID,Name,CPI,Resume from candidate;";
	stmt=connect.createStatement();
	rs=stmt.executeQuery(sql);
	while(rs.next())
	{

%>
<tbody>
            <tr class="table-success">
              <td style="border:1px solid black;"><%=rs.getString(1) %></td>
              <td style="border:1px solid black;"><%=rs.getString(2) %></td>
              <td style="border:1px solid black;"><%=rs.getString(3) %></td>
              <td style="border:1px solid black;"><a style="color:blue;" href="<%=rs.getString(4)%>" target="_blank">Doc Link</a></td>
            </tr>
<% 
}
}catch(Exception e)
{
}
%>
</tbody>
</table>
<hr>
</div>
</div>


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