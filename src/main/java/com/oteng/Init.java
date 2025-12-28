package com.oteng;

import com.oteng.DataBase.ModelFinder;
import com.oteng.DataBase.Models;

import java.sql.SQLException;
import java.util.List;

public class Init {
    /**
     * This class is intended for development and testing purposes only.
     * Do NOT invoke this in a production environment, as it will try to perform database migration, which will
     * slow down the startup time of your server.
     */

    public Init() throws IllegalAccessException, SQLException, InstantiationException {
        this.init();
    }

    private boolean init() throws IllegalAccessException, InstantiationException, SQLException {
        //Read migration table to verify every thing is ok
        List<Class<?>> classes = ModelFinder.find("com.oteng.Model");

        for (Class ass : classes) {
            Models c = (Models) ass.newInstance();
            c.create();
        }

        return false;
    }
}
