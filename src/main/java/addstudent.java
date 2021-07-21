

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class addstudent
 */
@WebServlet("/addstudent")
public class addstudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addstudent() {
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
		String ID=request.getParameter("ID");
		String CompanyID=request.getParameter("CompanyID");
		String CompanyName=request.getParameter("CompanyName");
		String Package=request.getParameter("Package");
		
		
		try {
			Connection connect = null;
			Class.forName("com.mysql.cj.jdbc.Driver");
			connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/first","root","anuj3107");
			PreparedStatement pst = connect.prepareStatement("insert into candidate_to_company values(?,?,?,?);");
            pst.setString(1, ID);
            pst.setString(2, CompanyID);
            pst.setString(3, CompanyName);
            pst.setString(4, Package);
            pst.executeUpdate();
            
            response.sendRedirect("placed.jsp");
		}
		catch(Exception e)
		{
			
		}
	}

}
