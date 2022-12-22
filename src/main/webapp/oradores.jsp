<%@page import="domain.Orador"%>
<%@page import="java.util.List"%>
<!Doctype html>
<html lang="es">
<jsp:include page="head.jsp"/>
<body>
	<!-- navbar -->
	<jsp:include page="navbar.jsp"/>
	<div class="container">
		<div class="row">
			<h1>Listado de Oradores</h1>
			<div class="col-12 mt-2">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Nombre</th>
							<th scope="col">Apellido</th>
							<th scope="col">Tema</th>
						</tr>
					</thead>
					<tbody>
						<!-- REPETIR/ITERAR SOBRE LA LISTA DE PRODUCTO QUE CARGUE EN EL CONTROLLER -->
						<%
							//capturar /bajar el listado del objeto request
							Float total = 0f; 
							List<Orador> oradores = (List<Orador>)request.getAttribute("oradores");
							for(Orador orador : oradores) {
						%>
								<tr>
									<th scope="row"><%=orador.getId()%></th>
									<td><%=orador.getNombre()%></td>
									<td><%=orador.getApellido()%></td>
									<td><%=orador.getTema()%></td>
									<td>
										<a class="btn btn-info" 
											role="button" 
											href="">
												Editar
										</a>
										 | 
										<!-- Button trigger modal -->
										<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal"
											onclick="">
										  Eliminar
										</button>
									</td>
								</tr>
						<%
							}
						%>						
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    	<form action="" 
	    		method="get">
	    	  <input type="hidden" name="id" id="id"/>
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Eliminar Articulo</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        ¿Desea eliminar el articulo?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
		        	Cancelar
		        </button>
		        <button type="submit" class="btn btn-danger">
		        	Eliminar
		        </button>
		      </div>
	     	</form>
	    </div>
	  </div>
	</div>
	
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script type="text/javascript">
		function setId(id) {
			document.getElementById('id').value=id;
		}
	</script>
</html>