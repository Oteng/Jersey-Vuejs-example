package com.oteng.DataBase;

import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

public abstract class Models {

    /**
     * the name of the class represent the name of the table
     */
    private String table_name = null;
    private DB db = null;
    protected Connection connection = null;

    public Connection getConnection() {
        return connection;
    }

    private HashMap<String, Object> saveRecord = new HashMap<>();

    public Models() throws SQLException, ClassNotFoundException {
        this.table_name = this.getClassName();
        this.db = DB.getInstance();
        this.connection = this.db.getConnection();
    }

    protected abstract HashMap<String, String> getColumns();

    protected abstract String getConstraint();

    /**
     * this function creates a new table when it don't exist.
     *
     * @return boolean
     * @throws SQLException when something goes wrong
     */
    public boolean create() throws SQLException {
        StringBuilder stm = new StringBuilder("CREATE TABLE IF NOT EXISTS " + getTable_name() + " (");
        HashMap columns = getColumns();
        for (Object key : columns.keySet()) {
            stm.append(key).append(" ").append(columns.get(key)).append(",");
        }
        //get and add constrain;
        stm.append(getConstraint());
        //remove the last comma
        stm.replace(stm.length() - 1, stm.length(), ");");
//        System.out.println(stm.toString());
        Statement statement = this.connection.createStatement();
        return statement.execute(stm.toString());
    }

    public boolean exist() throws SQLException {
        PreparedStatement stm = this.connection.prepareStatement(
                "SELECT CASE WHEN exists((SELECT * FROM information_schema.tables WHERE 'table_name' = \'" + this.table_name + "\')) THEN 1 ELSE 0 END"
        );
        return stm.execute();
    }

    private String getClassName() {
        String name = this.getClass().getName();
        String[] arrName = StringUtils.split(name, ".");
        return (arrName[arrName.length - 1]).toLowerCase();
    }

    private String getTable_name() {
        return this.table_name;
    }

    /**
     * This function insert the records in the saveRecord HashMap. it first verifies that the
     * all the columns are provided and then the insertion is not any other column not provided is set to null
     *
     * @return true when the insertion was done correctly and false otherwise
     */
    public boolean save() throws SQLException {
//        System.out.println("string");

        StringBuilder insertStr = new StringBuilder("INSERT INTO " + getTable_name() + " ");
        StringBuilder keyStr = new StringBuilder("(");
        StringBuilder valueStr = new StringBuilder("(");

        for (Object key : saveRecord.keySet()) {
            keyStr.append(key).append(",");
            valueStr.append("?").append(",");
        }
        keyStr.replace(keyStr.length() - 1, keyStr.length(), ")");
        valueStr.replace(valueStr.length() - 1, valueStr.length(), ")");

        insertStr.append(keyStr.toString()).append(" VALUES ").append(valueStr.toString()).append(";");
        PreparedStatement statement = null;
        statement = this.connection.prepareStatement(insertStr.toString());

        //add values
        Set<String> keys = saveRecord.keySet();
        String[] keysArr = keys.toArray(new String[keys.size()]);
        HashMap<String, String> columns = getColumns();


        for (int i = 0; i < keysArr.length; i++) {
            if (columns.get(keysArr[i]).equals("boolean"))
                statement.setBoolean(i + 1, (boolean) saveRecord.get(keysArr[i]));
            else if (columns.get(keysArr[i]).equals("DECIMAL(11)"))
                statement.setBigDecimal(i + 1, (BigDecimal) saveRecord.get(keysArr[i]));
            else
                statement.setString(i + 1, (String) saveRecord.get(keysArr[i]));
        }

        //empty the saveRecord
        saveRecord = new HashMap<>();
        return !statement.execute();
    }

    public boolean save(String str) throws SQLException {

        PreparedStatement statement = null;
        statement = this.connection.prepareStatement("INSERT INTO " + getTable_name() + " " + str + ";");
        return !statement.execute();
    }

    public void set(String column, Object value) {
        this.saveRecord.put(column, value);
    }

    public boolean save(HashMap<String, String> record) throws SQLException {
        throw new NotImplementedException();
    }

    public boolean save(String[] record) throws SQLException {
        StringBuilder insertStr = new StringBuilder("INSERT INTO " + getTable_name() + " (");
        for (String val : record) {
            insertStr.append(val).append(",");
        }

        insertStr.replace(insertStr.length() - 1, insertStr.length(), ");");

        Statement statement = this.connection.createStatement();
        return statement.execute(insertStr.toString());
    }

    public JSONArray find(String query) throws SQLException {

        PreparedStatement stm = this.connection.prepareStatement(query);
        ResultSet row = stm.executeQuery();

        ResultSetMetaData rsmd = row.getMetaData();
        int columnList = rsmd.getColumnCount();

        //create a JSONObject with the data
        JSONArray res = new JSONArray();
        while (row.next()) {
            JSONObject tmp = new JSONObject();
            for(int i = 0; i < columnList; i++){
                tmp.put(rsmd.getColumnName(i+1), row.getObject(rsmd.getColumnName(i+1)));
            }
            res.put(tmp);
        }
        return res;
    }


