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

    public void registrarCliente(Cliente cliente) {
        clRepo.save(cliente);
    }
  
  public Cliente getClienteById(Long id) {
        return clRepo.getOne(id);
       
    }
  
    public List<Cliente> getClientes() {
    
    	
    	return clRepo.findAllClientes();
        
    }
    public void update(Cliente c) {
		clRepo.save(c);
	}
    @Transactional
    public Cliente getClienteByUserName(String user) {
        return clRepo.findClienteByUsuarioUser(user);
    }
}


