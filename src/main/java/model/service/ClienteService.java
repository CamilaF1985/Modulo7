package model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Cliente;
import model.repository.IClienteRepository; 

@Service
public class ClienteService {

    private final IClienteRepository clienteRepository;

    @Autowired
    public ClienteService(IClienteRepository clienteRepository) {
        this.clienteRepository = clienteRepository;
    }

    public void registrarCliente(Cliente cliente) {
        clienteRepository.save(cliente);
    }

    public Cliente obtenerClientePorId(Integer id) {
        return clienteRepository.findById(id).orElse(null);
    }
}

