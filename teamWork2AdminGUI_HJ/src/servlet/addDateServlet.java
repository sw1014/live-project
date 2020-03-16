package servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addDateServlet
 */
@WebServlet("/addDateServlet")
public class addDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addDateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		String situation = (String) request.getSession().getAttribute("situation");
		if (situation.equals("预约中～～")) {
			request.getSession().setAttribute("situation", "暂停预约～～");
		} else {
			request.getSession().setAttribute("situation", "预约中～～");
			String date = (String) request.getSession().getAttribute("date");
			DateFormat dft = new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date temp = dft.parse(date);
				Calendar cld = Calendar.getInstance();
				cld.setTime(temp);
				cld.add(Calendar.DATE, 1);
				temp = cld.getTime();
				// 获得下一天日期字符串
				String nextDay = dft.format(temp);
				System.out.println(nextDay);
				request.getSession().setAttribute("date", nextDay);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		request.getRequestDispatcher("user.jsp").forward(request, response);
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
