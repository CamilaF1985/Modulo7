package model.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import model.entity.Pedido;

public interface IPedidoRepository extends JpaRepository<Pedido, Long> {

	// Utiliza el método definido por defecto en JpaRepository para buscar todos los
	// pedidos
	List<Pedido> findAll();

	// Busca pedidos en un rango de fechas de ingreso
	List<Pedido> findByFechaIngresoBetween(LocalDateTime startDateTime, LocalDateTime endDateTime);

	// Busca pedidos con fecha de despacho no nula
	List<Pedido> findByFechaDespachoNotNull();

	// Busca pedidos con fecha de despacho nula
	List<Pedido> findByFechaDespachoIsNull();

	// Realiza una consulta personalizada para buscar todos los pedidos con sus
	// productos asociados
	@Query("SELECT DISTINCT p FROM Pedido p JOIN FETCH p.pedidosProductos")
	List<Pedido> findAllWithProductos();
}
