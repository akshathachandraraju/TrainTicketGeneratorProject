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
String username = request.getParameter("username");
session.putValue("username", username);
String password1 = request.getParameter("password1");
Class.forName("com.mysql.cj.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/traindb", "root", "anil123");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from users where username='" + username+ "' and password1='" + password1 + "'");
try {
 rs.next();
 if (rs.getString("password1").equals(password1) && rs.getString("username").equals(username)) {
 String redirectURL = "index.html";
  response.sendRedirect(redirectURL);
 } else {
response.sendRedirect("failure.jsp");
 }
} catch (Exception e) {
response.sendRedirect("failure.jsp");
 e.printStackTrace();
}
%>


