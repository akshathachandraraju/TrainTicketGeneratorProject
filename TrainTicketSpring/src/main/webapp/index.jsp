<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Train Ticket Generator</title>
    <link rel="stylesheet" type="text/css" href=main.css>
</head>
<body>
<div class="main">
    <h1>Welcome To Train Ticket Application</h1>
    <div id="welcome">
        <h2>Train Details</h2>
        <center>
        <table border="0" width="600" height="300" >
            <tr>
                <td><b>Train No</b></td>
                <td><b> Train Name</b></td>
                <td><b> Source</b></td>
                <td><b>Destination</b></td>
                <td><b>Price</b></td>
            </tr>
            <tr>
                <td><button class="btn" id="generate1">1001</button></td>
                <td>Shatabdi Express</td>
                <td>Bangalore</td>
                <td>Delhi</td>
                <td>2500</td>
            </tr>
            <tr>
                <td><button class="btn" id="generate2">1002</button></td>
                <td>Shatabdi Express</td>
                <td>Delhi</td>
                <td>Bangalore</td>
                <td>2500</td>
            </tr>
            <tr>
                <td><button class="btn" id="generate3">1003</button></td>
                <td> Udyan Express</td>
                <td>Bangalore</td>
                <td>Mumbai</td>
                <td>1500</td>
            </tr>
            <tr>
                <td> <button class="btn" id="generate4">1004</button></td>
                <td>Udyan Express</td>
                <td>Mumbai</td>
                <td>Bangalore</td>
                <td>1500</td>

            </tr>
            <tr>
                <td><button class="btn" id="generate5">1005</button></td>
                <td>Brindhavan Express</td>
                <td>Bangalore</td>
                <td>Chennai</td>
                <td>1000</td>


            </tr>
            <tr>
                <td><button class="btn" id="generate6">1006</button></td>
                <td> Brindhavan Express</td>
                <td>Chennai</td>
                <td>Bangalore</td>
                <td>1000</td>
            </tr>
        </table>
        </center>
    </div>
    <div id="ticketForm">
        <form method="POST" action="Ticket.jsp">
            <h2>Please Enter Your Details</h2>
            <div class="row">
                <label>Select Train:</label>
                <div>
                    <select id="trains" class="inputField" name="trainNum">
                        <option value="0" selected disabled>Please Select</option>
                        <option value="1001">Train 1001: Bangalore to Delhi</option>
                        <option value="1002">Train 1002: Delhi to Bangalore</option>
                        <option value="1003">Train 1003: Bangalore to Mumbai</option>
                        <option value="1004">Train 1004: Mumbai to Bangalore</option>
                        <option value="1005">Train 1005: Bangalore to Chennai</option>
                        <option value="1006">Train 1006: Chennai to Bangalore</option>
                    </select>
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
                    </select>
                </div>

            </div>
            <div id="passengers" class="row">

            </div>
            <button id="submit" class="btn">Submit</button>
        </form>
    </div>
</div>

<script src=script.js></script>
</body>
</html>