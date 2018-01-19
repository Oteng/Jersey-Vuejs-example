package com.oteng.Model;

import com.oteng.DataBase.Models;

import java.sql.SQLException;
import java.util.HashMap;

public class TblServiceReq extends Models {
    public TblServiceReq() throws SQLException, ClassNotFoundException {
        super();
    }

    @Override
    protected HashMap getColumns() {
        HashMap<String, String> columns =  new HashMap<>();
        columns.put("id", "serial PRIMARY KEY");
        columns.put("serial_num", "varchar(50)");
        columns.put("status", "boolean");
        columns.put("date_req", "timestamp");
        columns.put("date_done", "timestamp");
        columns.put("type", "varchar(50)");
        return columns;
    }

    @Override
    protected String getConstraint() {
        return "";
    }
}
