package dao;

import java.util.List;

import domain.Ticket;

public interface ITicketDAO {
	
	public Ticket getElementById(Long id) throws Exception;
	
	public List<Ticket> findAll() throws Exception;
	
	public void create (Ticket ticket) throws Exception;
	
	public void delete(Long id) throws Exception;
	
	public void update(Ticket ticket) throws Exception;
	
	public List<Ticket> search(String clave) throws Exception;
	
	public List<Ticket> findAllOrderBy(String clave) throws Exception;
}
