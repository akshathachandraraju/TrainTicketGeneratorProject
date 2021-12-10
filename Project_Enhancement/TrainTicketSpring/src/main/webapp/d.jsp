 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<div class="main">
<center>
<%
Class.forName("com.mysql.cj.jdbc.Driver");

Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/traindb", "root", "Welcome@123");

Statement stat=c.createStatement();
String id=request.getParameter("TRAIN_NO");
int del=stat.executeUpdate("Delete from train where train_no="+id);

out.println("Train is successfully deleted!");

%>
<br><a href="adminhome.html"><button class="btn">Back</button></a>
</center>
</div>
</body>
</html>