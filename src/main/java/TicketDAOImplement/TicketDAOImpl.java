package TicketDAOImplement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.ITicketDAO;
import domain.Ticket;
import integrador_Codo2022.db.AdministradorDeConexiones;

public class TicketDAOImpl implements ITicketDAO {
	public Ticket getElementById(Long id) throws Exception {
		
		Connection connection = AdministradorDeConexiones.getConnection();
		String sql = "select * from tickets where id = " + id;
		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);
		Ticket ticket = null;
		
		if(resultSet.next()) {
			Long idTicket = resultSet.getLong("id");
			String nombre = resultSet.getString("nombre");
			String apellido = resultSet.getString("apellido");
			Long cantidad = resultSet.getLong("cantidad");
			Long categoria = resultSet.getLong("categoria");
			Long total = resultSet.getLong("total");
			String mail = resultSet.getString("mail");
			
			ticket = new Ticket(idTicket,nombre, apellido, cantidad, categoria, total,mail);
		}
		
		return ticket;
	}

	@Override
	public List<Ticket> findAll() throws Exception {
		// TODO Auto-generated method stub
		Connection connection = AdministradorDeConexiones.getConnection();
		
		String sql = "select * from tickets";
		
		Statement statement = connection.createStatement();
		
		ResultSet resultSet = statement.executeQuery(sql);
		
		List<Ticket> tickets = new ArrayList<>();
		
		while(resultSet.next()) {
			Long idTicket = resultSet.getLong("id");
			String nombre = resultSet.getString("nombre");
			String apellido = resultSet.getString("apellido");
			Long cantidad = resultSet.getLong("cantidad");
			Long categoria = resultSet.getLong("categoria");
			Long total = resultSet.getLong("total");
			String mail = resultSet.getString("mail");
			
			Ticket ticket = new Ticket(idTicket,nombre, apellido, cantidad, categoria, total, mail);
			
			tickets.add(ticket);
		}		
		
		return tickets;
	}

	@Override
	public void create(Ticket ticket) throws Exception {
		// TODO Auto-generated method stub
		Connection connection = AdministradorDeConexiones.getConnection();
		
		String sql = "insert into tickets (nombre,apellido,cantidad,categoria,total,mail) values(?,?,?,?,?,?)";
		
		PreparedStatement statement = connection.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
		
		statement.setString(1, ticket.getNombre());
		statement.setString(2, ticket.getApellido());
		statement.setLong(3, ticket.getCantidad());
		statement.setLong(4, ticket.getCategoria());
		statement.setLong(5, ticket.getTotal());
		statement.setString(6, ticket.getMail());
		
		statement.execute();
		
		ResultSet res = statement.getGeneratedKeys();
		if(res.next()) {
			ticket.setId(res.getLong(1));
		}
		
	}

	@Override
	public void delete(Long id) throws Exception {
		// TODO Auto-generated method stub
		Connection connection = AdministradorDeConexiones.getConnection();
		
		Statement statement = connection.createStatement();
		
		String sql = "delete from tickets where id = " + id;
		
		int resultSet = statement.executeUpdate(sql);
		
		System.out.println(resultSet);
	}

	@Override
	public void update(Ticket ticket) throws Exception {
		// TODO Auto-generated method stub
		Connection connection = AdministradorDeConexiones.getConnection();
		
		String sql = "update tickets set nombre=?,apellido=?,cantidad=?,categoria=?,total=?, mail=? where id=?";
		
		PreparedStatement statement = connection.prepareStatement(sql);
		
		statement.setString(1, ticket.getNombre());
		statement.setString(2, ticket.getApellido());
		statement.setLong(3, ticket.getCantidad());
		statement.setLong(4, ticket.getCategoria());
		statement.setLong(5, ticket.getTotal());
		statement.setString(6, ticket.getMail());
		
		statement.setLong(7, ticket.getId());
		
		statement.execute();
		
	}

	@Override
	public List<Ticket> search(String clave) throws Exception {
		// TODO Auto-generated method stub
		Connection connection = AdministradorDeConexiones.getConnection();
		
		Statement statement = connection.createStatement();
		
		String sql = "select * from tickets where nombre like '%"+clave+"%'";
		ResultSet resultSet = statement.executeQuery(sql);
		
		List<Ticket> tickets = new ArrayList<>();
		while(resultSet.next()) {
			Long idTicket = resultSet.getLong("id");
			String nombre = resultSet.getString("nombre");
			String apellido = resultSet.getString("apellido");
			Long cantidad = resultSet.getLong("cantidad");
			Long categoria = resultSet.getLong("categoria");
			Long total = resultSet.getLong("total");
			String mail = resultSet.getString("mail");
			
			Ticket ticket = new Ticket(idTicket,nombre, apellido, cantidad, categoria, total,mail);
			
			tickets.add(ticket);
		}		
		
		return tickets;
	}

	@Override
	public List<Ticket> findAllOrderBy(String order) throws Exception {
		String clave = null;
		
		switch(order) {
			case "1":
				clave= "nombre";
				break;
			case "2":
				clave= "apellido";
				break;
			case "3":
				clave = "cantidad";
				break;
			case "4":
				clave ="categoria";
				break;
			case "5":
				clave ="total";
				break;
			case "6":
				clave ="mail";
				break;
			default:
				clave = "id";
				break;
		}
		
		// TODO Auto-generated method stub
		Connection connection = AdministradorDeConexiones.getConnection();
		
		Statement statement = connection.createStatement();
		
		String sql = "select * from tickets order by "+clave;
		
		ResultSet resultSet = statement.executeQuery(sql);
		
		List<Ticket> tickets = new ArrayList<>();
		
		while(resultSet.next()) {
			Long idTicket = resultSet.getLong("id");
			String nombre = resultSet.getString("nombre");
			String apellido = resultSet.getString("apellido");
			Long cantidad = resultSet.getLong("cantidad");
			Long categoria = resultSet.getLong("categoria");
			Long total = resultSet.getLong("total");
			String mail = resultSet.getString("mail");
			
			Ticket ticket = new Ticket(idTicket,nombre, apellido, cantidad, categoria, total,mail);
			
			tickets.add(ticket);
		}
		
		return tickets;
	}
}
