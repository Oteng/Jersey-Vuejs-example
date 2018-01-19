package com.oteng.Model;

import com.oteng.DataBase.Models;

import java.sql.SQLException;
import java.util.HashMap;

public class TblLab extends Models {
    public TblLab() throws SQLException, ClassNotFoundException {
        super();
    }

    @Override
    protected HashMap getColumns() {
        HashMap<String, String> columns =  new HashMap<>();
        columns.put("id", "serial not null");
        columns.put("lookup", "integer REFERENCES tbllablookup(id)");
        columns.put("cost", " DECIMAL(11)");
       return columns;
    }

    @Override
    protected String getConstraint() {
        return "PRIMARY KEY (id, lookup),";
    }

}
