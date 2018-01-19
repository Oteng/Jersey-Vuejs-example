package com.oteng.Model;

import com.oteng.DataBase.Models;

import java.sql.SQLException;
import java.util.HashMap;

public class TblProcedureLookup extends Models {
    public TblProcedureLookup() throws SQLException, ClassNotFoundException {
        super();
    }

    @Override
    protected HashMap<String, String> getColumns() {

        HashMap<String, String> columns =  new HashMap<>();
        columns.put("id", "serial PRIMARY KEY");
        columns.put("name", "varchar(255)");
        return columns;
    }

    @Override
    protected String getConstraint() {
        return "";
    }
}
