<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Train Ticket Generator</title>
<link rel="stylesheet" type="text/css" href=main.css>
</head>
<%
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String email = request.getParameter("email");
String username = request.getParameter("username");
String password1 = request.getParameter("password1");
try {
 Class.forName("com.mysql.cj.jdbc.Driver");
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/traindb", "root", "anil123");
 Statement st = conn.createStatement();
 int i = st.executeUpdate("insert into users(fname,lname,email,username,password1)values('" + fname + "','" + lname
 + "','" + email + "','" + username + "','" + password1 + "')");
 response.sendRedirect("login.html");
} catch (Exception e) {
 System.out.print(e);
 e.printStackTrace();
}
%>
