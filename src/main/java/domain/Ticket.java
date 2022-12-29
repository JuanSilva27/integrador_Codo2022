package domain;

public class Ticket {
	private Long id;
	private String nombre;
	private String apellido;
	private Long cantidad;
	private Long categoria;
	private Long total;
	private String mail;
	
	public Ticket (String nombre,String apellido,Long cantidad,Long categoria,Long total,String mail) {
		this.nombre=nombre;
		this.apellido=apellido;
		this.cantidad=cantidad;
		this.categoria=categoria;
		this.total=total;
		this.mail=mail;
	}
	
	public Ticket (Long id, String nombre,String apellido,Long cantidad,Long categoria,Long total,String mail) {
		this.id=id;
		this.nombre=nombre;
		this.apellido=apellido;
		this.cantidad=cantidad;
		this.categoria=categoria;
		this.total=total;
		this.mail=mail;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public Long getCantidad() {
		return cantidad;
	}

	public void setCantidad(Long cantidad) {
		this.cantidad = cantidad;
	}

	public Long getCategoria() {
		return categoria;
	}

	public void setCategoria(Long categoria) {
		this.categoria = categoria;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}
	
}
