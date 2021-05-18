/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.sql.*;
import web.dbListener;
/**
 *
 * @author trize
 */
public class Animal {

    private String nomeAnimal, corAnimal, dtResgate, dtAdocao, nmRaca, nmEspecie;
    private int idAnimal, idRacaFK, idEspecieFK;
    private float pesoAnimal;
    String imgAnimal; //uiam
    
    
    public Animal(String nomeAnimal, String corAnimal, String dtResgate, String dtAdocao, int idAnimal, float pesoAnimal, int idRacaFK, int idEspecieFK, String nmRaca, String nmEspecie) {
        this.nomeAnimal = nomeAnimal;
        this.corAnimal = corAnimal;
        this.dtResgate = dtResgate;
        this.dtAdocao = dtAdocao;
        this.idAnimal = idAnimal;
        this.pesoAnimal = pesoAnimal;
        this.idRacaFK = idRacaFK;
        this.idEspecieFK = idEspecieFK;
        this.nmRaca = nmRaca;
        this.nmEspecie = nmEspecie;
    }

    public static String getCreateStatement() {
        return "CREATE TABLE IF NOT EXISTS sql10403882.ANIMAIS(" 
                +"idAnimal INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL," 
                +"idRacaFK INTEGER NOT NULL," 
                +"idEspecieFK INTEGER NOT NULL," 
                +"pesoAnimal DECIMAL(5,2)," 
                +"nomeAnimal VARCHAR(200),"
                +"corAnimal VARCHAR(50)," 
                +"dtResgate DATE,"
                +"dtAdocao DATE,"
                +"imgAnimal," //uiam
                +"FOREIGN KEY (idRacaFK) REFERENCES sql10403882.RACAS(idRaca)," 
                +"FOREIGN KEY (idEspecieFK) REFERENCES sql10403882.ESPECIES(idEspecie));";
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
            rs = stmt.executeQuery("SELECT e.nmEspecie, r.nmRaca, a.*    FROM ESPECIES e, RACAS r, ANIMAIS a    WHERE r.idRaca = a.idRacaFK    AND e.idEspecie = a.idEspecieFK ORDER BY idAnimal;");
            while (rs.next()) {
                list.add(new Animal(
                        rs.getString("nomeAnimal"),
                        rs.getString("corAnimal"),
                        rs.getString("dtResgate"),
                        rs.getString("dtAdocao"),
                        rs.getInt("idAnimal"),
                        rs.getFloat("pesoAnimal"),
                        rs.getInt("idRacaFK"),
                        rs.getInt("idEspecieFK"),
                        rs.getString("nmRaca"),
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
    
    public static ArrayList<Animal> getListNadt() throws Exception {
        ArrayList<Animal> list = new ArrayList<>();
        Connection con = null;
        Statement stmt = null;
        ResultSet rs;
        Exception methodException;
        try {
            con = dbListener.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT e.nmEspecie, r.nmRaca, a.*    FROM ESPECIES e, RACAS r, ANIMAIS a   WHERE r.idRaca = a.idRacaFK    AND e.idEspecie = a.idEspecieFK AND dtAdocao IS NULL;");
            while (rs.next()) {
                list.add(new Animal(
                        rs.getString("nomeAnimal"),
                        rs.getString("corAnimal"),
                        rs.getString("dtResgate"),
                        rs.getString("dtAdocao"),
                        rs.getInt("idAnimal"),
                        rs.getFloat("pesoAnimal"),
                        rs.getInt("idRacaFK"),
                        rs.getInt("idEspecieFK"),
                        rs.getString("nmRaca"),
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

    public static void InsertList(String nomeAnimal, String corAnimal, String dtResgate, String dtAdocao, int idAnimal, float pesoAnimal, int idRacaFK, int idEspecieFK) //uiam
    throws Exception {
        Connection con = null;
        PreparedStatement stmt = null;
        Exception methodException = null;
        ResultSet rs = null;
        FileInputStream  fis = null;
        try {

            con = dbListener.getConnection();
            stmt = con.prepareStatement("INSERT INTO ANIMAIS"
                    + "(nomeAnimal, corAnimal, dtResgate, dtAdocao, idAnimal, pesoAnimal, idRacaFK, idEspecieFK, imgAnimal)" //uiam
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"); //uiam
            stmt.setString(1, nomeAnimal);
            stmt.setString(2, corAnimal);
            stmt.setString(3, dtResgate);
            stmt.setString(4, dtAdocao);
            stmt.setInt(5, idAnimal);
            stmt.setFloat(6, pesoAnimal);
            stmt.setInt(7, idRacaFK);
            stmt.setInt(8, idEspecieFK);
            /*File image= new File(imgAnimal);
            fis=new FileInputStream(image);
            stmt.setBinaryStream(9, (InputStream) fis, (int) (image.length()));*/
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

    public static void Insert(String nomeAnimal, String corAnimal, String dtResgate, float pesoAnimal, int idRacaFK, int idEspecieFK
     /* ,String imgAnimal*/ ) throws Exception {
        Connection con = null;
        PreparedStatement stmt = null;
        Statement st;
        Exception methodException = null;
        ResultSet rs = null;
        /*File file = new File(imgAnimal);
        FileInputStream input = new FileInputStream(file);*/
        try {
            con = dbListener.getConnection();
            st = con.createStatement();
            rs = st.executeQuery("SELECT idAnimal FROM ANIMAIS;");
            stmt = con.prepareStatement("INSERT INTO ANIMAIS"
                    + "(nomeAnimal, corAnimal, dtResgate, pesoAnimal, idRacaFK, idEspecieFK)" //uiam , imgAnimal, urlImgAnimal
                    + "VALUES (?, ?, ?, ?, ?, ?)"); /*, ?, ?*/
            stmt.setString(1, nomeAnimal);
            stmt.setString(2, corAnimal);
            stmt.setString(3, dtResgate);
            stmt.setFloat(4, pesoAnimal);
            stmt.setInt(5, idRacaFK);
            stmt.setInt(6, idEspecieFK);
            /*stmt.setBinaryStream(7, (InputStream) input, (int) (file.length()));
            stmt.setString(8, imgAnimal);*/
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

    public static void Update(String nomeAnimal, String corAnimal, String dtResgate, String dtAdocao, int idAnimal, float pesoAnimal, int idRacaFK, int idEspecieFK
     /* ,String imgAnimal*/ 
    ) throws Exception 
            
    {
        String etapa = "";
        Connection con = null;
        PreparedStatement stmt = null;
        Exception methodException = null;
        ResultSet rs = null;
        /*File file = new File(imgAnimal);
        FileInputStream input = new FileInputStream(file);*/
        try {
            con = dbListener.getConnection();
            stmt = con.prepareStatement("UPDATE ANIMAIS "
                    + "SET nomeAnimal = ?, corAnimal = ?, "
                    + "dtResgate = ?, dtAdocao = ?, pesoAnimal = ?, idRacaFK = ?, idEspecieFK = ?"
                    /*+ ", imgAnimal = ?, urlImgAnimal = ? "*/
                    + "WHERE idAnimal = ?;");
            stmt.setString(1, nomeAnimal);
            stmt.setString(2, corAnimal);
            stmt.setString(3, dtResgate);
            stmt.setString(4, dtAdocao);
            stmt.setFloat(5, pesoAnimal);
            stmt.setFloat(6, idRacaFK);
            stmt.setFloat(7, idEspecieFK);       
            /*stmt.setBinaryStream(8, (InputStream) input, (int) (file.length()));
            stmt.setString(9, imgAnimal);*/
            stmt.setInt(10, idAnimal);
            stmt.execute();          

        } catch (Exception ex) {
            methodException =   ex;
        } finally {
            try {
                stmt.close();
            } catch (Exception ex2) {
                methodException =   ex2;
            }
            try {
                con.close();
            } catch (Exception ex2) {
                methodException =   ex2;
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

    public int getIdRacaFK() {
        return idRacaFK;
    }

    public void setIdRacaFK(int idRacaFK) {
        this.idRacaFK = idRacaFK;
    }

    public int getIdEspecieFK() {
        return idEspecieFK;
    }

    public void setIdEspecieFK(int idEspecieFK) {
        this.idEspecieFK = idEspecieFK;
    }
    /**/

    public String getNmRaca() {
        return nmRaca;
    }

    public void setNmRaca(String nmRaca) {
        this.nmRaca = nmRaca;
    }

    public String getNmEspecie() {
        return nmEspecie;
    }

    public void setNmEspecie(String nmEspecie) {
        this.nmEspecie = nmEspecie;
    } 
}
