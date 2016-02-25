package exampleservlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserDatabase;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String dobmonth = request.getParameter("month");
		String dobday = request.getParameter("day");
		String gender = request.getParameter("gender");
		String password = request.getParameter("password");
		if(firstname.isEmpty()||lastname.isEmpty()||email.isEmpty()||dobmonth.isEmpty()||dobday.isEmpty()||gender.isEmpty()||password.isEmpty())
		{
			RequestDispatcher rd = request.getRequestDispatcher("errorsignup.jsp");
			out.println("<font color=red>Please fill all the fields</font>");
			rd.include(request, response);
		}
		//else if(RegisterIntoDatabase.isertRecord(firstname, lastname, email,dobday+" "+dobmonth, gender, password))
		else if(UserDatabase.insertRecord(firstname, lastname, email,dobday+" "+dobmonth, gender, password))
		{
			response.sendRedirect("login.html");
		}
		else{
			RequestDispatcher rd = request.getRequestDispatcher("errorsignup.jsp");
			rd.forward(request, response);
		}
	}

}
