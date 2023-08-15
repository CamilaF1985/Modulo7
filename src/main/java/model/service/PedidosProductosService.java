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

    public void registrarPedidosProductos(PedidosProductos pedidosProductos) {
        ppRepo.save(pedidosProductos);
    }
  
    public List<PedidosProductos> getPedidosProductos() {
        return ppRepo.findAllPedidosProductos();
    }
    
    public void update(PedidosProductos pp) {
		ppRepo.save(pp);
	}
    public PedidosProductos getPedidosProductosById(Long id) {
        return ppRepo.getOne(id);
       
    }
    
}
