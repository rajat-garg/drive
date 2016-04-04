package exampleservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.User;
import model.UserDatabase;

/**
 * Servlet implementation class FileDisplayServlet
 */
@WebServlet("/FileDisplayServlet")
public class FileDisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDisplayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (session != null) {
			User user;
			user = (User) session.getAttribute("user");
			ResultSet resultSet;
			

			if ((resultSet=UserDatabase.displayUserData(user.getId()))!= null) {
				
				
				session.setAttribute("resultSet", resultSet);
				//request.setAttribute("resultSet", resultSet);
				
				out.println("data read successfuly");
				response.sendRedirect("home.jsp");
				//response.sendRedirect("FileDisplayServlet");
				
				//RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
				//rd.forward(request,response);
				
			} else {
				out.println("no file found");
				
				response.sendRedirect("home.jsp");
				//RequestDispatcher rd = request.getRequestDispatcher("FileDisplayServlet");
				//rd.forward(request,response);
			}
			
		} else {
			out.println("session  time out !! login to continue");
			RequestDispatcher rs = request.getRequestDispatcher("login.html");
			rs.include(request, response);

		}

	}

}
