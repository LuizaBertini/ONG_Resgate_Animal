/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import web.dbListener;

/**
 *
 * @author uilsa
 */
public class AguardaAdocao {
    private String nomeAnimal, dtRequisicao, corAnimal, nmUsuario; 
    private int idUsuario, idAnimal;

    public String getDtRequisicao() {
        return dtRequisicao;
    }

    public void setDtRequisicao(String dtRequisicao) {
        this.dtRequisicao = dtRequisicao;
    }

    public int getIdAnimal() {
        return idAnimal;
    }

    public void setIdAnimal(int idAnimal) {
        this.idAnimal = idAnimal;
    }

    public String getNomeAnimal() {
        return nomeAnimal;
    }

    public void setNomeAnimal(String nomeAnimal) {
        this.nomeAnimal = nomeAnimal;
    }

    public String getDtAdocao() {
        return dtRequisicao;
    }

    public void setDtAdocao(String dtRequisicao) {
        this.dtRequisicao = dtRequisicao;
    }

    public String getCorAnimal() {
        return corAnimal;
    }

    public void setCorAnimal(String corAnimal) {
        this.corAnimal = corAnimal;
    }

    public String getNmUsuario() {
        return nmUsuario;
    }

    public void setNmUsuario(String nmUsuario) {
        this.nmUsuario = nmUsuario;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    public AguardaAdocao(int idAnimal, String nomeAnimal, String dtRequisicao, String corAnimal, String nmUsuario, int idUsuario) {
        this.nomeAnimal = nomeAnimal;
        this.dtRequisicao = dtRequisicao;
        this.corAnimal = corAnimal;
        this.nmUsuario = nmUsuario;
        this.idUsuario = idUsuario;
        this.idAnimal = idAnimal;
    }
       public static ArrayList<AguardaAdocao> getListAguarAdocao() throws Exception{
        ArrayList<AguardaAdocao> lista = new ArrayList<>();              
        Connection con = null; Statement stmt = null; ResultSet rs;
        String query = ("SELECT a.idAnimal, a.nomeAnimal, ad.dtRequisicao, a.corAnimal, u.nome, u.id FROM ADOCAO ad, ANIMAIS a, USUARIO u "
                    + " WHERE ad.idUsuario = u.id"
                    + " AND a.dtAdocao IS NULL"
                    + " AND ad.idAnimal = a.idAnimal;");
        Exception methodException;
        //lista.add(new AguardaAdocao(99,"teste","01/01/2021","preto","joaquim",98));
        try {
            con = dbListener.getConnection();            
            stmt = con.createStatement();            
            rs = stmt.executeQuery(query);
            
            while(rs.next()){
            lista.add(new AguardaAdocao(
            rs.getInt("idAnimal"),
            rs.getString("nomeAnimal"),
            rs.getString("dtRequisicao"),
            rs.getString("corAnimal"),
            rs.getString("nome"),
            rs.getInt("id")        
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

        public static void InsertDtAdocao(int idAnimal) throws Exception{
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
            stmt = con.prepareStatement("UPDATE ANIMAIS SET dtAdocao = ?"
                            + " WHERE idAnimal = ?;"); 
            stmt.setString(1, dataFormatada);
            stmt.setInt(2, idAnimal);
            
            stmt.execute();
            
        } catch(Exception ex){
            methodException =  ex;
        }finally{            
           try{stmt.close(); }catch(Exception ex2){}         
           try{ con.close();}catch(Exception ex2){}     
        }   
    }
}
