package com.oteng.Modules;

import com.oteng.Annotations.Auth;
import com.oteng.Annotations.CORSAllow;
import com.oteng.CONSTANTS;
import com.oteng.Model.TblMenu;
import com.oteng.Model.TblUsers;
import com.oteng.PasswordHash;
import org.json.JSONObject;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.NewCookie;
import javax.ws.rs.core.Response;
import java.sql.SQLException;

@CORSAllow
@Path("access")
public class Access {

    @GET
    @Auth
    @Path("menu")
    public Response getMenu(@Context ContainerRequestContext req) throws SQLException, ClassNotFoundException {
        TblMenu tblMenu = new TblMenu();
        String str =  tblMenu.find(null, "role = '" + CONSTANTS.getRole(req) + "'", 0).toString();
        return Response.ok(str).build();
    }

    @POST
    public Response login(String data) throws SQLException, ClassNotFoundException {
        JSONObject obj = new JSONObject(data);
        TblUsers tblUsers = new TblUsers();

        if (obj.getString("username") == null || obj.getString("username").equals("")) {
            JSONObject res = new JSONObject();
            res.put("job", "validation");
            res.put("msg", "Check your username and password and try again");
            return Response.ok(res.toString(), MediaType.APPLICATION_JSON_TYPE).status(200).build();
        }

        JSONObject user = tblUsers.findOne(null, "username='" + obj.getString("username") + "'");
//        System.out.println(user.toString());
        PasswordHash passwordHash = new PasswordHash();
        if (passwordHash.authenticate(obj.getString("password"), user.getString("password"))) {

            if (user.getBoolean("ban")) {
                JSONObject res = new JSONObject();
                res.put("job", "validation");
                res.put("msg", "Contact the administrator to activate you");
                return Response.ok(res.toString(), MediaType.APPLICATION_JSON_TYPE).status(200).build();
            } else {
                JSONObject res = new JSONObject();
                res.put("result", true);
                return Response.ok(res.toString(), MediaType.APPLICATION_JSON_TYPE).status(200).cookie(new NewCookie("login", user.getBigInteger("id") + ":" + user.getString("role"))).build();
            }
        }

        JSONObject res = new JSONObject();
        res.put("job", "validation");
        res.put("msg", "Check your username and password and try again");
        return Response.ok(res.toString(), MediaType.APPLICATION_JSON_TYPE).status(200).build();
    }

    @GET
    @Path("logout")
    public Response logout() {
        JSONObject res = new JSONObject();
        res.put("result", true);
        return Response.ok(res.toString(), MediaType.APPLICATION_JSON_TYPE).status(200).cookie(new NewCookie("login", "logout")).build();
    }

}
