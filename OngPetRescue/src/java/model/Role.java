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
 * @author uilsa
 */
public class Role {
    private String nome;
    private String descricao;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String Descricao) {
        this.descricao = Descricao;
    }
     public Role(String nome, String descricao){        
        this.nome = nome;
        this.descricao = descricao;
    }
     public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS ROLE("      
         +"nome VARCHAR2(50) PRIMARY KEY NOT NULL, "
         +"descricao VARCHAR(200)  NOT NULL"
         + ");" ;
    }
     
     public static ArrayList<Role> getList() throws Exception{
         ArrayList<Role> list = new ArrayList<>();
         System.out.println("init 1");                 
        Connection con = null; Statement stmt = null; ResultSet rs;
        Exception methodException;
        try {
            
            con = dbListener.getConnection();
            stmt = con.createStatement(); 
                   
            rs = stmt.executeQuery("SELECT nome, descricao FROM ROLE;");
            while(rs.next()){
            list.add(new Role(
            rs.getString("nome"),
            rs.getString("descricao")      
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
   
    public static void InsertList(String nome, String descricao) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        Exception methodException = null;
        ResultSet rs = null;
        try{                   
            
            con = dbListener.getConnection();            
            stmt = con.prepareStatement("INSERT INTO ROLE "
                            + "(nome, descricao) VALUES "
                           + "(?, ?)");  
            stmt.setString(1, nome);
            stmt.setString(2, descricao);
           
            stmt.execute();
            
        } catch(Exception ex){
            methodException =  ex;
        }finally{            
           try{stmt.close(); }catch(Exception ex2){}         
           try{ con.close();}catch(Exception ex2){}     
        }   
    }
    
    public static void UpdateList(String nome, String nomeAntigo, String descricao) throws Exception{
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
    }
}
