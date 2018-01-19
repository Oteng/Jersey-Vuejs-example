package com.oteng.Model;

import com.oteng.DataBase.Models;

import java.sql.SQLException;
import java.util.HashMap;

public class TblPatient extends Models{
    public TblPatient() throws SQLException, ClassNotFoundException {
        super();
    }

    @Override
    protected HashMap getColumns() {

        HashMap<String, String> columns =  new HashMap<>();
        columns.put("id", "serial PRIMARY KEY");
        columns.put("name", "varchar(255)");
        columns.put("dob", "date");
        return columns;
    }

    @Override
    protected String getConstraint() {
        return "";
    }
}
