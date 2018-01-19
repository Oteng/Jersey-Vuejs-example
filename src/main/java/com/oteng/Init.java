package com.oteng;

import com.oteng.DataBase.ModelFinder;
import com.oteng.DataBase.Models;

import java.sql.SQLException;
import java.util.List;

public class Init {
    /**
     * This classes is run in the main method of the server and is run once.
     * It does initialization function like checking to see if the migration table exist and
     * the current status ot the models in the table
     * it any thing has change it update it appropriately
     */
    public Init() throws IllegalAccessException, SQLException, InstantiationException {
        this.init();
    }

    private boolean init() throws IllegalAccessException, InstantiationException, SQLException {
        //Read migration table to verify every thing is ok
        List<Class<?>> classes = ModelFinder.find("com.oteng.Model");

        for(Class ass : classes){
            Models c = (Models)ass.newInstance();
            c.create();
        }

        return false;
    }
}
