/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.*;
import java.util.ArrayList;
import web.dbListener;

/**
 *
 * @author trize
 */
public class Adotados {
    private String nomeAnimal, dtAdocao, corAnimal; 

    public Adotados(String nomeAnimal, String dtAdocao, String corAnimal) {
        this.nomeAnimal = nomeAnimal;
        this.dtAdocao = dtAdocao;
        this.corAnimal = corAnimal;
    }

    public String getNomeAnimal() {
        return nomeAnimal;
    }

    public void setNomeAnimal(String nomeAnimal) {
        this.nomeAnimal = nomeAnimal;
    }

    public String getDtAdocao() {
        return dtAdocao;
    }

    public void setDtAdocao(String dtAdocao) {
        this.dtAdocao = dtAdocao;
    }

    public String getCorAnimal() {
        return corAnimal;
    }

    public void setCorAnimal(String corAnimal) {
        this.corAnimal = corAnimal;
    }

 
    public static ArrayList<Adotados> getListADT() throws Exception{
        ArrayList<Adotados> lista = new ArrayList<>();              
        Connection con = null; Statement stmt = null; ResultSet rs;
        String query = ("SELECT a.nomeAnimal, a.dtAdocao, a.corAnimal FROM ADOCAO ad, ANIMAIS a, USUARIO u "
                    + " WHERE ad.idUsuario = u.id"
                    + " AND ad.idAnimal = a.idAnimal;");
        Exception methodException;
        try {
            con = dbListener.getConnection();            
            stmt = con.createStatement();            
            rs = stmt.executeQuery(query);
            
            while(rs.next()){
            lista.add(new Adotados(
            rs.getString("nomeAnimal"),
            rs.getString("dtAdocao"),
            rs.getString("corAnimal")
            ));            
            }
        } catch(Exception ex){
            methodException =  ex;
            
        }finally{            
           try{stmt.close(); }catch(Exception ex2){}         
           try{ con.close();}catch(Exception ex2){}     
        }
    return lista;
    }
    
}
