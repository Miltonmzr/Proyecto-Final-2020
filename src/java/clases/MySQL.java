package clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;

/**
 *
 * @author Andres
 */
public class MySQL {

    private Connection con;
    private Statement stmt;

    /**
     * @return the con
     */
    public Connection getCon() {
        return con;
    }

    /**
     * @param con the con to set
     */
    public void setCon(Connection con) {
        this.con = con;
    }

    /**
     * @return the stmt
     */
    public Statement getStmt() {
        return stmt;
    }

    /**
     * @param stmt the stmt to set
     */
    public void setStmt(Statement stmt) {
        this.stmt = stmt;
    }

    public void conectar() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://den1.mysql3.gear.host:3306/papeleriapf", "papeleriapf", "Vl2dv74P!_UG");
            stmt = con.createStatement();

        } catch (SQLException e) {
            System.out.println("Exception SQL : ");
            System.out.println("Mensaje : " + e.getMessage());
            System.out.println("SQLState : " + e.getSQLState());
            System.out.println("Codigo Proveedor : " + e.getErrorCode());
            e.printStackTrace();
        } catch (Exception ex) {
            System.out.println("Se ha lanzado una Exception no SQL : ");
            ex.printStackTrace();
        }
    }

    public void abc(String sql) {
        try {
            getStmt().executeUpdate(sql);
        } catch (SQLException e) {
            System.out.println("Exception SQL : ");
            System.out.println("Mensaje : " + e.getMessage());
            System.out.println("SQLState : " + e.getSQLState());
            System.out.println("Codigo Proveedor : " + e.getErrorCode());
            e.printStackTrace();
        } catch (Exception ex) {
            System.out.println("Se ha lanzado una Exception no SQL : ");
            ex.printStackTrace();
        }
    }
    public void cerrar(){
        try {
            getStmt().close();
            getCon().close();
        } catch (SQLException e) {
            System.out.println("Exception SQL : ");
            System.out.println("Mensaje : " + e.getMessage());
            System.out.println("SQLState : " + e.getSQLState());
            System.out.println("Codigo Proveedor : " + e.getErrorCode());
            e.printStackTrace();
        } catch (Exception ex) {
            System.out.println("Se ha lanzado una Exception no SQL : ");
            ex.printStackTrace();
        }
    }
    public Connection getConexionUsers(){
        return con;
    }
    public static void main(String []arg){
        MySQL con = new MySQL();
    }
}
