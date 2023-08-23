package model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import model.entity.Pedido;
import model.entity.PedidosProductos;

import java.util.List;

public interface IPedidosProductosRepository extends JpaRepository<PedidosProductos, Long> {

	// Consulta personalizada para buscar todos los registros de PedidosProductos
	@Query("SELECT pp FROM PedidosProductos pp")
	List<PedidosProductos> findAllPedidosProductos();

	// Consulta personalizada para calcular el precio total de un pedido basado en
	// la suma de precios de productos
	@Query("SELECT COALESCE(SUM(pp.producto.precio * pp.cantidad), 0) FROM PedidosProductos pp WHERE pp.pedido = ?1")
	int sumPrecioTotalByPedido(Pedido pedido);
}
