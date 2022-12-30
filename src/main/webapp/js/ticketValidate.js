window.addEventListener("load",()=>{
	const $ = (id)=>{
		return document.getElementById(id)
	}
	
	let expRegMail = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/
	let regExNumeros = /^[0-9]*$/
	
	const nombre = $("nombre")
	const apellido = $("apellido")
	const mail = $("correo")
	const form = $("ticketForm")
	const cantidad= $("cantidad")
	const categoria = $("categoria")
	const total= $("inputTotal")
	const btnResumen= $("resumen")
	let btnBorrar = $("borrar");
	
	const button = $("comprar")
	button.disabled = true
 	button.style.backgroundColor = 'gray'
 	button.style.borderColor = 'gray'
 	button.classList.remove("btnEnviar")
	
	const validate = {
		nombre: false,
		apellido:false,
		mail:false,
		cantidad:false,
		categoria:false,
		total:false,
	}
	
	const funcValidate = (obj) => {
	     let arr = Object.values(obj)
	     if(!arr.includes(false)){
	         button.disabled= false
	        
	         button.style.backgroundColor = null
 			 button.style.borderColor = null
 			 button.classList.add("btnEnviar")
	     	} else{
	         button.disabled = true
	         button.style.backgroundColor = 'gray'
 			 button.style.borderColor = 'gray'
			 button.classList.remove("btnEnviar")
	     	}
 	 }
	
	nombre.addEventListener("input",(e)=>{
		if(e.target.value.length<2){
			nombre.classList.remove("is-valid")
        	nombre.classList.add("is-invalid")
			validate.nombre=false
		}else{
			nombre.classList.remove("is-invalid")
        	nombre.classList.add("is-valid")
			validate.nombre=true
		}
		funcValidate(validate)
	})
	
	apellido.addEventListener("input",(e)=>{
		if(e.target.value.length<2){
			apellido.classList.remove("is-valid")
        	apellido.classList.add("is-invalid")
			validate.apellido=false
		}else{
			apellido.classList.remove("is-invalid")
        	apellido.classList.add("is-valid")
			validate.apellido=true
		}
		funcValidate(validate)
	})
	
	mail.addEventListener("input",(e)=>{
		let value= e.target.value
		console.log(!expRegMail.test(value.toLowerCase()))
		switch(true){
			case value.length<2:
				mail.classList.remove("is-valid")
	        	mail.classList.add("is-invalid")
				validate.mail=false
				break;
			case !expRegMail.test(value.toLowerCase()):
				mail.classList.remove("is-valid")
	        	mail.classList.add("is-invalid")
				validate.mail=false
				break
			case !value:
				mail.classList.remove("is-valid")
	        	mail.classList.add("is-invalid")
				validate.mail=false
				break
			default:
				mail.classList.remove("is-invalid")
	        	mail.classList.add("is-valid")
				validate.mail=true
				break

		}
		funcValidate(validate)
	})
	
	cantidad.addEventListener("input",(e)=>{
		let value = e.target.value
		
		switch(true){
			case value.length<1:
				cantidad.classList.remove("is-valid")
		        cantidad.classList.add("is-invalid")
				validate.cantidad=false
				break
			case !regExNumeros.test(value):
				cantidad.classList.remove("is-valid")
		        cantidad.classList.add("is-invalid")
				validate.cantidad=false
				break
			case !value:
				cantidad.classList.remove("is-valid")
		        cantidad.classList.add("is-invalid")
				validate.cantidad=false
				break
			default:
				cantidad.classList.remove("is-invalid")
		        cantidad.classList.add("is-valid")
				validate.cantidad=true
				break
		}
		funcValidate(validate)
	})
	
	cantidad.addEventListener("change",(e)=>{
		if(cantidad.value==0){
			validate.categoria=false
		}else{
			validate.categoria=true
		}
		funcValidate(validate)
	})
	
	btnResumen.addEventListener("click",(e)=>{
		if(cantidad.value.length>0 && categoria.value !==0){
			validate.total=true
		}else{
			validate.total=false
		}
		funcValidate(validate)
	})
	
	btnBorrar.addEventListener("click",(e)=>{
		
		nombre.classList.remove("is-valid")
        nombre.classList.add("is-invalid")
		validate.nombre=false
		
		apellido.classList.remove("is-valid")
        apellido.classList.add("is-invalid")
		validate.apellido=false
		
		mail.classList.remove("is-valid")
	    mail.classList.add("is-invalid")
		validate.mail=false
		
		cantidad.classList.remove("is-valid")
		cantidad.classList.add("is-invalid")
		validate.cantidad=false
		
		validate.categoria=false
		validate.total=false
		
		funcValidate(validate)
	})
	
})