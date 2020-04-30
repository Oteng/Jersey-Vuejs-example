package com.oteng;


import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.core.HttpHeaders;

public class CONSTANTS {
    public static String DATAABSE = "service";
    public static String DATABASEUSERNAME = "postgres";
    public static String DATABASEPASS = "########";
    public static String HOST = "localhost";
    public static String PORT = "5432";
    public static String DRIVER = "jdbc:postgresql://";

    public static String getUser(ContainerRequestContext requestContext){
        String s = requestContext.getHeaderString(HttpHeaders.COOKIE);
        String[] cookiesData = s.split(";");
        if(cookiesData.length > 0) {
            for (String val : cookiesData) {
                String[] test = val.split("=");
                if (test[0].equals("login")) {
                    String[] tmp = test[1].split(":");
                    return tmp[0];
                }
            }
        }
        return null;
    }
    public static String getRole(ContainerRequestContext requestContext){
        String s = requestContext.getHeaderString(HttpHeaders.COOKIE);
        String[] cookiesData = s.split(";");
        if(cookiesData.length > 0) {
            for (String val : cookiesData) {
                String[] test = val.split("=");
                if (test[0].equals("login")) {
                    String[] tmp = test[1].split(":");
                    return tmp[1];
                }
            }
        }
        return null;
    }
}
