package model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import model.entity.Producto;
import java.util.List;

public interface IProductoRepository extends JpaRepository<Producto, Integer> {
    
    @Query("SELECT p FROM Producto p")
    List<Producto> findAllProductos();
}



