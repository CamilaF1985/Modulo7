package model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.entity.Pedido;

public interface IPedidoRepository extends JpaRepository<Pedido, Integer> {
	
    List<Pedido> findAll(); // Utiliza el método definido por defecto en JpaRepository
}





