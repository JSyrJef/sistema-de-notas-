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
@WebServlet("/registro_user")
public class registroUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userU = request.getParameter("userU");
		String pwdU = request.getParameter("pwdU");
		String nom = request.getParameter("nomU");
		String ape = request.getParameter("apeU");
		String rol = request.getParameter("rolU");
		RequestDispatcher dispatcher = null;
		Connection con = null;
		
		if(userU == null || userU.equals("")) {
            request.setAttribute("status", "invaliduser");
            dispatcher = request.getRequestDispatcher("regEstu.jsp");
            dispatcher.forward(request,response);
        }
		if(pwdU == null || pwdU.equals("")) {
            request.setAttribute("status", "invalidpwdU");
            dispatcher = request.getRequestDispatcher("regEstu.jsp");
            dispatcher.forward(request,response);
        }
		if(nom == null || nom.equals("")) {
            request.setAttribute("status", "invalidnom");
            dispatcher = request.getRequestDispatcher("regEstu.jsp");
            dispatcher.forward(request,response);
        }
        if(ape == null || ape.equals("")) {
            request.setAttribute("status", "invalidape");
            dispatcher = request.getRequestDispatcher("regEstu.jsp");
            dispatcher.forward(request,response);
        }
        if(rol == null || rol.equals("")) {
            request.setAttribute("status", "invalidrol");
            dispatcher = request.getRequestDispatcher("regEstu.jsp");
            dispatcher.forward(request,response);
        }

        
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://192.168.1.11:33060/bd_notas?useSSL=false","root","secret");
			PreparedStatement pst = con.prepareStatement("insert into users(username,upwd,uname,ulastname,rol) values(?,?,?,?,?) ");
			pst.setString(1, userU);
			pst.setString(2, pwdU);
			pst.setString(3, nom);
			pst.setString(4, ape);
			pst.setString(5, rol);
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("RegUser.jsp");
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