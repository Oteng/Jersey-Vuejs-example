package com.oteng.Modules;


import com.oteng.Model.TblUsers;
import com.oteng.PasswordHash;
import org.json.JSONObject;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.sql.SQLException;
import java.util.HashMap;

@Path("users")
public class Users {

    private TblUsers tblUsers;
    private PasswordHash passwordHash;

    public Users() throws SQLException, ClassNotFoundException {
        passwordHash = new PasswordHash();
        this.tblUsers = new TblUsers();
    }

    /**
     * list all the users in the database their names and role
     *
     * @return json string
     */
    @GET
    public String index() throws SQLException {
        return tblUsers.find(new String[]{"name", "role", "id"}, null, 0).toString();
    }


    /**
     * get users details
     */
    @GET
    @Path("{id}")
    public String details(@PathParam("id") String id) throws SQLException {
        return tblUsers.findOne(new String[]{"name", "role", "id","username", "ban"}, "id = "+id).toString();
    }
    /**
     * add new users to the table
     */
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response create(String data) throws SQLException {
        JSONObject postData = new JSONObject(data);

        System.out.println(postData.toString());
        System.out.println(postData.getString("name"));

        for (String key : postData.keySet()) {
            if (key.equals("password")) {
                tblUsers.set(key, passwordHash.hash(postData.getString("password")));
            } else
                tblUsers.set(key, postData.get(key));
        }
        tblUsers.save();
        return Response.status(200).build();

    }

    /**
     * for banding users when ban is set to true the user can't access their account
     */
    @PATCH
    @Path("/ban/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response banUser(@PathParam("id") String id, String data) throws SQLException {
        JSONObject postData = new JSONObject(data);
        HashMap<String, Object> tm = new HashMap<>();
        tm.put("ban", postData.getBoolean("ban"));
        tblUsers.update(tm, id);
        return Response.status(200).build();
    }

    /**
     * reset passwords
     */
    @PATCH
    @Path("/reset/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response resetPass(@PathParam("id") String id, String data) throws SQLException {
        JSONObject postData = new JSONObject(data);

        HashMap<String, Object> tm = new HashMap<>();
        tm.put("password", passwordHash.hash(postData.getString("password")));
        tblUsers.update(tm, id);
        return Response.status(200).build();
    }

    @PATCH
    @Path("{id}")
    public boolean edit(@PathParam("id") String id, String data) throws SQLException {
        JSONObject postData = new JSONObject(data);
        HashMap<String, String> tmpData = new HashMap<>();

        for(String key : postData.keySet()) {
            tmpData.put(key, postData.getString(key));
        }

        return tblUsers.update(tmpData, id);
    }

}
