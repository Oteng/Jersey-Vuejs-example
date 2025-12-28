module com.oteng.module {
    requires jakarta.ws.rs;

    requires org.glassfish.grizzly.http.server;

    requires org.glassfish.jersey.core.server;
    requires org.glassfish.jersey.container.grizzly2.http;
    requires org.apache.commons.lang3;
    requires org.json;
    requires java.sql;

    exports com.oteng;
}