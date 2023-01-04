	$ =(id)=>{
	    return document.getElementById(id)
	}
	
	
	let btnBorrar = $("borrar");
	let btnResumen = $("resumen");
	let cantidad = $("cantidad");
	let categoria = $("categoria");
	let valorTicket = 200;
	let totalPagar = $("total")
	let nombre = $("nombre")
	let apellido = $("apellido")
	let correo = $("correo")
	let inputTotal =$("inputTotal")
	
	total = (cantidad, categoria, valorTicket) => {
	  let resultado;
	  switch (true) {
	    case categoria===1 && !isNaN(cantidad):
	      resultado = cantidad * (valorTicket - valorTicket * 0.8);
	      break;
	    case categoria===2 && !isNaN(cantidad):
	      resultado = cantidad * (valorTicket - valorTicket * 0.5);
	      break;
	    case categoria===3 && !isNaN(cantidad):
	      resultado = cantidad * (valorTicket - valorTicket * 0.15);
	      break;
	    default:
	      console.log("no se han completado correctamnete los campos");
	      break
	  }
	  return resultado
	};
	
	btnResumen.addEventListener("click", () => {
	  let categoriaParsed = parseInt(categoria.value);
	  let cantidadParsed = parseInt(cantidad.value);
	
	  let resultado = total(cantidadParsed,categoriaParsed,valorTicket)
	  if(resultado!==undefined && !isNaN(resultado)){
	    totalPagar.innerText= `Total a Pagar:$${resultado}`
	    inputTotal.value=resultado
	  }
	  else{
	    alert("no se han completado correctamente los campos requeridos")
	  }
	  
	});
	
	btnBorrar.addEventListener("click",()=>{
	    totalPagar.innerText= `Total a Pagar:$`
	    cantidad.value=""
	    categoria.value=0
	    nombre.value=""
	    apellido.value=""
	    correo.value=""
	})