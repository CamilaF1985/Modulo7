package model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.entity.Producto;
import java.util.List;

public interface IProductoRepository extends JpaRepository<Producto, Integer> {
    
    @Query("SELECT p FROM Producto p")
    List<Producto> findAllProductos();
    
    @Query("SELECT p FROM Producto p WHERE p.id = :productoId")
    Producto findProductoById(@Param("productoId") Integer productoId);
}



