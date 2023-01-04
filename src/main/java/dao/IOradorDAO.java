package dao;

import java.util.List;

import domain.Orador;

public interface IOradorDAO {
	
	public Orador getElementById(Long id) throws Exception;
	
	public List<Orador> findAll() throws Exception;
	
	public void create (Orador orador) throws Exception;
	
	public void delete(Long id) throws Exception;
	
	public void update(Orador orador) throws Exception;
	
	public List<Orador> search(String clave) throws Exception;
}
