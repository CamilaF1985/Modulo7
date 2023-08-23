package model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Contacto;
import model.repository.IContactoRepository;

@Service
public class ContactoService {
	@Autowired
	private IContactoRepository contactoRepository;

	// Constructor de la clase ContactoService
	public ContactoService() {
		super();
	}

	// Crea y guarda un nuevo registro de contacto en la base de datos
	public Contacto crearContacto(Contacto contacto) {
		return contactoRepository.save(contacto);
	}
}
