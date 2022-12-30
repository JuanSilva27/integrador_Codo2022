<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"/>

<body>

	<jsp:include page="navbar.jsp"/>
	
    <main>
        <section>
            <div class="card bg-dark text-white miCardConteiner" id="Conferencia">
                <img src="./img/ba1.jpg" class="card-img miImg" alt="...">
                <div class="card-img-overlay d-flex flex-column align-items-end justify-content-center ConfConteiner">
                    <h5 class="card-title ConfTitulo">Conf Bs As</h5>
                    <p class="card-text text-end ConfText">Bs As llega por primera vez a Argentina. Un evento para
                        compartir con nuestra comunidad el conocimiento y experiencia de los expertos que estan creando
                        el futuro del internet. Ven a conocer a miembros del evento, a otros estudiantes de Codo a Codo
                        y a los oradores de primer nivel que tenemos para ti. Te esperamos!</p>
                    <div class="col-5 d-flex justify-content-end">
                        <a href="#" class="btn btn-primary btnOrador m-2">Quiero ser orador</a>
                        <a href="#" class="btn btn-primary btnTickets m-2">Comprar tickets</a>
                    </div>
                </div>
            </div>
        </section>
        <section class="Oradores" id="Oradores">
            <div class="d-flex flex-column align-items-center">
                <h5 class="miH5">CONOCE A LOS</h5>
                <h1> ORADORES</h1>
            </div>
            <div class="cardConteiner">
                <div class="row">
                    <div class="col-4">
                        <div class="card">
                            <img src="./img/steve.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <p class="btn btn-warning">Javascript</p>
                                <p class="btn btn-info">React</p>
                                <h5 class="card-title">Steve Jobs</h5>
                                <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas
                                    blanditiis, optio quam eius dolores quidem autem cumque culpa excepturi tempora
                                    assumenda, mollitia vel pariatur quod eos animi ab laborum error?</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card">
                            <img src="./img/bill.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <p class="btn btn-warning">Javascript</p>
                                <p class="btn btn-info">React</p>
                                <h5 class="card-title">Bill Gates</h5>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et
                                    praesentium accusamus animi laboriosam harum quia iusto officiis eveniet ullam,
                                    adipisci eos ratione fuga ad quidem facilis ut?</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card">
                            <img src="./img/ada.jpeg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <p class="btn btn-secondary">Negocios</p>
                                <p class="btn btn-danger">Startups</p>
                                <h5 class="card-title">Ada Lovelace</h5>
                                <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Suscipit,
                                    sunt nemo esse porro officiis recusandae, accusamus fuga sapiente dolorum culpa
                                    reprehenderit neque.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="lugar" id="Lugar">
            <div class="card mb-3 miCardLugar miCardConteiner" style="max-width: 100%;">
                <div class="row g-0">
                    <div class="col-md-6">
                        <img src="./img/honolulu.jpg" class="img-fluid " alt="...">
                    </div>
                    <div class="col-md-6">
                        <div class="card-body">
                            <h5 class="card-title h5Lugar">Bs As - Octubre</h5>
                            <p class="card-text pLugar">Buenos Aires es la provincia y la localidad mas grande del
                                estado de
                                Argentina, en los Estados Unidos. Honolulu es la más sureña de entre las principales
                                ciudades estadounidenses. Aunque el nombre Honolulu se refiere al área urbana en la
                                costa sureste de la isla de Oahu, la ciudad y el condado de Honolulu han formado una
                                ciudad-condado consolidada que cubre toda la ciudad (aproximadamente 600km² de
                                superficie).</p>
                            <a href="" class="btn btn-primary btnLugar">Conocé más</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="mb-4" id="Conviertete">
            <div class="d-flex flex-column align-items-center">
                <h5 class="miH5">CONVIERTETE EN UN</h5>
                <h1> ORADOR</h1>
                <p>Anótate como orador para dar una <a href="" class="formA">charla ignite.</a>Cuéntanos de qué queres hablar!</p>
            </div>
            <div>
	            <form id="oradoresForm" action="<%=request.getContextPath()%>/CreateOradoresController" method="POST">
	                <div class="container-fluid row justify-content-center">
	                    <div class="col-9 d-flex flex-wrap justify-content-center">
	                        <div class="col-8 d-flex justify-content-between">
	                            <div class="formNombre">
	                            	<label hidden for="First name" class="form-label">Last name</label>
	                                <input type="text" class="form-control" placeholder="Nombre" aria-label="First name" name="nombre" id="nombre">
	                            </div>
	                            <div class="formApellido">
	                             	<label hidden for="Last name" class="form-label">Last name</label>
	                                <input type="text" class="form-control" placeholder="Apellido" aria-label="Last name" name="apellido" id="apellido">
	                            </div>
	                        </div>
	                        <div class="col-8 mt-4">
	                            <label hidden for="exampleFormControlTextarea1" class="form-label">Example textarea</label>
	                            <textarea class="form-control" id="miTextArea" rows="4" placeholder="Sobre qué quieres hablar?" name="tema"></textarea>
	                        </div>
	                        <p class="col-8 formP">Recuerda incluir un título para tu charla</p>
	                        <button href="" class="btn btn-primary col-8 btnEnviar" id="btnEnviar"type="submit">Enviar</button>
	                    </div>
	                    <div>
	                        	<a  aria-current="page" href="<%=request.getContextPath()%>/FindAllOradoresController">>
	                        		Ver a los demas oradores Inscriptos
	                        	</a>
	                    </div>
	                </div>
	            </form>
            </div>
        </section>
    </main>

<jsp:include page="footer.jsp"/>
<script src="./js/validate.js"></script>
</body>

</html>