/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package L3Per;
import java.sql.*;

/**
 *
 * @author hpmdu
 */
public class MssqlConnection {
    
    public Connection getConnection(){
        Connection conn = null;
        String uRL = "jdbc:sqlserver://;databaseName=QL_SinhVien";
        String userName = "sa";
        String password = "123";
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(uRL, userName, password);
            System.out.println("Ket noi CSDL thanh cong");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Khong ket noi duoc voi CSDL");
        }
        return conn;
    }
    
    public static void main(String[] args) {
        MssqlConnection mssql = new MssqlConnection();
        Connection conn = mssql.getConnection();
    }
}
