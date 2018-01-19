# Jersey JAX-RS framework and Vuejs example

### This project demonstrate how the Jersey framework can be used as a Restful API to power a Vuejs frontend
Thing you will need
1. Java
    It is better to use an IDE. the IDE of choice is Intellij
2. PostgresSQL
3. Nodejs and NPM
4. Intall Tomcat

### Installation
1. *Setup your database*
    a. In the database folder there is a file call dump.sql it is a dump of my database using pg_dump. 
    the application is however built to install the tables but you will need the init data is for the lookup tables
    b. The config for the database can be found in src/CONSTANTS.java
    c. Build your project into a .war file

2. *Run you backend server first*
    Install tomcat and upload the war file in target/tomcat_war.war

3. *cd into the client folder* 
    a. Install the dependences using
        `npm install`
    b. Start the server using
        `npm run dev`
4. Remember to change the url in service-manager/client/src/main.js to point to your servers url
