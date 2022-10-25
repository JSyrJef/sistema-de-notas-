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
    <input type="hidden" id="status" value="<%= request.getAttribute("status") %>"/>
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
                     <div class="sb-sidenav-footer">
                     <a class="nav-link" href="index.jsp">
						<i class="fas fa-long-arrow-alt-left"></i> Regresar
                      </a>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
             		<div class="container-fluid px-4">
                        <h1 class="mt-4">Herramientas de administrador</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Registro de nuevo usuario</li>
                        </ol>
                        <div class="card m-auto" style="width: 50rem;">
                            <div class="card-header bg-white" >
                              Registro
                            </div>
                            <form method="post" action="registro_user" class="register-form"
							id="register-form" style="padding: 10px;">
                                <div class="form-group">
                                  <label for="userU">Nombre de Usuario</label>
                                  <input type="text" class="form-control" id="userU" name="userU" placeholder="Usuario">
                                </div>
                                <div class="form-group">
                                  <label for="pwdU">Contraseña</label>
                                  <input type="text" class="form-control" id="pwdU" name="pwdU" placeholder="Contraseña">
                                </div>
                                <div class="form-group">
                                    <label for="nomU">Nombres</label>
                                    <input type="text" class="form-control" id="nomU" name="nomU" placeholder="Nombres Completos">
                                  </div>
                                <div class="form-group">
                                    <label for="apeU">Apellidos</label>
                                    <input type="text" class="form-control" id="apeU" name="apeU" placeholder="Apellidos Completos">
                                  </div>
                                  <div class="form-group mt-3">
                                    <label for="rolU">ROL</label>
                                    <select name="rolU" class="custom-select">
                                        <option value="Administrador">Administrador</option>
                                        <option value="Profesor">Profesor</option>
                                    </select>
                                </div>
                                <div class="form-group form-button" style="margin-top: 20px">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Registrar" />
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
        	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
  	
  var status = document.getElementById("status").value;
  if(status == "success"){
  		swal("Proceso exitoso","Usuario registrado satisfactoriamente","success");
  }
  if(status == "invaliduser"){
		swal("Lo siento","Ingrese usuario","error");
  }
  if(status == "invalidpwdU"){
		swal("Lo siento","Ingrese contraseña","error");
  }
  if(status == "invalidnom"){
		swal("Lo siento","Ingrese nombres","error");
  }
  if(status == "invalidape"){
		swal("Lo siento","Ingrese apellidos","error");
  }
  
</script>
    </body>
</html>