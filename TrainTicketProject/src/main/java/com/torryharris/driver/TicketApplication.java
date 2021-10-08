package com.torryharris.driver;

import com.torryharris.model.Ticket;
import com.torryharris.model.Train;
import com.torryharris.model.TrainDAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.Scanner;

public class TicketApplication {
    public static void main(String[] args) throws SQLException, IOException {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter train No:");
        int train_no = sc.nextInt();

        TrainDAO trainDAO = new TrainDAO();
        Train train = null;
        try {
            train = trainDAO.findTrainNo(train_no);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        sc.nextLine();
        System.out.println("Enter Travel Date:");
        String[] arr =sc.nextLine().split("/");
        LocalDate travel_date= LocalDate.of(Integer.parseInt(arr[2]),Integer.parseInt(arr[1]),Integer.parseInt(arr[0]));
        LocalDate Today=LocalDate.now();

        Ticket ticket = new Ticket(travel_date,train);

        System.out.println("Enter the number of Passengers:");
        int passenger_no = sc.nextInt();
        for (int i = 0; i < passenger_no; i++) {
            System.out.println("Enter Passenger" + (i + 1) + " Name:");
            String name = sc.next();
            System.out.println("Enter Passenger" + (i + 1) + " Gender (F/M):");
            char gender = sc.next().charAt(0);
            System.out.println("Enter Passenger" + (i + 1) + " Age:");
            int age = sc.nextInt();

            ticket.addPassenger(name, gender, age);
        }

        try {
            ticket.writeTicket();
        }catch (Exception e){
            e.printStackTrace();
        }
        System.out.println("\n Thank you ");
    }
}


       /* try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/traindb";
            String username = "root";
            String password = "Welcome@123";
            Connection connection = DriverManager.getConnection(url, username, password);
            Statement statement = connection.createStatement();
            ArrayList<Train> trainArrayList = getTrain();
            for (Train t : trainArrayList) {
                String insertQuery = "insert into train values(" + t.getTrain_no() + ",'" + t.getTrain_name() + "','" + t.getSource() + "','" + t.getDestination() + "'," + t.getTicket_price() + ")";
                System.out.println(insertQuery);
                statement.execute(insertQuery);
            }
            System.out.println("Inserted successfully");
            statement.close();
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
        public static ArrayList<Train> getTrain() {
        Train t1=new Train(1001,"Shatabdi Express","Bangalore","Delhi",2500.0);
        Train t2=new Train(1002,"Shatabdi Express","Delhi","Bangalore",2500.0);
        Train t3=new Train(1003,"Udyan Express","Bangalore","Mumbai",1500.0);
        Train t4=new Train(1004,"Udyan Express","Mumbai","Bangalore",1500.0);
        Train t5=new Train(1005,"Brindhavan Express","Bangalore","Chennai",1000.0);
        Train t6=new Train(1006,"Brindhavan Express","Chennai","Bangalore",1000.0);
        ArrayList<Train>trains = new ArrayList<>();
        trains.add(t1);
        trains.add(t2);
        trains.add(t3);
        trains.add(t4);
        trains.add(t5);
        trains.add(t6);
        return trains;
        */



