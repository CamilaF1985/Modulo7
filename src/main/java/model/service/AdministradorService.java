package model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Administrador;
import model.repository.IAdministradorRepository;

@Service
public class AdministradorService {

    private final IAdministradorRepository adRepo;

    @Autowired
    public AdministradorService(IAdministradorRepository adRepo, UsuarioService usuarioService) {
        this.adRepo = adRepo;
    }

    public void registrarAdministrador(Administrador administrador) {
        adRepo.save(administrador);
    }
  
  public Administrador getAdministradorById(Long id) {
        return adRepo.getOne(id);
       
    }
  
    public List<Administrador> getAdministradores() {
    
    	
    	return adRepo.findAllAdministradores();
        
    }
    public void update(Administrador a) {
		adRepo.save(a);
	}
    @Transactional
    public Administrador getAdministradorByUserName(String userName) {
        return adRepo.findAdministradorByUsuarioUser(userName);
    }
}