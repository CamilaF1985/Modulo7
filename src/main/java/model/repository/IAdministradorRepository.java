package model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.entity.Administrador;

public interface IAdministradorRepository extends JpaRepository<Administrador, Long> {

	// Consulta personalizada para buscar todos los administradores
	@Query("SELECT a FROM Administrador a")
	List<Administrador> findAllAdministradores();

	// Consulta personalizada para buscar un administrador por el nombre de usuario
	// de su usuario asociado
	@Query("SELECT a FROM Administrador a INNER JOIN a.usuario u WHERE u.user = :user")
	Administrador findAdministradorByUsuarioUser(@Param("user") String user);
}
