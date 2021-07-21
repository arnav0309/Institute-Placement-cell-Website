import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class validate
 */
@WebServlet("/validate")
public class validate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public validate() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out=response.getWriter();
		String ID=request.getParameter("ID");
		String password=request.getParameter("password");

		try{
			Connection connect;
			Class.forName("com.mysql.cj.jdbc.Driver");
			connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/first","root","anuj3107");
			PreparedStatement pst=connect.prepareStatement("Select password from candidate where  Candidate_ID=?;");
			pst.setString(1,ID);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				if(password.equals(rs.getString(1)))
				{
					HttpSession session=request.getSession();
					session.setAttribute("ID", ID);
					request.setAttribute("ID", ID);
                    request.getRequestDispatcher("log.jsp").forward(request, response);
                    response.sendRedirect("log.jsp");
				}
				else {
					out.println("\nEnter correct Username and Password");
				}
			}
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}

}
