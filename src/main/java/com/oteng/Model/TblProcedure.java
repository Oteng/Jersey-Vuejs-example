package com.oteng.Model;

import com.oteng.DataBase.Models;

import java.sql.SQLException;
import java.util.HashMap;

public class TblProcedure extends Models {
    public TblProcedure() throws SQLException, ClassNotFoundException {
        super();
    }

    @Override
    protected HashMap getColumns() {

        HashMap<String, String> columns =  new HashMap<>();
        columns.put("id", "serial not null");
        columns.put("lookup", "integer REFERENCES tblprocedurelookup(id)");
        columns.put("cost", " DECIMAL(11)");
        return columns;
    }

    @Override
    protected String getConstraint() {
        return "PRIMARY KEY (id, lookup),";
    }
}
