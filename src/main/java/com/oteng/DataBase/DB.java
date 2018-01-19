package com.oteng.DataBase;

import com.oteng.CONSTANTS;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {
    private static DB ourInstance = null;
    private Connection connection = null;

    public static DB getInstance() throws SQLException, ClassNotFoundException {
        if (ourInstance == null)
            return ourInstance = new DB();
        else
            return ourInstance;
    }

    private DB() throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
        connection = DriverManager.getConnection(CONSTANTS.DRIVER+ CONSTANTS.HOST+":"+ CONSTANTS.PORT+"/"+ CONSTANTS.DATAABSE, CONSTANTS.DATABASEUSERNAME, CONSTANTS.DATABASEPASS);
    }

    public Connection getConnection(){
        return this.connection;
    }

    public void close() {
        try {
            this.connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
