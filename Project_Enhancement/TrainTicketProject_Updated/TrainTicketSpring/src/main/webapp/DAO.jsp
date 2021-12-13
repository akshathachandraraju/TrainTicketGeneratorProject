<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
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
<div style="background-color:#92a8d1;" class="main">
<center>

<%
String train_no=request.getParameter("trainno");
String train_name=request.getParameter("trainname");
String source=request.getParameter("source");
String destination=request.getParameter("destination");
String ticketprice=request.getParameter("ticketprice");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/traindb", "root", "anil123");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into trains(TRAIN_NO, TRAIN_NAME, SOURCE, DESTINATION, TICKET_PRICE)values('"+train_no+"','"+train_name+"','"+source+"','"+destination+"','"+ticketprice+"')");


}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
out.println("Train details  successfully inserted!");
%>
<br><a href="adminhome.html"><button class="btn">Back</button></a>
</center>
</div>
</body>
</html>