package com.trainticket;

import java.sql.*;

public class TrainDAO {
    private final String DRIVER_NAME = "com.mysql.cj.jdbc.Driver";
    private final String DB_URL = "jdbc:mysql://localhost:3306/traindb";
    private final String USERNAME = "root";
    private final String PASSWORD = "anil123";
    Train train;

    public Train findTrainNo(int train_no) throws SQLException, ClassNotFoundException {
        try {
            Class.forName(DRIVER_NAME);
            Connection connection = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
            Statement statement = connection.createStatement();
            String query = "select * from trains where TRAIN_NO=" + train_no;
            ResultSet rs = statement.executeQuery(query);
            while (rs.next())
                train = new Train(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5));
            if (train != null) {
                return train;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
}



