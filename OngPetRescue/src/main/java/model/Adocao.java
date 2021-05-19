/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


import java.util.ArrayList;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import web.dbListener;
/**
 *
 * @author uilsa
 */
public class Adocao {
    
    private int idAnimal, idUsuario;
    private String dtAdocao;

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

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    public Adocao(int idAnimal, int idUsuario, String dtAdocao) {
        this.idAnimal = idAnimal;
        this.idUsuario = idUsuario;
        this.dtAdocao = dtAdocao;
    }
    
    
     public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS sql10403882.ADOCAO(" +
               "idAdocao INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL," +
               "idAnimal INTEGER NOT NULL," +
               "idUsuario INTEGER NOT NULL," +
               "FOREIGN KEY (idAnimal) REFERENCES sql10403882.ANIMAIS(idAnimal)," +
               "FOREIGN KEY (idUsuario) REFERENCES sql10403882.USUARIO(id));" ;
    }
     
     public static ArrayList<Adocao> getList() throws Exception{
         ArrayList<Adocao> list = new ArrayList<>();
         System.out.println("init 1");                 
        Connection con = null; Statement stmt = null; ResultSet rs;
        Exception methodException;
        try {
            
            con = dbListener.getConnection();
            stmt = con.createStatement(); 
                   
            rs = stmt.executeQuery("SELECT idAnimal, idUsuario FROM ADOCAO;");
            while(rs.next()){
            list.add(new Adocao(
            rs.getInt("idAnimal"),
            rs.getInt("idUsuario"),
            rs.getString("")
            ));            
            }
        } catch(Exception ex){
            methodException =  ex;
            
        }finally{            
           try{stmt.close(); }catch(Exception ex2){}         
           try{ con.close();}catch(Exception ex2){}     
        }
    return list;
    }
   
    public static void InsertList(int idAnimal, int idUsuario) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        Exception methodException = null;
        ResultSet rs = null;
        try{                   
            LocalDateTime agora = LocalDateTime.now();
            // formatar a data
            DateTimeFormatter formatterData = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            String dataFormatada = formatterData.format(agora);
            
            con = dbListener.getConnection();            
            stmt = con.prepareStatement("INSERT INTO ADOCAO "
                            + "(idAnimal, idUsuario, dtRequisicao) VALUES "
                           + "(?, ?, ?)");  
            stmt.setInt(1, idAnimal);
            stmt.setInt(2, idUsuario);
            stmt.setString(3, dataFormatada);
            stmt.execute();
            
        } catch(Exception ex){
            methodException =  ex;
        }finally{            
           try{stmt.close(); }catch(Exception ex2){}         
           try{ con.close();}catch(Exception ex2){}     
        }   
    }
    public static void InsertDtAdocao(String dtAdocao, int idAnimal) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        Exception methodException = null;
        ResultSet rs = null;
        try{                   
            
            con = dbListener.getConnection();
            stmt = con.prepareStatement("UPDATE ANIMAIS SET dtAdocao = ?"
                            + " WHERE idAnimal = ?;"); 
            stmt.setString(1, dtAdocao);
            stmt.setInt(2, idAnimal);
            
            stmt.execute();
            
        } catch(Exception ex){
            methodException =  ex;
        }finally{            
           try{stmt.close(); }catch(Exception ex2){}         
           try{ con.close();}catch(Exception ex2){}     
        }   
    }
    
    
   /* public static void UpdateList(String nome, String nomeAntigo, String descricao) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        Exception methodException = null;
        ResultSet rs = null;
        try{                   
            
            con = dbListener.getConnection();            
            stmt = con.prepareStatement("UPDATE ROLE"
                            + " set nome = ?, descricao = ? "
                           + "where nome = ?");  
            stmt.setString(1, nome);
            stmt.setString(2, descricao);
            stmt.setString(3, nomeAntigo);
            stmt.execute();
            
        } catch(Exception ex){
            methodException =  ex;
        }finally{            
           try{stmt.close(); }catch(Exception ex2){}         
           try{ con.close();}catch(Exception ex2){}     
        }   
    }
   public static void DeleteList(String nome) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        Exception methodException = null;
        ResultSet rs = null;
        try{                   
            
            con = dbListener.getConnection();            
            stmt = con.prepareStatement("DELETE FROM ROLE"
                            + " WHERE nome = ? ;");  
            stmt.setString(1, nome);           
            stmt.execute();
            
        } catch(Exception ex){
            methodException =  ex;
        }finally{            
           try{stmt.close(); }catch(Exception ex2){}         
           try{ con.close();}catch(Exception ex2){}     
        }   
    }*/
}
