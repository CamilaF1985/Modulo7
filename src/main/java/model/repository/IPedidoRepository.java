package model.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import model.entity.Pedido;

public interface IPedidoRepository extends JpaRepository<Pedido, Integer> {

}

