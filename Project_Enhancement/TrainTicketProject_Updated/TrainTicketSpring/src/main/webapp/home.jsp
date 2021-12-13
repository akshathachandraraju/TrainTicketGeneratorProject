<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "traindb";
String userid = "root";
String password = "anil123";
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
    <meta charset="UTF-8">
    <title>Train Ticket Generator</title>
    <link rel="stylesheet" type="text/css" href=main.css>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

    <div class="navbar">
       <center> <h1> Welcome to our Application</h1></center>

        <a  href="login.html"><i class="fa fa-fw fa-sign-out"></i> Log out</a>
        <a href="admin.html"><i class="fa fa-fw fa-user"></i> Admin</a>
        <a class="active" href="home.jsp"><i class="fa fa-fw fa-ticket"></i> Book Ticket</a>
        <a  href="index.html"><i class="fa fa-fw fa-home"></i> Home</a>


    </div>
    <div  style="background-color:#92a8d1;" class="main">
    <div id="welcome">
        <h2>Train Details</h2>
        <br>
        <center>
            <table border="0" width="600px" height="300"  >
               <tr  >
               <td ><b style="color:black;">Train no</td>
               <td ><b style="color:black;">Train name</td>
               <td ><b style="color:black;">Source</td>
               <td><b style="color:black;">Destination</td>
               <td ><b style="color:black;">Ticket Price</b></td>
               </tr>
               </center>
               <%
               try{
               connection = DriverManager.getConnection(connectionUrl+database, userid, password);
               statement=connection.createStatement();
               String sql ="select * from trains";
               resultSet = statement.executeQuery(sql);
               int i=0;
               while(resultSet.next()){
               %>
               <tr>
               <td><%=resultSet.getString("TRAIN_NO") %></td>
               <td><%=resultSet.getString("TRAIN_NAME") %></td>
               <td><%=resultSet.getString("SOURCE") %></td>
               <td><%=resultSet.getString("DESTINATION") %></td>
               <td><%=resultSet.getString("TICKET_PRICE") %></td>

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
            <button class="btn" id="generate">Book Ticket</button>
        </center>
    </div>
    <div id="ticketForm">
        <form method="POST" action="Ticket.jsp">
            <h2>Please Enter Your Details</h2>

            <div class="row">
                <label>Enter Train No:</label>
                <div>
                    <input id="trains" class="inputField" type="text" name="trainNum"/>

                    <h4 style="background-color: red;" id="demo"></h4>
                    <h4 style="background-color: green;" id="demo1"></h4>
                </div>
            </div>
            <div class="row">
                <label>Travel Date: </label>
                <input class="inputField" type="date" id="date" name="travelDate" disabled />
            </div>
            <div class="row">
                <label>Passengers:</label>
                <div>
                    <select disabled name="passengerNumber" id="numberOfPassengers" class="inputField">
                        <option value="0" selected disabled>Number of Passengers</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                        <option value="4">Four</option>
                        <option value="5">Five</option>
                        <option value="6">Six</option>
                        <option value="7">Seven</option>
                        <option value="8">Eight</option>
                        <option value="9">Nine</option>
                        <option value="10">Ten</option>
                    </select>
                </div>

            </div>
            <div id="passengers" class="row">
            </div>

        <div class="main">
            <form action="success.jsp">
                <h3 style="color:blue;">Payment</h3>
                <label style="color:green;" >ALL Cards Are Accepted</label>
                <div class="icon-container">
                    <i class="fa fa-cc-visa" style="color:navy;"></i>
                    <i class="fa fa-cc-amex" style="color:blue;"></i>
                    <i class="fa fa-cc-mastercard" style="color:red;"></i>
                    <i class="fa fa-cc-discover" style="color:orange;"></i>
                </div>
                <center>
                    <div class="row">
                        <label >Name on Card</label>
                        <input type="text" id="cname" name="cardname" placeholder="Name" required>
                    </div>
                    <div class="row">
                        <label >Credit card number</label>
                        <input  type="number" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444"  required>
                    </div>
                    <div class="row">
                        <label >Exp Month</label>
                        <input  type="number" id="expmonth" name="expmonth" placeholder="Month"  required>
                    </div>
                    <div class="row">
                        <label for="expyear">Exp Year</label>
                        <input  type="number" id="expyear" name="expyear" placeholder="YYYY"  required>
                    </div>
                    <div class="row">
                        <label for="cvv">CVV</label>
                        <input  type="number" id="cvv" name="cvv" placeholder="CVV" required>
                    </div>
                    <div class="row">
                        <label for="PhoneNumber">Phone Number</label>
                        <input  type="number" id="PhoneNumber" name="PhoneNumber" placeholder="Phone Number" required>
                        <button type="button">Send OTP</button>
                    </div>
                    <div class="row">
                        <label for="EnterOTP">Enter OTP</label>
                        <input  type="number" id="EnterOTP" name="EnterOTP" placeholder="Enter OTP" required>
                    </div>

                    <a style="text-decoration:none" href="index.html"><button onclick="myFunction1()" id="submit" class="btn">Submit</button></a>
                </center>
            </form>
        </div>
        </form>
    </div>
</div>
<script src=script.js></script>
</body>
</html>