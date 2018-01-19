package com.oteng.Model;

import com.oteng.DataBase.Models;

import java.sql.SQLException;
import java.util.HashMap;

public class TblUsers extends Models {
    public TblUsers() throws SQLException, ClassNotFoundException {
        super();
    }

    @Override
    protected HashMap getColumns() {
        HashMap<String, String> columns =  new HashMap<>();
        columns.put("id", "serial PRIMARY KEY");
        columns.put("name", "varchar(50)");
        columns.put("username", "varchar(50)");
        columns.put("password", "varchar(255)");
        columns.put("role", "varchar(50)");
        columns.put("ban", "boolean");

        return columns;
    }

    @Override
    protected String getConstraint() {
        return "";
    }
}
