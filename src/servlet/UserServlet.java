package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import dao.UserDao;
import pojo.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static int maskNum=5;//口罩数目
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String idcard=request.getParameter("idcard");
		String tel=request.getParameter("tel");
		String number=request.getParameter("number");
		User user=new User();
		user.setName(name);
		user.setId(idcard);
		user.setNumber(number);
		user.setPhone(tel);
		int num=Integer.parseInt(request.getParameter("number"));
		UserDao userdao=new UserDao();
		String result="预约失败";
		String result1=userdao.lookReservation(user);
		String result2=userdao.lookgetmasklist(user);
		System.out.println(result1);
		System.out.println(result2);
	
		if(result1.equals("预约成功"))//查看用户是否已经在本次预约 预约过
		{
			if (result2.equals("预约成功")) 
			{
				if (num<maskNum)//还有口罩 
				{
					result="预约成功";
					maskNum=maskNum-num;
					userdao.addgetmasklist(user);//加入中签表		
					userdao.addReservation(user);//加入预约表
				}
			}			
		}
		PrintWriter out = response.getWriter();
		response.setHeader("content-type", "text;charset=UTF-8");//告诉浏览器他发送的什么类型
		out.print(result);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
