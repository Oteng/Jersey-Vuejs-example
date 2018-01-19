package com.oteng.Modules;


import com.oteng.Model.*;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.sql.SQLException;

@Path("settings")
public class Settings {

    /**
     * get Systems all of systems records
     *
     * @param type string
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    @GET
    @Path("{type}")
    public String getSys(@PathParam("type") String type) throws SQLException, ClassNotFoundException {
        switch (type) {
            case "lab":
                TblLabLookUp tblLabLookUp = new TblLabLookUp();
                return tblLabLookUp.find(null, null, 0).toString();
            case "pro":
                TblProcedureLookup tblProcedureLookup = new TblProcedureLookup();
                return tblProcedureLookup.find(null, null, 0).toString();
            default:
                TblXrayLookUp tblXrayLookUp = new TblXrayLookUp();
                return tblXrayLookUp.find(null, null, 0).toString();
        }
    }

    /**
     * get hospitals records
     *
     * @param type string
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    @GET
    @Path("service/{type}")
    public String getService(@PathParam("type") String type) throws SQLException, ClassNotFoundException {
        switch (type) {
            case "lab":
                TblLab tblLab = new TblLab();
                String query = "SELECT * FROM tbllab INNER JOIN tbllablookup ON tbllab.lookup = tbllablookup.id;";
                return tblLab.find(query).toString();
            case "pro":
                TblProcedure tblProcedure = new TblProcedure();
                String query1 = "SELECT * FROM tblprocedure INNER JOIN tblprocedurelookup ON tblprocedure.lookup = tblprocedurelookup.id;";
                return tblProcedure.find(query1).toString();
            default:
                TblXray tblXray = new TblXray();
                String query2 = "SELECT * FROM tblxray INNER JOIN tblxraylookup ON tblxray.lookup = tblxraylookup.id;";
                return tblXray.find(query2).toString();
        }
    }


    @POST
    @Path("{type}")
    public Response create(@PathParam("type") String type, String data) throws SQLException, ClassNotFoundException {

        JSONObject postData = new JSONObject(data);
        System.out.println(postData.toString());
        StringBuilder str = new StringBuilder("(lookup, cost) VALUES ");
        JSONArray jsonArray = postData.getJSONArray("data");

        for (Object obj : jsonArray) {
            JSONObject val = (JSONObject) obj;
            str.append("(").append(val.getInt("lookup")).append(",").append(val.getFloat("cost")).append(")").append(",");
        }

        str.replace(str.length() - 1, str.length(), "");
        System.out.println(str.toString());

        switch (type) {
            case "lab":
                TblLab tblLab = new TblLab();
                //truncate table
                tblLab.truncate();
                tblLab.save(str.toString());
                break;
            case "pro":
                TblProcedure tblProcedure = new TblProcedure();
                tblProcedure.truncate();
                tblProcedure.save(str.toString());
                break;
            default:
                TblXray tblXray = new TblXray();
                tblXray.truncate();
                tblXray.save(str.toString());
        }
        return Response.status(200).build();
    }


    @DELETE
    @Path("{type}/{id}")
    public boolean remove(@PathParam("type") String type, @PathParam("id") String id) throws SQLException, ClassNotFoundException {
        switch (type) {
            case "lab":
                TblLab tblLab = new TblLab();
                return tblLab.remove("id =" + id);
            case "pro":
                TblProcedure tblProcedure = new TblProcedure();
                return tblProcedure.remove("id =" + id);
            default:
                TblXray tblXray = new TblXray();
                return tblXray.remove("id =" + id);
        }
    }

    @GET
    @Path("patient")
    public String getPatient() throws SQLException, ClassNotFoundException {
        TblPatient tblPatient = new TblPatient();
        return tblPatient.find("SELECT age(dob) ,name ,id FROM tblpatient").toString();
    }
}
