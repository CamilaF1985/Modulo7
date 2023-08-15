package model.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import model.entity.Pedido;

public interface IPedidoRepository extends JpaRepository<Pedido, Long> {
    List<Pedido> findAll(); // Utiliza el método definido por defecto en JpaRepository
    
    List<Pedido> findByFechaIngresoBetween(LocalDateTime startDateTime, LocalDateTime endDateTime);
    
    List<Pedido> findByFechaDespachoNotNull();
    
    List<Pedido> findByFechaDespachoIsNull();
    
    @Query("SELECT DISTINCT p FROM Pedido p JOIN FETCH p.pedidosProductos")
    List<Pedido> findAllWithProductos();
    
    
}