    public JSONArray find(String[] columns, String where, int limit) throws SQLException {
        StringBuilder findSQL = new StringBuilder("SELECT ");
        if (columns == null || columns.length == 0)
            findSQL.append("* ");
        else {
            for (String column : columns) {
                findSQL.append(column).append(",");
            }
            findSQL.delete(findSQL.length() - 1, findSQL.length()); //remove the last ,
        }

        findSQL.append(" FROM ").append(getTable_name());
        if (where != null) {
            findSQL.append(" WHERE ").append(where);
        }
        if (limit > 0) {
            findSQL.append(" LIMIT ").append(limit);
        }

        PreparedStatement stm = this.connection.prepareStatement(findSQL.toString());
        ResultSet row = stm.executeQuery();

        //create a JSONObject with the data
        JSONArray res = new JSONArray();

        while (row.next()) {

            JSONObject tmp = new JSONObject();
            if (columns == null || columns.length == 0) {

                for (Object column : getColumns().keySet()) {
                    Object obj = row.getObject(column.toString());
                    if (obj != null)
                        tmp.put(column.toString(), obj);
                }

            } else {
                for (String column : columns) {
                    tmp.put(column, row.getObject(column));
                }

            }
            res.put(tmp);
        }
        return res;
    }

    public JSONObject findOne(String[] columns, String where) throws SQLException {
        StringBuilder findSQL = new StringBuilder("SELECT ");
        if (columns == null || columns.length == 0)
            findSQL.append("* ");
        else {
            for (String column : columns) {
                findSQL.append(column).append(",");
            }
            findSQL.delete(findSQL.length() - 1, findSQL.length()); //remove the last ,
        }

        findSQL.append(" FROM ").append(getTable_name());
        if (where != null) {
            findSQL.append(" WHERE ").append(where);
        }

//        System.out.println(findSQL.toString());
        PreparedStatement stm = this.connection.prepareStatement(findSQL.toString());
        ResultSet row = stm.executeQuery();

        //create a JSONObject with the data
        JSONObject res = new JSONObject();
        if (row.next()) {
            if (columns == null) {
                for (String column : getColumns().keySet()) {
                    res.put(column, row.getObject(column));
                }
                return res;
            }
            for (String column : columns) {
                res.put(column, row.getObject(column));
            }
        }

        return res;
    }

    public boolean remove(String where) throws SQLException {
        StringBuilder removeSQL = new StringBuilder("DELETE FROM ").append(getTable_name()).append(" WHERE ");
        if (where == null)
            throw new TypeNotPresentException("where need to be a valid where clause", null);
        else
            removeSQL.append(where);

        System.out.println(removeSQL.toString());
        PreparedStatement stm = this.connection.prepareStatement(removeSQL.toString());
        return stm.execute();
    }


    public boolean update(HashMap<String, ?> record, String id) throws SQLException {

        if (record == null || record.size() == 0 || id.equals("0")) {
            throw new TypeNotPresentException("where need to be a valid where clause", null);
        }
        ArrayList<Object> tmp = new ArrayList<>();

        StringBuilder updateSQL = new StringBuilder("UPDATE ").append(getTable_name()).append(" SET ");
        Set<String> keys = record.keySet();
        for (String key : keys) {
            updateSQL.append(key).append(" = ").append("?").append(",");
            tmp.add(record.get(key));
        }

        updateSQL.delete(updateSQL.length() - 1, updateSQL.length()); //remove the last ,
        updateSQL.append(" WHERE id = ").append(id).append(";");

        PreparedStatement stm = null;
        stm = this.connection.prepareStatement(updateSQL.toString());

        //add values
        String[] keysArr = keys.toArray(new String[keys.size()]);

        HashMap<String, String> columns = getColumns();

        for (int i = 0; i < tmp.size(); i++) {
            if (columns.get(keysArr[i]).equals("boolean"))
                stm.setBoolean(i + 1, (boolean) tmp.get(i));
            else if (columns.get(keysArr[i]).equals("DECIMAL(11)"))
                stm.setBigDecimal(i + 1, (BigDecimal) tmp.get(i));
            else
                stm.setString(i + 1, (String) tmp.get(i));
        }

        System.out.println(stm.toString());
        return stm.execute();
    }


    public boolean truncate() throws SQLException {
        PreparedStatement stm = this.connection.prepareStatement("TRUNCATE "+getTable_name());
        return stm.execute();
    }
//
//    public boolean update(String query, int id) throws SQLException {
//        StringBuilder updateSQL = new StringBuilder("UPDATE ").append(getTable_name()).append(query);
//        PreparedStatement stm = this.connection.prepareStatement(updateSQL.toString());
//    }
}
