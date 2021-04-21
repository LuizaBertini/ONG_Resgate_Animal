package web;



import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import java.sql.*;
import model.Usuario;
import model.Role;
import javax.swing.JOptionPane;



/**
 * Web application lifecycle listener.
 *
 * @author uilsa
 */


public class dbListener implements ServletContextListener{
    public static final String CLASS_NAME = "com.mysql.cj.jdbc.Driver";
    public static final String DB_URL = "jdbc:mysql://sql10.freemysqlhosting.net:3306/sql10403882?zeroDateTimeBehavior=CONVERT_TO_NULL";
    
    public static String exceptionMessage = null;
    
    public static Connection getConnection() throws Exception{
         Class.forName(CLASS_NAME);
        return DriverManager.getConnection(DB_URL, "sql10403882","Yu8gDlNRKl");
    
    }
    
    @Override
    public void contextInitialized(ServletContextEvent sce){
        String etapa = "Inicialização";
        Connection con = null;
        Statement stmt = null;
        try {
            etapa = "Registrando a classe no driver";
            Class.forName(CLASS_NAME);
            etapa = "Conectando com o Banco de Dados";
            con = DriverManager.getConnection(DB_URL);
            etapa = "Preparando o Statement";
            stmt = con.createStatement();
            etapa = "Criando a Tabela de Usuários";
            stmt.execute(Usuario.getCreateStatement());
            if(Usuario.getList().isEmpty()){
                stmt.execute("INSERT INTO sql10403882.USUARIO VALUES(1,"
                        + "'admin',"                       
                        + "1234".hashCode()+");");
                
            }           
            stmt = con.createStatement();
            etapa = "Criando a Tabela de Roles";
            stmt.execute(Role.getCreateStatement());
            etapa = "Desconectando do Banco de Dados";
        
        } catch (Exception ex) {
            exceptionMessage = etapa+": "+ex.getLocalizedMessage();
        }finally{
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
                
            }
    
        }
    
    @Override
    public void contextDestroyed(ServletContextEvent sce){
        
    }

}