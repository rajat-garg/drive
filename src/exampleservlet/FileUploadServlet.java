package exampleservlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.User;
import model.UserDatabase;

/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet("/FileUploadServlet")

@MultipartConfig(maxFileSize = 16177215) // upload file up to 16MB
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FileUploadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (session != null) {
			User user;
			user = (User) session.getAttribute("user");
			Part filePart = request.getPart("choosenFileName");
			System.out.println(extractFileName(filePart));
			
			System.out.println("file name  =  " + filePart.getName());
			System.out.println("file type  =  " + filePart.getContentType());
			System.out.println("file size =  " + filePart.getSize());
			System.out.println("inputstream  =  " + filePart.getInputStream() == null);

			if (UserDatabase.insertFileInToUserData(filePart, user.getId(),extractFileName(filePart)) != 0) {
				out.println("file upload successful");
				response.sendRedirect("home.jsp");
				//RequestDispatcher rs = request.getRequestDispatcher("home.jsp");
				//rs.include(request, response);
			} else {
				out.println("upload unsuccessful");
				response.sendRedirect("home.jsp");
				//RequestDispatcher rs = request.getRequestDispatcher("home.jsp");
				//rs.include(request, response);
			}
			
		} else {
			out.println("session  time out !! login to continue");
			RequestDispatcher rs = request.getRequestDispatcher("login.html");
			rs.include(request, response);

		}

	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

}
