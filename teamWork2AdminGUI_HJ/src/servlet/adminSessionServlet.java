package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class adminSessionServlet
 */
@WebServlet("/adminSessionServlet")
public class adminSessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final javax.servlet.jsp.JspFactory _jspxFactory = javax.servlet.jsp.JspFactory.getDefaultFactory();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminSessionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		if(request.getParameter("startTime")!=null) {
			String sT=request.getParameter("startTime");
			String eT=request.getParameter("endTime");
			request.getSession().setAttribute("startTime", sT);
			request.getSession().setAttribute("endTime", eT);
		}else if(request.getParameter("limitNum")!=null){
			String lN=request.getParameter("limitNum");
			request.getSession().setAttribute("limitNum", lN);
		}else {
			String tN=request.getParameter("totalNum");
			request.getSession().setAttribute("startTime", tN);
		}
		jumpPage(request, response, "设置成功");
	}
	
	private void jumpPage(final javax.servlet.http.HttpServletRequest request,
			final javax.servlet.http.HttpServletResponse response,String string)
			throws java.io.IOException, javax.servlet.ServletException {

		if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
			final java.lang.String _jspx_method = request.getMethod();
			if ("OPTIONS".equals(_jspx_method)) {
				response.setHeader("Allow", "GET, HEAD, POST, OPTIONS");
				return;
			}
			if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
				response.setHeader("Allow", "GET, HEAD, POST, OPTIONS");
				response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED,
						"JSP 只允许 GET、POST 或 HEAD。Jasper 还允许 OPTIONS");
				return;
			}
		}

		final javax.servlet.jsp.PageContext pageContext;
		javax.servlet.http.HttpSession session = null;
		final javax.servlet.ServletContext application;
		final javax.servlet.ServletConfig config;
		javax.servlet.jsp.JspWriter out = null;
		final java.lang.Object page = this;
		javax.servlet.jsp.JspWriter _jspx_out = null;
		javax.servlet.jsp.PageContext _jspx_page_context = null;

		try {
			response.setContentType("text/html; charset=utf-8");
			pageContext = _jspxFactory.getPageContext(this, request, response, null, true, 8192, true);
			_jspx_page_context = pageContext;
			application = pageContext.getServletContext();
			config = pageContext.getServletConfig();
			session = pageContext.getSession();
			out = pageContext.getOut();
			_jspx_out = out;

			out.write("\r\n");
			out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n");
			out.write("<HTML>\r\n");
			out.write("<HEAD>\r\n");
			out.write("<meta http-equiv='refresh' content='3;url=admin.jsp'>\r\n");
			out.write("<script type='text/javascript'>\r\n");
			out.write("\tvar i = 3;\r\n");
			out.write("\tfunction getTime() {\r\n");
			out.write("\t\tdocument.getElementById('num').innerHTML = \"<font color='red'>\" + i\r\n");
			out.write("\t\t\t\t+ \"</font>\";\r\n");
			out.write("\t\ti -= 1;\r\n");
			out.write("\t\tvar x = setTimeout('getTime()', 1000)\r\n");
			out.write("\t\tif (i <= 0) {\r\n");
			out.write("\t\t\tclearTimeout(x);\r\n");
			out.write("\t\t}\r\n");
			out.write("\t}\r\n");
			out.write("\twindow.onload = getTime;\r\n");
			out.write("</script>\r\n");
			out.write("<TITLE>"+string+"</TITLE>\r\n");
			out.write("</HEAD>\r\n");
			out.write("<BODY>\r\n");
			out.write("\t<h2>"+string+"!</h2>\r\n");
			out.write("\t<h2>\r\n");
			out.write("\t\t页面将在<span id='num' style=''>3</span>秒后跳转回管理员页面\r\n");
			out.write("\t</h2>\r\n");
			out.write("</BODY>\r\n");
			out.write("</HTML>\r\n");
		} catch (java.lang.Throwable t) {
			if (!(t instanceof javax.servlet.jsp.SkipPageException)) {
				out = _jspx_out;
				if (out != null && out.getBufferSize() != 0)
					try {
						if (response.isCommitted()) {
							out.flush();
						} else {
							out.clearBuffer();
						}
					} catch (java.io.IOException e) {
					}
				if (_jspx_page_context != null)
					_jspx_page_context.handlePageException(t);
				else
					throw new ServletException(t);
			}
		} finally {
			_jspxFactory.releasePageContext(_jspx_page_context);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
