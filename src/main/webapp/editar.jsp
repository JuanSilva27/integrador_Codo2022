<%@page import="domain.Orador" %>
<%
	Orador orador = (Orador)request.getAttribute("orador");
%>

<!Doctype html>
<html lang ="es">
	<jsp:include page="head.jsp"></jsp:include>
	<body>
		<!-- navbar -->
		<jsp:include page="navbar.jsp"/>
		<main class="container mt-2">
			<h1>Editar Orador</h1>
			<div class="row">
				<div class="col-12 mt-2 mb-3">
					<!-- formulario de alta -->
					<form class="row g-3 needs-validation" novalidate
						action="<%=request.getContextPath()%>/UpdateOradoresController?id=<%=orador.getId()%>"
						method="POST">
					  <div class="col-md-4">
					    <label for="validationCustom01" class="form-label">
					    	Nombre
				    	</label>
					    <input
					    	name="nombre" 
					    	type="text" 
					    	class="form-control" 
					    	id="nombre" 
					    	value="<%=orador.getNombre()%>" 
					    	required>
					    <div class="valid-feedback">
					      Looks good!
					    </div>
					  </div>
					  <div class="col-md-4">
					    <label for="validationCustom02" class="form-label">
					    	Apellido
					    </label>
					    <input 
					    	name="apellido"
					    	type="text" 
					    	class="form-control" 
					    	id="apellido" 
					    	value="<%=orador.getApellido()%>"
					    	required>
					    <div class="valid-feedback">
					      Looks good!
					    </div>
					  </div>
					  <div class="col-md-4">
					    <label for="validationCustomUsername" class="form-label">
					    	Tema
					    </label>
					    <div class="input-group has-validation">
					      <textarea class="form-control" id="miTextArea" rows="4" name="tema"><%=orador.getTema()%></textarea>
					    </div>
					  </div>
					  <div class="col-12">
					    <button class="btn btn-primary" type="submit" id="btnEnviar">
					    	Editar
					    </button>
					  </div>
					</form>
				</div>
			</div>	
		</main>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="./js/editValidate.js"></script>
	</body>
</html>