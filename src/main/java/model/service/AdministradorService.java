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

	// Registra un nuevo administrador en la base de datos
	public void registrarAdministrador(Administrador administrador) {
		adRepo.save(administrador);
	}

	// Obtiene un administrador por su ID
	public Administrador getAdministradorById(Long id) {
		return adRepo.getOne(id);
	}

	// Obtiene una lista de todos los administradores
	public List<Administrador> getAdministradores() {
		return adRepo.findAllAdministradores();
	}

	// Actualiza la información de un administrador en la base de datos
	public void update(Administrador a) {
		adRepo.save(a);
	}

	// Obtiene un administrador por su nombre de usuario
	@Transactional
	public Administrador getAdministradorByUserName(String userName) {
		return adRepo.findAdministradorByUsuarioUser(userName);
	}
}
