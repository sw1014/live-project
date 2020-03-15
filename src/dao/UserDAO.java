package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import pojo.User;
import util.DBUtil;

public class UserDAO {
	
    public void add(User bean) {

        String sql = "insert into user values(? ,? ,?, ?)";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, bean.getName());
            ps.setString(2, bean.getIDNum());
            ps.setString(3, bean.getPhone());
            ps.setString(4, bean.getMaskNum());
            ps.execute();
            
        } catch (SQLException e) {

            e.printStackTrace();
        }
    }
    
}
