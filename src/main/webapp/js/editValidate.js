window.addEventListener("load",()=>{
	const $ = (id)=>{
		return document.getElementById(id)
	}
	const nombre = $("nombre")
	const apellido = $("apellido")
	const tema = $("miTextArea")
	const form = $("oradoresForm")
	
	
	const button = $("btnEnviar")
	button.disabled = true
 	button.style.backgroundColor = 'gray'
 	button.style.borderColor = 'gray'
 	button.classList.remove("btn-primary")
 	
 	const validate = {
		nombre: false,
		apellido:false,
		tema:false
	}
	
	const funcValidate = (obj) => {
	     let arr = Object.values(validate)
	     if(!arr.includes(false)){
	         button.disabled= false
	        
	         button.style.backgroundColor = null
 			 button.style.borderColor = null
 			 button.classList.add("btn-primary")
	     	} else{
	         button.disabled = true
	         button.style.backgroundColor = 'gray'
 			 button.style.borderColor = 'gray'
			 button.classList.remove("btn-primary")
	     	}
 	 }
 	
 	if(nombre.value.length<2){
			nombre.classList.remove("is-valid")
        	nombre.classList.add("is-invalid")
			validate.nombre=false
		} else {
			nombre.classList.remove("is-invalid")
        	nombre.classList.add("is-valid")
			validate.nombre=true
		}
	if(apellido.value.length<2){
			apellido.classList.remove("is-valid")
        	apellido.classList.add("is-invalid")
			validate.apellido=false
		} else {
			apellido.classList.remove("is-invalid")
        	apellido.classList.add("is-valid")
			validate.apellido=true
		}
	if(tema.value.length<1){
			tema.classList.remove("is-valid")
        	tema.classList.add("is-invalid")
			validate.tema=false
			
		} else {
			tema.classList.remove("is-invalid")
        	tema.classList.add("is-valid")
			validate.tema=true
		}
	
 	funcValidate(validate)
 	
 	
 	nombre.addEventListener("input",(e)=>{
		if(e.target.value.length<2){
			nombre.classList.remove("is-valid")
        	nombre.classList.add("is-invalid")
			validate.nombre=false
		} else {
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
		} else {
			apellido.classList.remove("is-invalid")
        	apellido.classList.add("is-valid")
			validate.apellido=true
		}
		
		funcValidate(validate)
	})
	
	tema.addEventListener("change",(e)=>{
				
		if(tema.value.length<1){
			tema.classList.remove("is-valid")
        	tema.classList.add("is-invalid")
			validate.tema=false
			
		} else {
			tema.classList.remove("is-invalid")
        	tema.classList.add("is-valid")
			validate.tema=true
		}
		funcValidate(validate)
	})

	
	form.addEventListener("submit",(e)=>{
        e.preventDefault();
        let arr = Object.values(validate)
        if(!arr.includes(false)){
            form.submit()
        }
    })
 	
})