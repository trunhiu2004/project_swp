/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Accounts;
import model.Employees;

/**
 *
 * @author frien
 */
public class EmployeeDAO extends DBContext {
    
    public void createEmployee(String name, String phone, String address, int account_id) {
        String sql = "INSERT INTO [dbo].[Employees]\n"
                + "           ([employee_name]\n"
                + "           ,[employee_phone]\n"
                + "           ,[employee_address]\n"
                + "           ,[account_id])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, phone);
            st.setString(3, address);
            st.setInt(4, account_id);
            st.executeUpdate();
            
        } catch (SQLException e) {
            
        }
    }
    
    public List<Employees> getAllStaff() {
        List<Employees> lstStaff = new ArrayList<>();
        try {
            String sql = "select e.employee_id,e.employee_name, e.employee_phone,e.employee_address,e.account_id\n"
                    + "from Accounts a, Employees e, AccountStatus acstatus\n"
                    + "where a.account_id = e.account_id\n"
                    + "	and acstatus.status_id = a.status_id\n"
                    + "	and a.role_id = 2";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                lstStaff.add(
                        new Employees(rs.getInt(1), 
                                rs.getString(2),
                                rs.getString(3),
                                rs.getString(4),
                                rs.getInt(5)));
            }
        } catch (Exception e) {
        }
        return lstStaff;
    }
    
    public static void main(String[] args) {
        EmployeeDAO e = new EmployeeDAO();
        for (Employees a : e.getAllStaff()) {
            System.out.println(a);
        }
    }
}
