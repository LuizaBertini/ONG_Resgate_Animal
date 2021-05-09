/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import web.dbListener;
import model.Role;
/**
 *
 * @author uilsa
 */
public class Teste {
    public static String exceptionMessage = null;
    public String getTeste(){      
                    
        Connection con = null; Statement stmt = null; ResultSet rs;
        Exception methodException;
        String st = "";
        try {            
            con = getConnection();
            stmt = con.createStatement(); 
                   
            rs = stmt.executeQuery("SELECT nome, descricao FROM ROLE;");
            while(rs.next()){
            st = rs.getString("nome");
            }
            
        } catch(Exception ex){
            methodException =  ex;
            
        }finally{            
           try{stmt.close(); }catch(Exception ex2){}         
           try{ con.close();}catch(Exception ex2){}     
        }            
        return st;
    }
    
     public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://sql10.freemysqlhosting.net:3306/sql10403882?zeroDateTimeBehavior=CONVERT_TO_NULL", "sql10403882", "Yu8gDlNRKl");
    }
}
