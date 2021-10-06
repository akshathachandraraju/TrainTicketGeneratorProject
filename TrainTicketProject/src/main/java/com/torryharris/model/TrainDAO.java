package com.torryharris.model;
import java.sql.*;

public class TrainDAO {

    private final String DRIVER_NAME = "com.mysql.cj.jdbc.Driver";
    private final String DB_URL = "jdbc:mysql://localhost:3306/traindb";
    private final String USERNAME = "root";
    private final String PASSWORD = "Welcome@123";


    public Train findTrainNo(int train_no) throws SQLException {
       Connection connection=DriverManager.getConnection(DB_URL,USERNAME,PASSWORD);
       Statement statement= connection.createStatement();

       String query="select * from train where train_no="+train_no;
       ResultSet rs= statement.executeQuery(query);
       if(!rs.next()){
           System.out.println("Train not Found");
       }
       else {
           String train_name = rs.getString(2);
           String source = rs.getString(3);
           String destination = rs.getString(4);
           double ticket_price = rs.getDouble(5);
           return new Train(train_no, train_name, source, destination, ticket_price);
       }
       connection.close();
       return null;
   }

}




