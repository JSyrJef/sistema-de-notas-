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
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/registro_alumno")
public class registroAlum extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String listn = request.getParameter("InputNlista");
		int nlist = Integer.parseInt(listn);
		String nom = request.getParameter("InputANombre");
		String ape = request.getParameter("InputAApellido");
		String gen = request.getParameter("InputAGenero");
		String grado = request.getParameter("InputAGrado");
		int idgra = Integer.parseInt(grado);
		String seccion = request.getParameter("InputASeccion");
		int idsec = Integer.parseInt(seccion);
		RequestDispatcher dispatcher = null;
		Connection con = null;
		
		if(listn == null || listn.equals("")) {
            request.setAttribute("status", "invalidlist");
            dispatcher = request.getRequestDispatcher("regEstu.jsp");
            dispatcher.forward(request,response);
        }
		if(nom == null || nom.equals("")) {
            request.setAttribute("status", "invalidnom");
            dispatcher = request.getRequestDispatcher("RegEstu.jsp");
            dispatcher.forward(request,response);
        }
        if(ape == null || ape.equals("")) {
            request.setAttribute("status", "invalidape");
            dispatcher = request.getRequestDispatcher("RegEstu.jsp");
            dispatcher.forward(request,response);
        }
        if(gen == null || gen.equals("")) {
            request.setAttribute("status", "invalidgen");
            dispatcher = request.getRequestDispatcher("RegEstu.jsp");
            dispatcher.forward(request,response);
        }
        if(grado == null || grado.equals("")) {
            request.setAttribute("status", "invalidgrado");
            dispatcher = request.getRequestDispatcher("RegEstu.jsp");
            dispatcher.forward(request,response);
        }
        if(seccion == null || seccion.equals("")) {
            request.setAttribute("status", "invalidseccion");
            dispatcher = request.getRequestDispatcher("RegEstu.jsp");
            dispatcher.forward(request,response);
        }
        
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://192.168.1.13:33060/bd_notas?useSSL=false","root","secret");
			PreparedStatement pst = con.prepareStatement("insert into alumnos(num_list,nombres,apellidos,genero,id_grado,id_seccion) values(?,?,?,?,?,?) ");
			pst.setInt(1, nlist);
			pst.setString(2, nom);
			pst.setString(3, ape);
			pst.setString(4, gen);
			pst.setInt(5, idgra);
			pst.setInt(6, idsec);
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("RegEstu.jsp");
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