package com.oteng.Model;

import com.oteng.DataBase.Models;

import java.sql.SQLException;
import java.util.HashMap;

public class TblMenu extends Models {
    public TblMenu() throws SQLException, ClassNotFoundException {
        super();
    }

    @Override
    protected HashMap getColumns() {
        HashMap<String, String> columns =  new HashMap<>();
        columns.put("id", "serial PRIMARY KEY");
        columns.put("name", "varchar(45)");
        columns.put("icon", "varchar(45)");
        columns.put("url", "varchar(255)");
        columns.put("role", "varchar(2)");
        columns.put("parent", "integer");
        columns.put("siblings", "integer");
        return columns;
    }

    @Override
    protected String getConstraint() {
        return "";
    }
}
