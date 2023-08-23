package model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Producto;
import model.repository.IProductoRepository;

@Service
public class ProductoService {

	// Inyección de dependencia del repositorio de productos
	@Autowired
	private IProductoRepository prRepo;

	// Constructor que permite inyectar el repositorio al servicio
	public ProductoService(IProductoRepository prRepo) {
		this.prRepo = prRepo;
	}

	/**
	 * Obtiene una lista de todos los productos en la base de datos.
	 * 
	 * @return Una lista de objetos Producto.
	 */
	public List<Producto> getProductos() {
		return prRepo.findAllProductos();
	}

	/**
	 * Obtiene un producto por su ID.
	 * 
	 * @param id El ID del producto.
	 * @return El objeto Producto correspondiente al ID.
	 */
	public Producto getproductoById(int id) {
		return prRepo.getOne(id);
	}

	/**
	 * Actualiza la información de un producto en la base de datos.
	 * 
	 * @param p El objeto Producto con la información actualizada.
	 */
	public void update(Producto p) {
		prRepo.save(p);
	}

	/**
	 * Obtiene un producto por su ID junto con sus propiedades asociadas.
	 * 
	 * @param id El ID del producto.
	 * @return El objeto Producto correspondiente al ID con sus propiedades.
	 */
	@Transactional
	public Producto getProductoWithProperties(int id) {
		Producto producto = prRepo.findById(id).orElse(null);

		if (producto != null) {

			return producto;
		}

		return null;
	}
}
