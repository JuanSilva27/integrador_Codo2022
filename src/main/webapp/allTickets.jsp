<%@page import="com.google.protobuf.TextFormatParseInfoTree"%>
<%@page import="domain.Ticket"%>
<%@page import="java.util.List"%>
<!Doctype html>
<html lang="es">
<jsp:include page="head.jsp"/>
<body>
	<!-- navbar -->
	<jsp:include page="navbar.jsp"/>
	<div class="container">
		<div class="row justify-content-center">
		  <div class="col-12 d-flex justify-content-between">
			<div class="col-3">
				<form action="<%=request.getContextPath()%>/FindAllTicketsOrder" method="POST">
					<label for="order">Ordenar por:</label>
					<select class="form-select" aria-label="Default select example" id="categoria" name="order">
						<option selected value="0">Selecione un orden</option>
				        <option value="1">Nombre</option>
				        <option value="2">Apellido</option>
				        <option value="3">Cantidad</option>
				        <option value="4">Categoria</option>
				        <option value="5">Total</option>
				        <option value="6">Mail</option>
					</select>
					<button class="btn btn-primary btnEnviar" style="width:48% ;" id="borrar" type="submit">
						Ordenar
					</button>
				</form>
			  </div>
			
			  <div class="col-3">
					<form action="<%=request.getContextPath()%>/SerchTicketController" method="get">
						<label for="claveBusqueda">Buscar Ticket por tu Nombre:</label>
						<input name="claveBusqueda" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">
		        			Buscar
		        		</button>
					 </form>
			  </div>
		    </div>
			<h1>Listado de productos</h1>
			<div class="col-12 mt-2">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Nombre</th>
							<th scope="col">Apellido</th>
							<th scope="col">Cantidad</th>
							<th scope="col">Categoria</th>
							<th scope="col">Total $</th>
							<th scope="col">Mail</th>
						</tr>
					</thead>
					<tbody>
						<!-- REPETIR/ITERAR SOBRE LA LISTA DE PRODUCTO QUE CARGUE EN EL CONTROLLER -->
						<%
							//capturar /bajar el listado del objeto request 
							String Catego = null;
							List<Ticket> tickets = (List<Ticket>)request.getAttribute("tickets");
							for(Ticket ticket : tickets) {
								switch(ticket.getCategoria().intValue()){
								case 1:
									Catego = "Estudiante";
									break;
								case 2:
									Catego = "Trainee";
									break;
								case 3:
									Catego = "Junior";
									break;
								default:
									Catego="Error";
									break;
								}
						%>
						
								<tr>
									<th scope="row"><%=ticket.getId()%></th>
									<td><%=ticket.getNombre()%></td>
									<td><%=ticket.getApellido()%></td>
									<td><%=ticket.getCantidad()%></td>
									<td><%=Catego%></td>
									<td><%=ticket.getTotal()%></td>
									<td><%=ticket.getMail()%></td>
									<td>
										<!-- Button trigger modal -->
										<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal"
											onclick="setId(<%=ticket.getId()%>)">
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
	    	<form action="<%=request.getContextPath()%>/DeleteTicketsControlller" 
	    		method="get">
		    	  <input type="hidden" name="id" id="id"/>
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Eliminar Ticket</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        ¿Desea eliminar a este Ticket?
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