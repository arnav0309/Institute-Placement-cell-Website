

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class removecomp
 */
@WebServlet("/removecomp")
public class removecomp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public removecomp() {
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
		String Company_Id=request.getParameter("ID");
		try{
			Connection connect;
			Class.forName("com.mysql.cj.jdbc.Driver");
			connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/first","root","anuj3107");
			PreparedStatement pst=connect.prepareStatement("delete from companies where Company_Id=?;");
			pst.setString(1,Company_Id);
			int r=pst.executeUpdate();
			System.out.println(r);
			if(r>0)
			{
			System.out.println("deleted");
			}
			response.sendRedirect("companyupdation.html");
	       }
		catch(Exception e)
		{
			System.out.println(e);
		}
		}

}
