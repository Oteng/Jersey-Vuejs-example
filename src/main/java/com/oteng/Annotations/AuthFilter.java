package com.oteng.Annotations;

import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerRequestFilter;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.Provider;
import java.io.IOException;

@Auth
@Provider
public class AuthFilter implements ContainerRequestFilter {

    @Override
    public void filter(ContainerRequestContext requestContext) throws IOException {
        String s = requestContext.getHeaderString(HttpHeaders.COOKIE);
//        System.out.println(s);
        if (s == null) {
            abortWithUnauthorized(requestContext);

        } else {
            String[] cookiesData = s.split(";");
            if (cookiesData.length > 0) {
                String[] test = cookiesData[0].split("=");
                if (test[0].equals("login")) {
                    String[] tmp = test[1].split(":");

                   if(tmp.length != 2){
                       abortWithUnauthorized(requestContext);
                   }

                }
            } else {
                abortWithUnauthorized(requestContext);
            }
        }
    }

    private void abortWithUnauthorized(ContainerRequestContext requestContext) {

        // Abort the filter chain with a 401 status code
        // The "WWW-Authenticate" header is sent along with the response
        requestContext.abortWith(
                Response.status(Response.Status.UNAUTHORIZED)
                        .build());
    }
}
