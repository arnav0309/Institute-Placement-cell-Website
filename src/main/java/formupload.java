import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet("/formupload")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class formupload extends HttpServlet {
     
    
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
    	String password=request.getParameter("password");
        
         
        // obtains the upload file part in this multipart request
        String Resume = request.getParameter("resume");
        
        Connection connect = null; // connection to the database
         
        try {
            // connects to the database
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/first","root","anuj3107");
 
            // constructs SQL statement
            //String sql = "insert into candidate(Resume) values(?) where Candidate_ID=?; ";
            PreparedStatement pst = connect.prepareStatement("update candidate set Resume=? where password=?;");
            pst.setString(2,password);
            pst.setString(1,Resume);
 
            // sends the statement to the database server
            int row = pst.executeUpdate();
            if (row > 0) {
                System.out.println("file uploaded");
                response.sendRedirect("log.jsp");
            }
        } catch (SQLException ex) {
        	System.out.println(ex);
            ex.printStackTrace();
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            if (connect != null) {
                // closes the database connection
                try {
                    connect.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }

        }
    }
}