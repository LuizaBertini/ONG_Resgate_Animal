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
public class Usuario {    

    private String username, senha;
    private int id;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
  
    
    public Usuario(int id, String username, String senha){        
        this.id = id;
        this.username = username;
        this.senha = senha;
    }
     public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS sql10403882.USUARIO ("      
         +"id NUMBER PRIMARY KEY NOT NULL, "
         +"username VARCHAR(200)  NOT NULL, "
         +"senha VARCHAR2(200) NOT NULL"
         + ")" ;
    }
     
     public static ArrayList<Usuario> getList() throws Exception{
         ArrayList<Usuario> list = new ArrayList<>();
         System.out.println("init 1");
                 
        Connection con = null; Statement stmt = null; ResultSet rs;
        Exception methodException;
        try {
            
            con = dbListener.getConnection();
            stmt = con.createStatement(); 
                   
            rs = stmt.executeQuery("SELECT id, username, senha FROM USUARIO;");
            while(rs.next()){
            list.add(new Usuario(
            rs.getInt("id"),
            rs.getString("username"),
            rs.getString("senha")       
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
   
    public static void InsertList(int id,  String username, String senha) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        Exception methodException = null;
        ResultSet rs = null;
        try{                   
            
            con = dbListener.getConnection();            
            stmt = con.prepareStatement("INSERT INTO USUARIO"
                            + "(id, username, senha) VALUES "
                           + "(?, ?, ?)");  
            stmt.setInt(1, id);
            stmt.setString(2, username);
            stmt.setString(3, senha);
           
            stmt.execute();
            
        } catch(Exception ex){
            methodException =  ex;
        }finally{            
           try{stmt.close(); }catch(Exception ex2){}         
           try{ con.close();}catch(Exception ex2){}     
        }   
    }
      
   public static void Insert(String username, String senha) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        Statement st;
        Exception methodException = null;
        ResultSet rs = null;
        int id = 0;
        try{        
                 
            con = dbListener.getConnection(); 
            st = con.createStatement(); 
            rs = st.executeQuery("SELECT max(id)+1 id FROM USUARIO;");
            while(rs.next()){
                id = rs.getInt("id");
            } 
            stmt = con.prepareStatement("INSERT INTO USUARIO "
                            + "(id, username, senha) VALUES "
                           + "(?, ?, ?)");  
            stmt.setInt(1, id);
            stmt.setString(2, username);
            stmt.setString(3, senha);
           
            stmt.execute();
            
        } catch(Exception ex){
            methodException =  ex;
            System.out.println("erro 111 "+methodException.toString());
        }finally{            
           try{stmt.close(); }catch(Exception ex2){}         
           try{ con.close();}catch(Exception ex2){}     
        }   
    }
       public static void UpdatetSenha(int id, String username, String senha, String newSenha) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        Exception methodException = null;
        ResultSet rs = null;
        try{        
                  
            con = dbListener.getConnection(); 
            stmt = con.prepareStatement("UPDATE USUARIO "
                            + "SET id  = ?, "
                            + "username = ?, "
                            + "senha = ? "
                           + "WHERE id = ?");  
            stmt.setInt(1, id);
            stmt.setString(2, username);
            stmt.setString(3, newSenha);
            stmt.setInt(4, id);
            stmt.execute();
            
        } catch(Exception ex){
            methodException =  ex;
        }finally{            
           try{stmt.close(); }catch(Exception ex2){}         
           try{ con.close();}catch(Exception ex2){}     
        }   
    }
        public static void DeletetList(int id) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        Exception methodException = null;
        ResultSet rs = null;
        try{        
                  
            con = dbListener.getConnection(); 
            stmt = con.prepareStatement("DELETE FROM USUARIO "                            
                           + "WHERE id = ?");  
            stmt.setInt(1, id);            
            stmt.execute();
            
        } catch(Exception ex){
            methodException =  ex;
        }finally{            
           try{stmt.close(); }catch(Exception ex2){}         
           try{ con.close();}catch(Exception ex2){}     
        }   
    }
}

