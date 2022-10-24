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
                                    <a class="nav-link" href="listarEstu.jsp">Listar alumnos</a>
                                    <a class="nav-link" href="regEstu.jsp">Agregar Alumnos</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-pen-alt"></i></div>
                                Calificaciones
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link" href="layout-static.html">Calificar alumnos</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">Modificar calificacion</a>
                                </nav>
                            </div>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Materias
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-swatchbook"></i></div>
                                Grados
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
                      <div class="card" style="margin: auto 70px;" >
                        <div class="card-header" style="background-color: white;">
                            <form class="form-inline pt-2">
                                <label class="sr-only" for="inline-form-input-grado">Grado</label>
                                <div class="input-group mb-3 mr-sm-4">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">Grado</div>
                                </div>
                                <input class="form-control mb-3 mr-sm-4" type="text" id="inline-form-input-grado" placeholder="Grado" style="width: auto;">
                                </div>

                                <label class="sr-only" for="inline-form-input-seccion">Grado</label>
                                <div class="input-group mb-3 mr-sm-4">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">Seccion</div>
                                </div>
                                <input class="form-control mb-3 mr-sm-4" type="text" id="inline-form-input-seccion" placeholder="Seccion" style="width: auto;">
                                </div>
                            
                                <button class="btn btn-primary mb-3" type="submit">Filtrar</button>
                                <a class="nav-link" href="regEstu.jsp">
                                    Registrar nuevo Alumno
                                    <i class="fas fa-long-arrow-alt-right"></i>
                                </a>
                                
                            </form>
                        </div>
                        
                        <%
                        //Conexion BD
                        Class.forName("com.mysql.jdbc.Driver");
            			Connection con = DriverManager.getConnection("jdbc:mysql://192.168.1.11:33060/bd_notas?useSSL=false","root","secret");
            			//Listar datos
            			PreparedStatement ps;
            			ResultSet rs;
            			String sql = "select id_alumno,num_list,nombres,apellidos,genero,grado,seccion from alumnos inner join grados on alumnos.id_grado = grados.id_grado inner join secciones on alumnos.id_seccion = secciones.id_seccion ";
            			ps = con.prepareStatement(sql);
            			rs = ps.executeQuery(); 
                        //listado
                        %>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead class="thead-dark">
                                  <tr>
                                    <th scope="col">N°</th>
                                    <th scope="col">Nombres</th>
                                    <th scope="col">Apellidos</th>
                                    <th scope="col">Genero</th>
                                    <th scope="col">Grado</th>
                                    <Th scope="col">Seccion</Th>
                                    <th scope="col">Opciones</th>
                                  </tr>
                                </thead>
                                <%
                                	while(rs.next()){
                                
                                %>
                                <tbody>
                                  <tr>
                                  <input type="hidden" id="status" value="<%= rs.getInt(1)%>"/>
                                    <td><%= rs.getInt(2)%></td>
                                    <td><%= rs.getString(3) %></td>
                                    <td><%= rs.getString(4) %></td>
                                    <td><%= rs.getString(5) %></td>
                                    <td><%= rs.getString(6) %></td>
                                    <td><%= rs.getString(7) %></td>
                                    <td>
                                        <div class="btn-group dropdown">
                                            <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                              Seleccion
                                            </button>
                                            <div class="dropdown-menu">
                                              <a href="eliminarEstu.jsp?idAlumno=<%= rs.getInt(1)%>" class="dropdown-item"><i class='fas fa-trash-alt'></i> Eliminar Alumno</a>
                                              <div class="dropdown-divider"></div>
                                              <a href="editEstu.jsp?idAlumno=<%= rs.getInt(1)%>" class="dropdown-item"><i class='fas fa-tools'></i> Modificar Alumno</a>
                                              <div class="dropdown-divider"></div>
                                              <a href="CaliEstu.jsp?idAlumno=<%= rs.getInt(1)%>" class="dropdown-item"><i class='fas fa-tools'></i> Test Calificar</a>
                                            </div>
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