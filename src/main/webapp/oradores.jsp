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
			<div class="col-12 mt-2 d-flex flex-wrap mb-2 ">
					<%
							List<Orador> oradores = (List<Orador>)request.getAttribute("oradores");
							for(Orador orador : oradores) {
					%>			
						<div class="card m-2" style="width: 18rem;">
						  <div class="card-body">
						    <h5 class="card-title"><%=orador.getNombre()%></h5>
						    <h6 class="card-subtitle mb-2 text-muted"><%=orador.getApellido()%></h6>
						    <p class="card-text"><%=orador.getTema()%></p>
						    <a href="<%=request.getContextPath()%>/UpdateOradoresController?id=<%=orador.getId()%>" class="btn btn-info" role="button">
						    Editar
						    </a>
						    <button type="button" href="#" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal"
						    onclick="setId(<%=orador.getId()%>)">
						    	Eliminar
						    </button>
						  </div>
						</div>
					<%
							}
					%>	
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    	<form action="<%=request.getContextPath()%>/DeleteOradoresControlller" 
	    		method="get">
		    	  <input type="hidden" name="id" id="id"/>
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Eliminar Orador</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        ¿Desea eliminar a este Orador?
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script type="text/javascript">
		function setId(id) {
			document.getElementById('id').value=id;
		}
	</script>	
	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>