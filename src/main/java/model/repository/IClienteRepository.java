package model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.entity.Cliente;



public interface IClienteRepository extends JpaRepository<Cliente, Long> {

    @Query("SELECT c FROM Cliente c")
    List<Cliente> findAllClientes();
    
    @Query("SELECT c FROM Cliente c INNER JOIN c.usuario u WHERE u.user = :user")
    Cliente findClienteByUsuarioUser(@Param("user") String user);
}











