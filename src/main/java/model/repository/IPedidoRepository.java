package model.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.entity.Pedido;

public interface IPedidoRepository extends JpaRepository<Pedido, Long> {
    List<Pedido> findAll(); // Utiliza el método definido por defecto en JpaRepository
    
    List<Pedido> findByFechaIngresoBetween(LocalDateTime startDateTime, LocalDateTime endDateTime);
    
    List<Pedido> findByFechaDespachoNotNull();
    
    List<Pedido> findByFechaDespachoIsNull();
    
    
}






