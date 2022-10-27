package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class registroMaterias
 */
@WebServlet("/registro_materia")
public class registroMaterias extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mat = request.getParameter("InsertMateria");
		String grado = request.getParameter("InsertG");
		int idgra = Integer.parseInt(grado);
		RequestDispatcher dispatcher = null;
		Connection con = null;
		
		if(mat == null || mat.equals("")) {
            request.setAttribute("status", "invalidlist");
            dispatcher = request.getRequestDispatcher("ListMat.jsp");
            dispatcher.forward(request,response);
        }
		if(grado== null || grado.equals("")) {
            request.setAttribute("status", "invalidnom");
            dispatcher = request.getRequestDispatcher("ListMat.jsp");
            dispatcher.forward(request,response);
        }
        
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://192.168.1.13:33060/bd_notas?useSSL=false","root","secret");
			PreparedStatement pst = con.prepareStatement("insert into materia(materia,id_grado) values(?,?) ");
			pst.setString(1, mat);
			pst.setInt(2, idgra);
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("ListMat.jsp");
			if(rowCount > 0 ) {
				request.setAttribute("status", "success");
			}else {
				request.setAttribute("status", "failed");
			}
			
			dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
