# Jersey JAX-RS framework and Vuejs example

## Version 2.0

### Java Backend

Update the Jersey framework to `4.0.0` <br/>
Update Java EE to Jakarta
Add standalone container so you don't have to deploy into Tomcat or others.

### This project demonstrate how the Jersey framework can be used as a Restful API to power a Vuejs frontend

Thing you will need

1. Java
   It is better to use an IDE. the IDE of choice is Intellij
2. PostgresSQL
3. Nodejs and NPM
4. Install Tomcat or Not.

### Installation

1. *Setup your database*<br>
   a. In the database folder there is a file call dump.sql it is a dump of my database using pg_dump. You can restore it
   using `psql`.<br>
   c. The `Init.java` class can be use during development for database migration<br>
   b. The config for the database can be found in `src/CONSTANTS.java`<br>
   c. Build your project into a `.war` file or run it using `mvn clean compile exec:java`<br>

2. *cd into the client folder*<br>
   a. Install the dependences using
   `npm install`<br>
   b. Start the server using
   `npm run dev`<br>
3. Remember to change the url in service-manager/client/src/main.js to point to your servers url
