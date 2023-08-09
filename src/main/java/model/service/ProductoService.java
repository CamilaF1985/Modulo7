package model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import model.entity.Producto;
import model.repository.IProductoRepository;

@Service
public class ProductoService {

    private final IProductoRepository productoRepository;

    @Autowired
    public ProductoService(IProductoRepository productoRepository) {
        this.productoRepository = productoRepository;
    }

    public Producto obtenerProductoPorId(Integer id) {
        return productoRepository.findById(id).orElse(null);
    }
}
