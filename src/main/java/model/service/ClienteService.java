package model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Cliente;
import model.repository.IClienteRepository;

@Service
public class ClienteService {

	private final IClienteRepository clRepo;

	@Autowired
	public ClienteService(IClienteRepository clRepo, UsuarioService usuarioService) {
		this.clRepo = clRepo;
	}

	// Registra un nuevo cliente en la base de datos
	public void registrarCliente(Cliente cliente) {
		clRepo.save(cliente);
	}

	// Obtiene un cliente por su ID
	public Cliente getClienteById(Long id) {
		return clRepo.getOne(id);
	}

	// Obtiene una lista de todos los clientes
	public List<Cliente> getClientes() {
		return clRepo.findAllClientes();
	}

	// Actualiza la información de un cliente en la base de datos
    @Transactional
    public void update(Cliente c) {
        clRepo.save(c);
    }

	// Obtiene un cliente por su nombre de usuario
	@Transactional
	public Cliente getClienteByUserName(String user) {
		return clRepo.findClienteByUsuarioUser(user);
	}
}
