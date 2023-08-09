package model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.entity.Pedido;

public interface IPedidoRepository extends JpaRepository<Pedido, Integer> {
    // Aquí puedes agregar consultas específicas si lo necesitas
    
    @Query("SELECT p FROM Pedido p WHERE p.cliente.id = :clienteId")
    List<Pedido> findPedidosByClienteId(@Param("clienteId") Integer clienteId);
}

