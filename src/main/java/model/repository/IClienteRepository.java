package model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.entity.Cliente;

public interface IClienteRepository extends JpaRepository<Cliente, Integer> {
    
    // Consulta para obtener un cliente por su ID
    @Query("SELECT c FROM Cliente c WHERE c.id = :clienteId")
    Cliente findClienteById(@Param("clienteId") Integer clienteId);
}


