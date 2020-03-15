package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import pojo.User;
import util.DBUtil;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class UserDao{
	
    public void addUser(User bean) {

        String sql = "insert into user values(? ,? ,?, ?)";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(2, bean.getName());
            ps.setString(1, bean.getId());
            ps.setString(3, bean.getPhone());
            ps.setString(4, bean.getNumber());
            ps.execute();
            
        } catch (SQLException e) {

            e.printStackTrace();
        }
    }
    public void addReservation(User bean) {

        String sql = "insert into reservations values(? ,? ,?, ?)";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, bean.getId());
            ps.setString(2, bean.getName());
            ps.setString(3, bean.getPhone());
            ps.setString(4, bean.getNumber());
            ps.execute();
            
        } catch (SQLException e) {

            e.printStackTrace();
        }
    }
    public void addgetmasklist(User bean,String date) {

        String sql = "insert into getMaskList values(? ,? ,?, ?, ?, ?)";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
        	
        	
        	ps.setString(1, bean.getId()+"000");//主键不能和其他值重复
            ps.setString(2, bean.getName());
            ps.setString(3, bean.getId());
            ps.setString(4, bean.getPhone());
            ps.setString(5, bean.getNumber());
            ps.setString(6, date);
            ps.execute();
            
        } catch (SQLException e) {

            e.printStackTrace();
        }
    }
    
    public String lookReservation(User bean) 
    {
    	String sql = "select * from reservations where IDNum = ?";
    	
    	try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, bean.getId());
            ResultSet resultSet = ps.executeQuery();
            if(resultSet.next()){
            	return "已经预约过";
            }else{
      
            	return "预约成功";
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            return "error";
        }
    	
    }
    public String lookgetmasklist(User bean) //遍历中签表
    {
    	String sql = "select * from getMaskList where IDNum = ?";
    	
    	try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, bean.getId());
            ResultSet resultSet = ps.executeQuery();
        
            int i=0;
            while(resultSet.next())
            {
            	i++;
            }
            if (i>=3) {
            	return "已经中签3次";
            }
            else 
            {
				return "预约成功";
			}
        } catch (SQLException e) {
            e.printStackTrace();
            return "error";
        }
    	
    }
    
    public String lookgetmasklist2(User bean,String date) //遍历中签表
    {
    	String sql = "select * from getMaskList where IDNum = ?";
    	 Date date1 = new Date();
         SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        
         
         //String date=session.getAttribute("date");// new Date()为获取当前系统时间 你可以改成sesstion的date
         date=date.replace("-", "");
         int a=Integer.parseInt(date);
    	try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, bean.getId());
            ResultSet resultSet = ps.executeQuery();
            while(resultSet.next())
            {
            	String st=resultSet.getString("date");//获取中签表内的日期
            	st=st.replace("-", "");
            	int b=Integer.parseInt(st);
            	if (a-3<b) 
            	{
					return "预约失败";
				}
            }
            return "预约成功";
 
        } catch (SQLException e) {
            e.printStackTrace();
            return "error";
        }
    	
    }
}
