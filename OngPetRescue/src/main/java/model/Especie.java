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
public class Especie {

    private int idEspecie;
    private String nmEspecie;

    public static String getCreateStatement() {
        return "CREATE TABLE IF NOT EXISTS sql10403882.ESPECIES("
                + "idEspecie INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,"
                + "nmEspecie VARCHAR(200));";
    }
    
    public static ArrayList<Especie> getList() throws Exception {
        ArrayList<Especie> list = new ArrayList<>();
        Connection con = null;
        Statement stmt = null;
        ResultSet rs;
        Exception methodException;
        try {
            con = dbListener.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM ESPECIES;");
            while (rs.next()) {
                list.add(new Especie(
                        rs.getInt("idEspecie"),
                        rs.getString("nmEspecie")
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
    
    public int getIdEspecie() {
        return idEspecie;
    }

    public void setIdEspecie(int idEspecie) {
        this.idEspecie = idEspecie;
    }

    public String getNmEspecie() {
        return nmEspecie;
    }

    public void setNmEspecie(String nmEspecie) {
        this.nmEspecie = nmEspecie;
    }

    public Especie(int idEspecie, String nmEspecie) {
        this.idEspecie = idEspecie;
        this.nmEspecie = nmEspecie;
    }
    
}
