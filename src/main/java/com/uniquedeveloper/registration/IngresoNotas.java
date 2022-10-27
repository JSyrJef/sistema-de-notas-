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
 * Servlet implementation class IngresoNotas
 */
@WebServlet("/registro_calificacion_alumno")
public class IngresoNotas extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String alumno = request.getParameter("Insertalumno");
		int idalumno = Integer.parseInt(alumno);
		String materia = request.getParameter("Insertmateria");
		int idmateria = Integer.parseInt(materia);
		String evaluacion = request.getParameter("Insertevaluacion");
		int idevaluacion = Integer.parseInt(evaluacion);
		String nota = request.getParameter("Insertnota");
		float floatnota = Float.parseFloat(nota);
		RequestDispatcher dispatcher = null;
		Connection con = null;
        
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://192.168.1.13:33060/bd_notas?useSSL=false","root","secret");
			PreparedStatement pst = con.prepareStatement("insert into registro_notas(nota,id_alumno,id_materia,id_evaluacion) values(?,?,?,?)");
			pst.setFloat(1, floatnota);
			pst.setInt(2, idalumno);
			pst.setInt(3, idmateria);
			pst.setInt(4,idevaluacion);
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("CaliEstu.jsp");
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
