package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.PedidosProductos;
import model.repository.IPedidosProductosRepository;

@Service
public class PedidosProductosService {

	private final IPedidosProductosRepository ppRepo;

	@Autowired
	public PedidosProductosService(IPedidosProductosRepository ppRepo) {
		this.ppRepo = ppRepo;
	}

	// Registra un nuevo objeto PedidosProductos en la base de datos
	public void registrarPedidosProductos(PedidosProductos pedidosProductos) {
		ppRepo.save(pedidosProductos);
	}

	// Obtiene una lista de todos los objetos PedidosProductos en la base de datos
	public List<PedidosProductos> getPedidosProductos() {
		return ppRepo.findAllPedidosProductos();
	}

	// Actualiza la información de un objeto PedidosProductos en la base de datos
	public void update(PedidosProductos pp) {
		ppRepo.save(pp);
	}

	// Obtiene un objeto PedidosProductos por su ID
	public PedidosProductos getPedidosProductosById(Long id) {
		return ppRepo.getOne(id);
	}

}
