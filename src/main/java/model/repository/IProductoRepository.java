package model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import model.entity.Producto;

public interface IProductoRepository extends JpaRepository<Producto, Integer> {
    // Puedes agregar consultas específicas si las necesitas
}

