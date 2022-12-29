<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"></jsp:include>

<body>
    <jsp:include page="navbar.jsp"/>

    <main>
		
        <div class="row justify-content-center mt-4 mb-1 gx-0">
        	<div class="col-8 mt-4 d-flex justify-content-center mb-3">
	        		<a class="btn btn-primary" href="<%=request.getContextPath()%>/FindAllTicketsController">Consulta tu Ticket </a>
	    	</div>
            <div class="row col-10 justify-content-center">
                <div class="col-3 ps-1 pe-1">
                    <div class="card border-primary" style="width:100%;">
                        <div class="card-body d-flex flex-column align-items-center pe-0 ps-0">
                            <h5 class="card-title mb-3 mt-2 fs-3">Estudiante</h5>
                            <h6 class="card-subtitle mb-2 fs-5 fw-normal">Tiene un descuento</h6>
                            <p class="card-text fw-bold  mb-3 mt-2">80%</p>
                            <p class="card-subtitle mb-2 text-muted">*presentar documentacion</p>
                        </div>
                    </div>
                </div>
                <div class="col-3 ps-1 pe-1">
                    <div class="card border-success" style="width:100%;">
                        <div class="card-body d-flex flex-column align-items-center pe-0 ps-0">
                            <h5 class="card-title mb-3 mt-2 fs-3">Trainee</h5>
                            <h6 class="card-subtitle mb-2 fs-5 fw-normal">Tiene un descuento</h6>
                            <p class="card-text fw-bold  mb-3 mt-2">50%</p>
                            <p class="card-subtitle mb-2 text-muted">*presentar documentacion</p>
                        </div>
                    </div>
                </div>
                <div class="col-3 ps-1 pe-1">
                    <div class="card border-warning" style="width:100%;">
                        <div class="card-body d-flex flex-column align-items-center pe-0 ps-0">
                            <h5 class="card-title  mb-3 mt-2 fs-3">Junior</h5>
                            <h6 class="card-subtitle mb-2 fs-5 fw-normal">Tiene un descuento</h6>
                            <p class="card-text fw-bold  mb-3 mt-2">15%</p>
                            <p class="card-subtitle mb-2 text-muted">*presentar documentacion</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="venta">
            <h5 class="text-center fw-normal">Venta</h5>
            <h1 class="text-center">VALOR DEL TICKET $200</h1>
        </div>
        <section class="mb-4">
			<form action="<%=request.getContextPath()%>/CreateTicketsController" method="POST">
	            <div class="container-fluid row justify-content-center">
	                <div class="col-12 ps-5 pe-4 d-flex flex-wrap justify-content-center">
	                    <div class="col-8 d-flex justify-content-between">
	                        <div class="formNombre">
	                            <input type="text" name="nombre" class="form-control" placeholder="Nombre" aria-label="First name" id="nombre">
	                        </div>
	                        <div class="formApellido">
	                            <input type="text" class="form-control" name="apellido" placeholder="Apellido" aria-label="Last name" id="apellido">
	                        </div>
	                    </div>
	                    <div class="col-8 mt-4">
	                        <div>
	                            <input type="email" class="form-control" placeholder="Correo" name="mail" aria-label="Last name" id="correo">
	                        </div>
	                    </div>
	                    <div class="col-8 mt-4  d-flex justify-content-between">
	                        <div style="width:48% ;">
	                            <label for="cantidad">Cantidad</label>
	                            <input type="text" name="cantidad" id="cantidad" class="form-control" placeholder="cantidad"
	                                style="width:100% ;">
	                        </div>
	                        <div style="width:48% ;">
	                            <label for="categoria">Categoria</label>
	                            <select class="form-select" aria-label="Default select example" id="categoria" name="categoria">
	                                <option selected value="0">Selecione una categoria</option>
	                                <option value="1">Estudiante</option>
	                                <option value="2">Trainee</option>
	                                <option value="3">Junior</option>
	                            </select>
	                        </div>
	                    </div>
	                    <div class="alert alert-primary col-8 mt-4" id="total">
	                        Total a Pagar:$
	                    </div>
	                    <input  type="text" hidden name="inputTotal" id="inputTotal">
	                    <div class="col-8 mt-4 d-flex justify-content-between">
	                        <p class="btn btn-primary col-8 btnEnviar" style="width:48% ;" id="borrar">Borrar</p>
	                        <p class="btn btn-primary col-8 btnEnviar" style="width:48% ;" id="resumen">Resumen</p>
	                    </div>
	                    <div class="col-8 mt-4 d-flex justify-content-center">
	                        <button class="btn btn-primary btnEnviar" style="width:48% ;" id="borrar" type="submit">Comprar</button>
	                    </div>
	                </div>
	            </div>
            </form>
			
        </section>

    </main>

<jsp:include page="footer.jsp"></jsp:include>
    <script src="./js/script.js"></script>
</body>

</html>