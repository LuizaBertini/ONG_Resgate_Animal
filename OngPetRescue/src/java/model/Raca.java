/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import web.dbListener;

/**
 *
 * @author trize
 */
public class Raca {
        
    private int idRaca;
    private String nmRaca;

    public static String getCreateStatement() {
        return "CREATE TABLE IF NOT EXISTS sql10403882.RACAS("
                + "idRaca INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,"
                + "nmRaca VARCHAR(200));";
    }
    
        public static ArrayList<Raca> getList() throws Exception {
        ArrayList<Raca> list = new ArrayList<>();
        Connection con = null;
        Statement stmt = null;
        ResultSet rs;
        Exception methodException;
        try {
            con = dbListener.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM RACAS;");
            while (rs.next()) {
                list.add(new Raca(
                        rs.getInt("idRaca"),
                        rs.getString("nmRaca")
                ));
            }
        } catch (Exception ex) {
            methodException = ex;

        } finally {
            try {
                stmt.close();
            } catch (Exception ex2) {
            }
            try {
                con.close();
            } catch (Exception ex2) {
            }
        }
        return list;
    }

    
    public int getIdRaca() {
        return idRaca;
    }

    public void setIdRaca(int idRaca) {
        this.idRaca = idRaca;
    }

    public String getNmRaca() {
        return nmRaca;
    }

    public void setNmRaca(String nmRaca) {
        this.nmRaca = nmRaca;
    }

    public Raca(int idRaca, String nmRaca) {
        this.idRaca = idRaca;
        this.nmRaca = nmRaca;
    }
   
}
