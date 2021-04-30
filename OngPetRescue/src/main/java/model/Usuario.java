/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;
import java.util.ArrayList;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import web.dbListener;
/**
 *
 * @author uilsa
 */
public class Usuario {    

    private String username, senha, role, email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
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
  
    
    public Usuario(int id, String username, String senha, String role, String email){        
        this.id = id;
        this.username = username;
        this.senha = senha;
        this.role = role;
        this.email = email;
    }
     public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS sql10403882.USUARIO ("      
         +"id INTEGER PRIMARY KEY NOT NULL, "
         +"username VARCHAR(200)  NOT NULL, "
         +"senha VARCHAR(200) NOT NULL"
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
                   
            rs = stmt.executeQuery("SELECT id, username, senha, role, email FROM USUARIO;");
            while(rs.next()){
            list.add(new Usuario(
            rs.getInt("id"),
            rs.getString("username"),
            rs.getString("senha"),       
            rs.getString("role"),
            rs.getString("email")       
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
       public static void Update(int id, String username, String senha) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        Exception methodException = null;
        ResultSet rs = null;
        try{        
                  
            con = dbListener.getConnection(); 
            stmt = con.prepareStatement("UPDATE USUARIO "
                            + "SET username = ?, "
                            + "senha = ? "
                           + "WHERE id = ?");  
            stmt.setString(1, username);
            stmt.setString(2, senha);
            stmt.setInt(3, id);
            stmt.execute();
            
        } catch(Exception ex){
            methodException =  ex;
        }finally{            
           try{stmt.close(); }catch(Exception ex2){}         
           try{ con.close();}catch(Exception ex2){}     
        }   
    }
     
      public static String InsertNewUsuario(String nome,String username, String senha, String endereco, String email, String dtnascimento, String rg, String cpf, String telefone) throws Exception{
       Connection con = null;
        PreparedStatement stmt = null;
        Statement st;
        Exception methodException = null;
        ResultSet rs = null;
        int id = 0;
        String ponto = "";
        try{        
            

            con = dbListener.getConnection(); 
            st = con.createStatement(); 
            rs = st.executeQuery("SELECT max(id)+1 id FROM USUARIO;");           
            while(rs.next()){
                id = rs.getInt("id");
            } 
            stmt = con.prepareStatement("INSERT INTO USUARIO "
                            + "(id, nome, username, senha, endereco, email, registro_geral, cpf, telefone) VALUES "
                           + "(?, ?, ?, ?, ?, ?, ?, ?, ? );");  
            stmt.setInt(1, id);
            stmt.setString(2, nome);
            stmt.setString(3, username);
            stmt.setString(4, senha);
            stmt.setString(5, endereco);
            stmt.setString(6, email);            
            stmt.setString(7, rg);
            stmt.setString(8, cpf);
            stmt.setString(9, telefone);           
            stmt.execute();
        } catch(Exception ex){
            methodException =  ex;
            ponto = methodException.toString();
        }finally{            
           try{stmt.close(); }catch(Exception ex2){}         
           try{ con.close();}catch(Exception ex2){}     
        }   
        return ponto;
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
    
    public static Usuario getUsuario(String username, String senha) throws Exception{
        Usuario user = null;
        Connection con = null; PreparedStatement stmt = null; ResultSet rs = null;
        Exception methodException = null;
        try {
            con = dbListener.getConnection();
            stmt = con.prepareStatement("SELECT * FROM USUARIO "
                    + "WHERE username = ? AND senha = ?");
            stmt.setString(1, username);
            stmt.setString(2, senha);
            rs = stmt.executeQuery();
            while (rs.next()) {
                user = new Usuario(               
                rs.getInt("id"),
                rs.getString("username"),
                rs.getString("senha"),
                rs.getString("role"),
                rs.getString("email")
                );
            }
        } catch (Exception ex) {
           methodException = ex;
           
        }finally{
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
            try{rs.close();}catch(Exception ex2){}
            
        }
        if(methodException != null) throw methodException;
        return user;
    }
    
    public static void changePassword(String username, String novaSenha) throws Exception{
        Usuario user = null;
        Connection con = null; PreparedStatement stmt = null; ResultSet rs = null;
        Exception methodException = null;
        try {
            con = dbListener.getConnection();
            stmt = con.prepareStatement("UPDATE USUARIO SET senha = ? WHERE username = ?");
            stmt.setString(1, novaSenha);
            stmt.setString(2, username);
            stmt.execute();
        } catch (Exception ex) {
           methodException = ex;
           
        }finally{
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
            try{rs.close();}catch(Exception ex2){}
            
        }
        if(methodException != null) throw methodException;
        
    }
    
    
}

