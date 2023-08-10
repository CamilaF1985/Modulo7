package model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Producto;
import model.repository.IProductoRepository;

@Service
public class ProductoService {
	@Autowired
    private IProductoRepository prRepo;
  
  public ProductoService(IProductoRepository prRepo) {
       this.prRepo = prRepo;
    }
  public Producto getProductoById(int id) {
        return prRepo.getOne(id);
       
    }
  
    public List<Producto> getProductos() {
    	
    	return prRepo.findAllProductos();
        
    }
    public void update(Producto p) {
		prRepo.save(p);
	}
    @Transactional
    public Producto getProductoWithProperties(int id) {
        Producto producto = prRepo.findById(id).orElse(null);
        
        if (producto != null) {
            // Cargar propiedades relacionadas adicionales aquí

            
            // Puedes hacer más operaciones para cargar otras propiedades
            
            return producto;
        }
        
        return null;
    }
}

