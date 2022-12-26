package OradorDAOImplement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.IOradorDAO;
import domain.Orador;
import integrador_Codo2022.db.AdministradorDeConexiones;

public class OradorDAOImpl implements IOradorDAO {

	public Orador getElementById(Long id) throws Exception {
		// TODO Auto-generated method stub
		Connection connection = AdministradorDeConexiones.getConnection();
		
		String sql = "select * from oradores where id = " + id;
		
		Statement statement = connection.createStatement();
		
		ResultSet resultSet = statement.executeQuery(sql);
		
		Orador orador = null;
		
		if(resultSet.next()) {
			Long idOrador = resultSet.getLong("id");
			String nombre = resultSet.getString("nombre");
			String apellido = resultSet.getString("apellido");
			String tema = resultSet.getString("tema");
			
			orador = new Orador(idOrador, nombre, apellido, tema);
		}
		
		return orador;
	}

	public List<Orador> findAll() throws Exception {
		// TODO Auto-generated method stub
		Connection connection = AdministradorDeConexiones.getConnection();
		
		String sql = "select * from oradores";
		
		Statement statement = connection.createStatement();
		
		ResultSet resultSet = statement.executeQuery(sql);
		
		List<Orador> oradores = new ArrayList<>();
		
		while(resultSet.next()) {//true|false
			Long idOrador = resultSet.getLong("id");
			String nombre = resultSet.getString("nombre");
			String apellido = resultSet.getString("apellido");
			String tema = resultSet.getString("tema");
			
			Orador orador = new Orador(idOrador, nombre, apellido, tema);
			
			oradores.add(orador);
		}
		
		return oradores;
	}

	public void create(Orador orador) throws Exception {
		// TODO Auto-generated method stub
		Connection connection = AdministradorDeConexiones.getConnection();
		
		String sql = "insert into oradores (nombre,apellido,tema) values(?,?,?)";
		
		PreparedStatement statement = connection.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
		
		statement.setString(1,orador.getNombre());
		statement.setString(2,orador.getApellido());
		statement.setString(3,orador.getTema());
		
		statement.execute();
		
		ResultSet res = statement.getGeneratedKeys();
		
		if(res.next()) {
			orador.setId(res.getLong(1));
		}
		
	}

	public void delete(Long id) throws Exception {
		// TODO Auto-generated method stub
		Connection connection = AdministradorDeConexiones.getConnection();
		
		Statement statement = connection.createStatement();
		
		String sql = "delete from oradores where id = " + id;
		
		int resultSet = statement.executeUpdate(sql);
		
		System.out.println(resultSet);
	}

	public void update(Orador orador) throws Exception {
		// TODO Auto-generated method stub
		Connection connection = AdministradorDeConexiones.getConnection();
		
		String sql = "update oradores set nombre=?,apellido=?,tema=? where id=?";
		
		PreparedStatement statement = connection.prepareStatement(sql);
		
		statement.setString(1,orador.getNombre());
		statement.setString(2,orador.getApellido());
		statement.setString(3,orador.getTema());
		
		statement.setLong(4, orador.getId());
		
		statement.execute();
		
	}

	public List<Orador> search(String clave) throws Exception {
		// TODO Auto-generated method stub
		Connection connection = AdministradorDeConexiones.getConnection();
		
		Statement statement = connection.createStatement();
		
		String sql = "select * from oradores where titulo like '%"+clave+"%'";
		ResultSet resultSet = statement.executeQuery(sql);
		
		List<Orador> oradores = new ArrayList<>();
		
		while(resultSet.next()) {//true|false
			Long idOrador = resultSet.getLong("id");
			String nombre = resultSet.getString("nombre");
			String apellido = resultSet.getString("apellido");
			String tema = resultSet.getString("tema");
			
			Orador orador = new Orador(idOrador, nombre, apellido, tema);
			
			oradores.add(orador);
		}
		
		
		return oradores;
	}

}
