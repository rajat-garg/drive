package exampleservlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

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
 * Servlet implementation class FileDownloadServlet
 */
@WebServlet("/FileDownloadServlet")
public class FileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FileDownloadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType(request.getParameter("mime"));
		
		System.out.println("MIME  : "+request.getParameter("mime"));
		
		OutputStream outStream = response.getOutputStream();
//		response.setHeader("Content-Disposition", "attachment; filename=\"" +request.getParameter("file_name")  + "\"");
		InputStream inputStream; 

		if (session != null) {
			User user;
			user = (User) session.getAttribute("user");
			//String fileName = null;

			if ((inputStream=UserDatabase.fileDownload(user.getId(), Integer.parseInt(request.getParameter("file_id")))) != null) {
				
				byte[] buffer = new byte[4096];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outStream.write(buffer, 0, bytesRead);
                }
                inputStream.close();
                outStream.close();
               // response.getWriter().print("file download successful");
				//out.println("file upload successful");
			/*	RequestDispatcher rs = request.getRequestDispatcher("LoginSuccessful.jsp");
				rs.include(request, response);*/
			} else {
				//out.println("upload unsuccessful");
			/*	inputStream.close();
                outStream.close();
				RequestDispatcher rs = request.getRequestDispatcher("LoginSuccessful.jsp");
				rs.include(request, response);*/
			}

		} else {
			//out.println("session  time out !! login to continue");
			RequestDispatcher rs = request.getRequestDispatcher("login.html");
			rs.include(request, response);

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
	}

}
