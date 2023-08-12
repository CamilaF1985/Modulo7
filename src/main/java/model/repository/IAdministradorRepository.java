package model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.entity.Administrador;

public interface IAdministradorRepository extends JpaRepository<Administrador, Long> {

    @Query("SELECT a FROM Administrador a")
    List<Administrador> findAllAdministradores();
    
    @Query("SELECT a FROM Administrador a INNER JOIN a.usuario u WHERE u.user = :user")
    Administrador findAdministradorByUsuarioUser(@Param("user") String user);
}

