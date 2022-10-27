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
        <title>Calificar</title>
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
                                    <a class="nav-link" href="ListEstu.jsp">Listar alumnos</a>
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
                        <h1 class="mt-4">Calificaciones</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Ingreso de notas</li>
                        </ol>
              				                        <div class="card m-auto" style="width: 50rem;">
                            <div class="card-header bg-white" >
                              Calificar Alumno
                            </div>
                            <form method="post" action="registro_calificacion_alumno" class="register-form" id="register-form" style="padding: 10px;">
                                <%
                        //Conexion BD
                        Class.forName("com.mysql.jdbc.Driver");
            			Connection con = DriverManager.getConnection("jdbc:mysql://192.168.1.13:33060/bd_notas?useSSL=false","root","secret");
            			//Listar datos
            			PreparedStatement ps;
            			ResultSet rs;
            			String sql = "select * from alumnos";
            			ps = con.prepareStatement(sql);
            			rs = ps.executeQuery(); 
                        //listado
                        %>
                        <div class="form-group mt-3 mb-3">
                           <label for="Insertalumno">Alumno</label>
                             <select name="Insertalumno" class="custom-select">
                             <%
                                	while(rs.next()){
                                
                                %>
                                        <option value="<%= rs.getInt(1)%>"><%= rs.getString(3) %><%= rs.getString(4) %></option>
                                        <%
                                	}
                                %>
                             </select>
                             
                        </div>
                        <%
                        //Conexion BD
            			String sql2 = "select * from materia";
            			ps = con.prepareStatement(sql2);
            			rs = ps.executeQuery(); 
                        //listado
                        %>
                        <div class="form-group mt-3 mb-3">
                           <label for="Insertmateria">materia</label>
                             <select name="Insertmateria" class="custom-select">
                             <%
                                	while(rs.next()){
                                
                                %>
                                        <option value="<%= rs.getInt(1)%>"><%= rs.getString(2) %></option>
                                        <%
                                	}
                                %>
                             </select>
                             
                        </div>
                                                <%
                        //Conexion BD
            			String sql3 = "select * from evaluaciones";
            			ps = con.prepareStatement(sql3);
            			rs = ps.executeQuery(); 
                        //listado
                        %>
                        <div class="form-group mt-3 mb-3">
                           <label for="Insertevaluacion">Evaluacion</label>
                             <select name="Insertevaluacion" class="custom-select">
                             <%
                                	while(rs.next()){
                                
                                %>
                                        <option value="<%= rs.getInt(1)%>"><%= rs.getString(2) %></option>
                                        <%
                                	}
                                %>
                             </select>
                             
                        </div>
                                <div class="form-group">
                                  <label for="Insertnota">NOTA</label>
                                  <input  type="number" min="0" max="10" step="0.01" class="form-control" id="Insertnota" name="Insertnota" placeholder="">
                                </div>
                                <div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Registrar nota" />
								</div>
                              </form>
                          </div>                             
                    </div>
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
        <script src="js-index/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    </body>
</html>