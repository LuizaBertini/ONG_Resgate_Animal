/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.sql.*;
import web.dbListener;

/**
 *
 * @author trize
 */
public class Animal {

    private String nomeAnimal, corAnimal, dtResgate, dtAdocao;
    private int idAnimal;
    private float pesoAnimal;

    public Animal(String nomeAnimal, String corAnimal, String dtResgate, String dtAdocao, int idAnimal, float pesoAnimal) {
        this.nomeAnimal = nomeAnimal;
        this.corAnimal = corAnimal;
        this.dtResgate = dtResgate;
        this.dtAdocao = dtAdocao;
        this.idAnimal = idAnimal;
        this.pesoAnimal = pesoAnimal;
    }

    public static String getCreateStatement() {
        return "CREATE TABLE IF NOT EXISTS sql10403882.ANIMAIS("
                + "idAnimal INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,"
                + "pesoAnimal DECIMAL(5,2),"
                + "nomeAnimal VARCHAR(200),"
                + "corAnimal VARCHAR(50),"
                + "dtResgate DATE,"
                + "dtAdocao DATE);";
    }

    public static ArrayList<Animal> getList() throws Exception {
        ArrayList<Animal> list = new ArrayList<>();
        Connection con = null;
        Statement stmt = null;
        ResultSet rs;
        Exception methodException;
        try {
            con = dbListener.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM ANIMAIS;");
            while (rs.next()) {
                list.add(new Animal(
                        rs.getString("nomeAnimal"),
                        rs.getString("corAnimal"),
                        rs.getString("dtResgate"),
                        rs.getString("dtAdocao"),
                        rs.getInt("idAnimal"),
                        rs.getFloat("pesoAnimal")
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

    public static void InsertList(String nomeAnimal, String corAnimal, String dtResgate, String dtAdocao, int idAnimal, float pesoAnimal) throws Exception {
        Connection con = null;
        PreparedStatement stmt = null;
        Exception methodException = null;
        ResultSet rs = null;
        try {

            con = dbListener.getConnection();
            stmt = con.prepareStatement("INSERT INTO ANIMAIS"
                    + "(nomeAnimal, corAnimal, dtResgate, dtAdocao, idAnimal, pesoAnimal) VALUES "
                    + "(?, ?, ?, ?, ?, ?)");
            stmt.setString(1, nomeAnimal);
            stmt.setString(2, corAnimal);
            stmt.setString(3, dtResgate);
            stmt.setString(4, dtAdocao);
            stmt.setInt(5, idAnimal);
            stmt.setFloat(6, pesoAnimal);

            stmt.execute();

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
    }

    public static void Insert(String nomeAnimal, String corAnimal, String dtResgate, String dtAdocao, float pesoAnimal) throws Exception {
        Connection con = null;
        PreparedStatement stmt = null;
        Statement st;
        Exception methodException = null;
        ResultSet rs = null;
        try {
            con = dbListener.getConnection();
            st = con.createStatement();
            rs = st.executeQuery("SELECT idAnimal FROM ANIMAIS;");
            stmt = con.prepareStatement("INSERT INTO ANIMAIS "
                    + "(nomeAnimal, corAnimal, dtResgate, dtAdocao, pesoAnimal) VALUES "
                    + "(?, ?, ?, ?, ?)");
            stmt.setString(1, nomeAnimal);
            stmt.setString(2, corAnimal);
            stmt.setString(3, dtResgate);
            stmt.setString(4, dtAdocao);
            stmt.setFloat(5, pesoAnimal);

            stmt.execute();

        } catch (Exception ex) {
            methodException = ex;
            System.out.println("erro 111 " + methodException.toString());
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
    }

    public static void Update(String nomeAnimal, String corAnimal, String dtResgate, String dtAdocao, int idAnimal, float pesoAnimal) throws Exception {
        Connection con = null;
        PreparedStatement stmt = null;
        Exception methodException = null;
        ResultSet rs = null;
        try {
            con = dbListener.getConnection();
            stmt = con.prepareStatement("UPDATE ANIMAIS "
                    + "SET nomeAnimal = ?, corAnimal = ?, "
                    + "dtResgate = ?, dtAdocao = ?, pesoAnimal = ?"
                    + "WHERE idAnimal = ?;");
            stmt.setString(1, nomeAnimal);
            stmt.setString(2, corAnimal);
            stmt.setString(3, dtResgate);
            stmt.setString(4, dtAdocao);
            stmt.setFloat(5, pesoAnimal);
            stmt.setInt(6, idAnimal);
            
            stmt.execute();

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
    }

    public static void Delete(int idAnimal) throws Exception {
        Connection con = null;
        PreparedStatement stmt = null;
        Exception methodException = null;
        ResultSet rs = null;
        try {

            con = dbListener.getConnection();
            stmt = con.prepareStatement("DELETE FROM ANIMAIS "
                    + "WHERE idAnimal = ?");
            stmt.setInt(1, idAnimal);
            stmt.execute();

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
    }

    public String getNomeAnimal() {
        return nomeAnimal;
    }

    public void setNomeAnimal(String nomeAnimal) {
        this.nomeAnimal = nomeAnimal;
    }

    public String getCorAnimal() {
        return corAnimal;
    }

    public void setCorAnimal(String corAnimal) {
        this.corAnimal = corAnimal;
    }

    public String getDtResgate() {
        return dtResgate;
    }

    public void setDtResgate(String dtResgate) {
        this.dtResgate = dtResgate;
    }

    public String getDtAdocao() {
        return dtAdocao;
    }

    public void setDtAdocao(String dtAdocao) {
        this.dtAdocao = dtAdocao;
    }

    public int getIdAnimal() {
        return idAnimal;
    }

    public void setIdAnimal(int idAnimal) {
        this.idAnimal = idAnimal;
    }

    public float getPesoAnimal() {
        return pesoAnimal;
    }

    public void setPesoAnimal(float pesoAnimal) {
        this.pesoAnimal = pesoAnimal;
    }

}
