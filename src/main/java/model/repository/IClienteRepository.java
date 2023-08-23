package model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.entity.Cliente;

public interface IClienteRepository extends JpaRepository<Cliente, Long> {

	// Consulta personalizada para buscar todos los clientes
	@Query("SELECT c FROM Cliente c")
	List<Cliente> findAllClientes();

	// Consulta personalizada para buscar un cliente por el nombre de usuario de su
	// usuario asociado
	@Query("SELECT c FROM Cliente c INNER JOIN c.usuario u WHERE u.user = :user")
	Cliente findClienteByUsuarioUser(@Param("user") String user);
}
