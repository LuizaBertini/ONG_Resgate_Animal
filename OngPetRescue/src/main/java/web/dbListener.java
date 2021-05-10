package web;



import java.sql.*;

/**
 * Web application lifecycle listener.
 *
 * @author uilsa
 */
public class dbListener {

    public static final String CLASS_NAME = "com.mysql.cj.jdbc.Driver";
    public static final String DB_URL = "jdbc:mysql://sql10.freemysqlhosting.net:3306/sql10403882?zeroDateTimeBehavior=CONVERT_TO_NULL";

    public static String exceptionMessage = null;

    public static Connection getConnection() throws Exception {
        Class.forName(CLASS_NAME);
        return DriverManager.getConnection(DB_URL, "sql10403882", "Yu8gDlNRKl");
    }

    public String getTeste() throws Exception {
        return "jdbc:mysql://sql10.freemysqlhosting.net:3306/sql10403882?zeroDateTimeBehavior=CONVERT_TO_NULL";
    }   
}
