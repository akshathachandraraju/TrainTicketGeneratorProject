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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <link rel="stylesheet" type="text/css" href=main.css>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body>
<style>
.button {

  border: none;
background-color: #548784;

  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius:15px;
}
</style>


<center><h1 style="background-color:DodgerBlue; ">Registered Users</h1></center>
<div style="background-color:#92a8d1;" class="main">
<center>

<table border="1"  >
<tr>
<td>First name</td>
<td>Last name</td>
<td>Email</td>
<td>Username</td>
<td>Password</td>
</tr>
</center>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){

%>
<tr>
<td><%=resultSet.getString("fname") %></td>
<td><%=resultSet.getString("lname") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("password1") %></td>

<a href="adminregister.jsp?fname=<%=resultSet.getString("fname") %>"></a>
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
<br><a href="adminhome.html"><button class="button">Back</button></a>
</div>


</body>
</html>