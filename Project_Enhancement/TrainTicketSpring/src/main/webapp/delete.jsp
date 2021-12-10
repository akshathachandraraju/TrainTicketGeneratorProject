<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "traindb";
String userid = "root";
String password = "Welcome@123";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Train Ticket Generator</title>
    <link rel="stylesheet" type="text/css" href=main.css>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<body>
<div class="navbar">
    <center><strong> <h1> Welcome to our Application</h1></strong></center>
    <a  href="login.html"><i class="fa fa-fw fa-sign-out"></i> Log out</a>
    <a class="active" href="admin.html"><i class="fa fa-fw fa-user"></i> Admin</a>
</div>
<div class="main">
<center>
<h1 style="background-image:url("4.jpg");">Delete Train</h1>
<table border="1" style="width:60%;height:10px" >
<tr>
<td><b>Train no</td>
<td><b>Train name</td>
<td><b>Source</td>
<td><b>Destination</td>
<td><b>Ticket Price</b></td>
<td><b>Option</b></td>
</tr>
</center>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from train";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("train_no") %></td>
<td><%=resultSet.getString("train_name") %></td>
<td><%=resultSet.getString("source1") %></td>
<td><%=resultSet.getString("destination") %></td>
<td><%=resultSet.getString("ticket_price") %></td>

<td><a href="d.jsp?TRAIN_NO=<%=resultSet.getString("train_no") %>"><button type="button" class="btn">Delete</button></a></td>
</tr>

<%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<a href="adminhome.html"><button class="btn">Back</button></a>
</div>
</body>
</html>