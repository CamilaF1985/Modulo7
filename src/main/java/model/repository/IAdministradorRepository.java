package model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import model.entity.Administrador;



public interface IAdministradorRepository extends JpaRepository<Administrador, Long> {

    @Query("SELECT a FROM Administrador a")
    List<Administrador> findAllAdministradores();
}
