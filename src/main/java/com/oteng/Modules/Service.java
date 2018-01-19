package com.oteng.Modules;

import com.oteng.Model.TblServiceReq;
import org.json.JSONObject;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.sql.SQLException;
import java.util.Calendar;

@Path("service")
public class Service {

    @PATCH
    @Path("/details/{id}")
    public String details(@PathParam("id") String id, String data) throws SQLException, ClassNotFoundException {
        JSONObject postData = new JSONObject(data);

        switch (postData.getString("type")) {
            case "lab":
                String query = "SELECT serial_num,type,remarks,date_req, tblpatient.name as name, cost, tbllablookup.name as test FROM tblservicereq INNER JOIN tblpatient ON tblservicereq.patient = tblpatient.id INNER JOIN tbllab ON tblservicereq.service = tbllab.id INNER JOIN tbllablookup ON tbllab.lookup = tbllablookup.id;";
                TblServiceReq tblServiceReq = new TblServiceReq();
                return tblServiceReq.find(query).toString();
            case "pro":
                String query1 = "SELECT serial_num,type,remarks,date_req, tblpatient.name as name, cost, tblprocedurelookup.name as test FROM tblservicereq INNER JOIN tblpatient ON tblservicereq.patient = tblpatient.id INNER JOIN tblprocedure ON tblservicereq.service = tblprocedure.id INNER JOIN tblprocedurelookup ON tblprocedure.lookup = tblprocedurelookup.id;";
                TblServiceReq tblServiceReq1 = new TblServiceReq();
                return tblServiceReq1.find(query1).toString();
            default:
                String query2 = "SELECT serial_num,type,remarks,date_req, tblpatient.name as name, cost, tblxraylookup.name as test FROM tblservicereq INNER JOIN tblpatient ON tblservicereq.patient = tblpatient.id INNER JOIN tblxray ON tblservicereq.service = tblxray.id INNER JOIN tblxraylookup ON tblxray.lookup = tblxraylookup.id;";
                TblServiceReq tblServiceReq2 = new TblServiceReq();
                return tblServiceReq2.find(query2).toString();
        }


    }

    @GET
    public String getReq() throws SQLException, ClassNotFoundException {
        TblServiceReq tblServiceReq = new TblServiceReq();
        return tblServiceReq.find("SELECT DISTINCT ON (serial_num) serial_num,type,tblpatient.name,date_req FROM service.public.tblservicereq INNER JOIN tblpatient ON tblservicereq.patient = tblpatient.id ORDER BY serial_num;").toString();
    }

    @POST
    @Path("{type}")
    @Consumes(MediaType.APPLICATION_JSON)
    public String addRequest(@PathParam("type") String type, String data) throws SQLException, ClassNotFoundException {
        JSONObject postData = new JSONObject(data);
        System.out.println(postData.toString());
        long timpstampe = Calendar.getInstance().getTimeInMillis();

        TblServiceReq tblServiceReq = new TblServiceReq();
        StringBuilder str = new StringBuilder(" (date_done,serial_num,date_req,status,type,patient,remarks,service) VALUES ");
        for (Object val : postData.getJSONArray("request")) {
            str.append("(null,").append(timpstampe).append(",").append(postData.getBigInteger("req_date")).append(",").append("false,");
            switch (type) {
                case "lab":
                    str.append("'lab',");
                    break;
                case "pro":
                    str.append("'pro',");
                    break;
                default:
                    str.append("'xray',");
            }
            JSONObject _val = (JSONObject) val;

            str.append(postData.getString("patient")).append(",'").append(_val.getString("msg")).append("',").append(_val.getInt("lab")).append("),");
        }

        str.replace(str.length() - 1, str.length(), "");
//        System.out.println(str.toString());
        tblServiceReq.save(str.toString());

        return null;
    }
}
