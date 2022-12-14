<%@page import="java.sql.*" %>
<%
	if(session.getAttribute("name")==null){
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Listar</title>

        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css-index/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>


    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.jsp">Sistema de notas</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-chalkboard-teacher"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="logout"><%= session.getAttribute("name") %></a></li>
                    	<li><a class="dropdown-item" href="logout">Cerrar Sesion</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Interfaz</div>
                            <a class="nav-link" href="index.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Home
                            </a>
                            <div class="sb-sidenav-menu-heading">Herramientas</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-user-edit"></i></div>
                                Estudiantes
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="ListEstu.jsp">Listado alumnos</a>
                                    <a class="nav-link" href="RegEstu.jsp">Agregar Alumnos</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-pen-alt"></i></div>
                                Calificaciones
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link" href="CaliEstu.jsp">Calificar alumnos</a>
                                </nav>
                            </div>
                            <a class="nav-link" href="ListMat.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Materias
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Estudiantes</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Listar Estudiantes</li>
                        </ol>
                    </div>
                    <%
                          //Conexion BD
                            Class.forName("com.mysql.jdbc.Driver");
                			Connection con = DriverManager.getConnection("jdbc:mysql://192.168.1.13:33060/bd_notas?useSSL=false","root","secret");
                			//modificar registro bajo su identificador
                			PreparedStatement ps;
                			ResultSet rs;
                			int id=Integer.parseInt(request.getParameter("idAlumno"));
                			ps=con.prepareStatement("select id_alumno,num_list,nombres,apellidos,grado,seccion from alumnos inner join grados on alumnos.id_grado = grados.id_grado inner join secciones on alumnos.id_seccion = secciones.id_seccion where id_alumno="+id);
                			rs=ps.executeQuery();
                            //form del alumno identificado
                            
                            while(rs.next()){
                            %>
                            <div class="card" style="margin-bottom: 20px">
  								<ul class="list-group list-group-flush">
    								<li class="list-group-item"><strong>Alumno:</strong> <%= rs.getString("nombres") %> <%=rs.getString("apellidos") %>
    								 | <strong>N?:</strong> <%= rs.getString("num_list") %>
    								 | <strong>Grado:</strong> <%= rs.getString("grado") %> <%= rs.getString("seccion") %>
    								</li>

  								</ul>
							</div>
						<div class="container" style="display:flex;">
							                          <% }%>
						<%
                        //Conexion BD
            			String sql2 = "SELECT evaluacion,materia,nota  from registro_notas INNER JOIN evaluaciones on registro_notas.id_evaluacion = evaluaciones.id_evaluacion INNER JOIN materia on registro_notas.id_materia = materia.id_materia where evaluacion='lab1' AND id_alumno="+id;
            			ps = con.prepareStatement(sql2);
            			rs = ps.executeQuery(); 
                        //listado
                        %>
                          
				<table class="table table-bordered" style="width:auto;">
				  <thead>
				    <tr>
				      <th scope="col">Materia</th>
				    </tr>
				  </thead>
				  <%
                                	while(rs.next()){
                                
                                %>
				  <tbody>
				    <tr>
				      <td><%= rs.getString("materia") %></td>
				      				      <%} %>
				    </tr>
				  </tbody>
				</table>
                           <%
                        //Conexion BD
            			String sql22 = "SELECT id_registro,evaluacion,materia,nota  from registro_notas INNER JOIN evaluaciones on registro_notas.id_evaluacion = evaluaciones.id_evaluacion INNER JOIN materia on registro_notas.id_materia = materia.id_materia where evaluacion='lab1' AND id_alumno="+id;
            			ps = con.prepareStatement(sql22);
            			rs = ps.executeQuery(); 
                        //listado
                        %>
                          
				<table class="table table-bordered" style="width:auto;">
				  <thead>
				    <tr>
				      <th scope="col">Laboratorio 1</th>

				    </tr>
				  </thead>
				  <%
                                	while(rs.next()){
                                
                                %>
				  <tbody>
				    <tr>
				    	<input type="hidden" id="status" value="<%= rs.getInt("id_registro")%>"/>
				      <td ><%= rs.getString("nota") %> <a  href="CaliEdit.jsp?idRe=<%= rs.getInt("id_registro")%>"><i class='fas fa-pen-alt'></i></a></td>
				      				      <%} %>
				    </tr>
				  </tbody>
				</table>			
				<%
                        //Conexion BD
            			String sql3 = "SELECT id_registro,evaluacion,materia,nota from registro_notas INNER JOIN evaluaciones on registro_notas.id_evaluacion = evaluaciones.id_evaluacion INNER JOIN materia on registro_notas.id_materia = materia.id_materia where evaluacion='lab2' AND id_alumno="+id;
            			ps = con.prepareStatement(sql3);
            			rs = ps.executeQuery(); 
                        //listado
                        %>
                          
				<table class="table table-bordered" style="width:auto;">
				  <thead>
				    <tr>
				      <th scope="col">Laboratorio 2</th>
				    </tr>
				  </thead>
				  <%
                                	while(rs.next()){
                                
                                %>
				  <tbody>
				    <tr>
				    	<input type="hidden" id="status" value="<%= rs.getInt("id_registro")%>"/>
				      <td ><%= rs.getString("nota") %> <a  href="CaliEdit.jsp?idRe=<%= rs.getInt("id_registro")%>"><i class='fas fa-pen-alt'></i></a></td>
				      				      <%} %>
				    </tr>
				  </tbody>
				</table>	
				<%
                        //Conexion BD
            			String sql4 = "SELECT id_registro,evaluacion,materia,nota from registro_notas INNER JOIN evaluaciones on registro_notas.id_evaluacion = evaluaciones.id_evaluacion INNER JOIN materia on registro_notas.id_materia = materia.id_materia where evaluacion='lab3' AND id_alumno="+id;
            			ps = con.prepareStatement(sql4);
            			rs = ps.executeQuery(); 
                        //listado
                        %>
                          
				<table class="table table-bordered" style="width:auto;">
				  <thead>
				    <tr>
				      <th scope="col">Laboratorio 3</th>
				    </tr>
				  </thead>
				  <%
                                	while(rs.next()){
                                
                                %>
				  <tbody>
				    <tr>
				    <input type="hidden" id="status" value="<%= rs.getInt("id_registro")%>"/>
				      <td ><%= rs.getString("nota") %> <a  href="CaliEdit.jsp?idRe=<%= rs.getInt("id_registro")%>"><i class='fas fa-pen-alt'></i></a></td>
				      				      <%} %>
				    </tr>
				  </tbody>
				</table>							
                <%
                        //Conexion BD
            			String sql5 = "SELECT id_registro,evaluacion,materia,nota from registro_notas INNER JOIN evaluaciones on registro_notas.id_evaluacion = evaluaciones.id_evaluacion INNER JOIN materia on registro_notas.id_materia = materia.id_materia where evaluacion='examU1' AND id_alumno="+id;
            			ps = con.prepareStatement(sql5);
            			rs = ps.executeQuery(); 
                        //listado
                        %>
                          
				<table class="table table-bordered" style="width:auto;">
				  <thead>
				    <tr>
				      <th scope="col">ExamenFU1</th>
				    </tr>
				  </thead>
				  <%
                                	while(rs.next()){
                                
                                %>
				  <tbody>
				    <tr>
				      <input type="hidden" id="status" value="<%= rs.getInt("id_registro")%>"/>
				      <td ><%= rs.getString("nota") %> <a  href="CaliEdit.jsp?idRe=<%= rs.getInt("id_registro")%>"><i class='fas fa-pen-alt'></i></a></td>
				      				      <%} %>
				    </tr>
				  </tbody>
				</table>
				<%
                        //Conexion BD
            			String sql6 = "select id_alumno,id_materia, ROUND(AVG(nota),2) as promedio from registro_notas WHERE id_alumno="+id+" GROUP BY id_materia";
            			ps = con.prepareStatement(sql6);
            			rs = ps.executeQuery(); 
                        //listado
                        %>
                          
				<table class="table table-bordered" style="width:auto;">
				  <thead>
				    <tr>
				      <th scope="col">Promedio</th>
				    </tr>
				  </thead>
				  <%
                                	while(rs.next()){
                                
                                %>
				  <tbody>
				    <tr>
				      <td><%= rs.getString("promedio") %></td>
				      				      <%} %>
				    </tr>
				  </tbody>
				</table>
				<%
                        //Conexion BD
            			String sql7 = "select id_alumno, ROUND(AVG(nota),2) as promedio from registro_notas WHERE id_alumno="+id;
            			ps = con.prepareStatement(sql7);
            			rs = ps.executeQuery(); 
                        //listado
                        %>
                          
				<table class="table table-bordered" style="width:auto;">
				  <thead>
				    <tr>
				      <th scope="col">Promedio Final</th>
				    </tr>
				  </thead>
				  <%
                                	while(rs.next()){
                                
                                %>
				  <tbody>
				    <tr>
				      <td><%= rs.getString("promedio") %></td>
				      				      <%} %>
				    </tr>
				  </tbody>
				</table>
						</div>
						
				<a class="nav-link" href="ListEstu.jsp"><i class="fas fa-long-arrow-alt-left"></i> Regresar</a>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Sistema de notas 2022</div>
                            <div>
                                <a href="#">Politicas de Privacidad</a>
                                &middot;
                                <a href="#">Terminos &amp; Condiciones</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js-index/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js-index/jquery/dist/jquery.slim.min.js"></script>
    <script src="js-index/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js-index/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>

    <!-- Main theme script-->
    <script src="js-index/theme.min.js"></script>
	</body>
</html>