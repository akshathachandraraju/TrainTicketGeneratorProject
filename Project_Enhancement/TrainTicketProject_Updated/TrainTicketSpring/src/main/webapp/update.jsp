<!DOCTYPE html>
<html lang="en">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Train Ticket Generator</title>
    <link rel="stylesheet" type="text/css" href=main.css>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
</head>
<body>
<div class="navbar">
    <center><strong> <h1> Welcome to our Application</h1></strong></center>
    <a  href="login.html"><i class="fa fa-fw fa-sign-out"></i> Log out</a>
    <a class="active" href="admin.html"><i class="fa fa-fw fa-user"></i> Admin</a>
</div>
<div style="background-color:#92a8d1;" class="main">
    <div id="welcome">
<form method="post" action="DAO.jsp">
<center>
<h1 style="background-image:url("4.jpg");">Enter Train Details To Be Inserted</h1><br>
<center>
<table style="border-radius:9px;width:50%;height:350px">
<tr>
<td>Train No:</td><td><input type="text" name="trainno"></td></tr>
<tr>
<td>Train Name:</td><td><input type="text" name="trainname" ></td></tr>
<tr>
<td>Train Source:</td><td><input type="text" name="source" ></td></tr>
<tr>
<td>Train Destination:</td><td><input type="text" name="destination" ></td></tr>
<tr>
<td>Total Ticket Price:</td><td><input type="text" name="ticketprice" ></td></tr>
</table>
</center>
<br>
<button class="btn">Submit</button>
</center>
</form>
</div>
</div>
</body>
</html>