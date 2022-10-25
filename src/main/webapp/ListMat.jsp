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
        <title>Home</title>
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
                        <h1 class="mt-4">Materias</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Listado de materias en el sistemas</li>
                        </ol>
                        <div>
                        	<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Agregar materia nueva
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Materia a Ingresar</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="post" action="registro_materia" class="register-form" id="register-form" style="padding: 10px;">
                                <div class="form-group">
                                  <label for="InsertMateria">Materia</label>
                                  <input type="text" class="form-control" id="InsertMateria" name="InsertMateria" placeholder="Nombre de la materia" required="required">
                                </div>
                                <div class="form-group mt-3 mb-3">
                                    <label for="InsertG">Grado</label>
                                    <select name="InsertG" class="custom-select" required="required">
                                        <option value="1">Primero</option>
                                        <option value="2">Segundo</option>
                                        <option value="3">Tercero</option>
                                        <option value="4">Cuarto</option>
                                        <option value="5">Quinto</option>
                                        <option value="6">Sexto</option>
                                        <option value="7">Septimo</option>
                                        <option value="8">Octavo</option>
                                        <option value="9">Noveno</option>
                                    </select>
                                </div>
                                <div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Registrar" />
								</div>
                              </form>
      </div>
    </div>
  </div>
</div>
                        </div>
                         <%
                        //Conexion BD
                        Class.forName("com.mysql.jdbc.Driver");
            			Connection con = DriverManager.getConnection("jdbc:mysql://192.168.1.11:33060/bd_notas?useSSL=false","root","secret");
            			//Listar datos
            			PreparedStatement ps;
            			ResultSet rs;
            			String sql = "select id_materia,materia,grado from materia inner join grados on materia.id_grado = grados.id_grado";
            			ps = con.prepareStatement(sql);
            			rs = ps.executeQuery(); 
                        //listado
                        %>
                        <div class="card-body" style="display: inline-block;">
                            <table class="table table-bordered">
                                <thead class="thead-dark">
                                  <tr>
                                    <th scope="col">Materia</th>
                                    <th scope="col">Grado Impartido</th>
                                    <th scope="col">Opciones</th>
                                  </tr>
                                </thead>
                                <%
                                	while(rs.next()){
                                
                                %>
                                <tbody>
                                  <tr>
                                  <input type="hidden" id="status" value="<%= rs.getInt(1)%>"/>     
                                    <td><%= rs.getString(2)%></td>
                                    <td><%= rs.getString(3)%></td>
                        <td>
                        <div>
                        	 <a  href="ElimMat.jsp?idMateria=<%= rs.getInt(1)%>"><button type="button" class="btn btn-primary"><i class='fas fa-trash-alt'></i></button></a>
                        </div>
                        </td>
                        
                                  </tr>
                                </tbody>
                                
                                <%
                                	}
                                %>
                            </table>
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
    <script src="js-index/jquery/dist/jquery.slim.min.js"></script>
    <script src="js-index/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js-index/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    </body>
</html>