package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.*;

/**
 * Servlet implementation class DBServlet
 */
@WebServlet("/adminDBServlet")
public class adminDBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public adminDBServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<String> dateList = getDateList(request, response);
		String[] dateStrings = dateList.toArray(new String[dateList.size()]);
		request.setAttribute("dateList", dateStrings);
		if (request.getParameter("date") != null) {
			getTargetList(request, response);
		}
		request.setAttribute("date", request.getParameter("date"));
		request.getRequestDispatcher("admin.jsp").forward(request, response);
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void linkDB() {
		try {
			Connection c = DBUtil.getConnection();
			System.out.println("right");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("wrong");
			e.printStackTrace();
		}
	}

	protected List<String> getDateList(HttpServletRequest request, HttpServletResponse response) {
		try {
			Connection connection = DBUtil.getConnection();
			List<String> dateList = new ArrayList<String>();
			Statement statement = connection.createStatement();
			String sqlString = "select * from date";
			ResultSet resultSet = statement.executeQuery(sqlString);
			while (resultSet.next()) {
				String temString = resultSet.getString(1);
				dateList.add(temString);
			}
			return dateList;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	protected List<String[]> getTargetList(HttpServletRequest request, HttpServletResponse response) {
		try {
			Connection connection = DBUtil.getConnection();
			List<String[]> maskList = new ArrayList<String[]>();
			String date = (String) request.getParameter("date");
			String sql = "select * from getMaskList where date = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, date);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				String[] temStrings = new String[4];
				temStrings[0] = resultSet.getString(2);
				temStrings[1] = resultSet.getString(3);
				temStrings[2] = resultSet.getString(4);
				temStrings[3] = resultSet.getString(5);
				maskList.add(temStrings);
			}
			String[][] nameList = new String[maskList.size()][4];
			for (int i = 0; i < maskList.size(); i++) {
				for (int j = 0; j < 4; j++) {
					nameList[i][j] = maskList.get(i)[j];
				}
			}
			request.setAttribute("nameList", nameList);
			//request.getRequestDispatcher("admin.jsp").forward(request, response);
			return maskList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
