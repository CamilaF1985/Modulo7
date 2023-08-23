package model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.entity.Usuario;
import model.repository.IUsuarioRepository;

@Service
public class UsuarioService {

	@Autowired
	private IUsuarioRepository usRepo;

	public UsuarioService(IUsuarioRepository usRepo) {
		this.usRepo = usRepo;
	}

	/**
	 * Registra un nuevo usuario en la base de datos.
	 *
	 * @param usuario El objeto Usuario a registrar.
	 * @return El usuario registrado.
	 */
	public Usuario registrarUsuario(Usuario usuario) {
		Usuario usuarioRegistrado = usRepo.save(usuario); // Llamada única a save
		return usuarioRegistrado;
	}

	/**
	 * Obtiene un usuario por su ID.
	 *
	 * @param id El ID del usuario a buscar.
	 * @return El usuario correspondiente al ID.
	 */
	public Usuario getUsuarioById(Long id) {
		return usRepo.getOne(id);
	}

	/**
	 * Obtiene una lista de todos los usuarios en la base de datos.
	 *
	 * @return Lista de usuarios.
	 */
	public List<Usuario> getUsuarios() {
		return usRepo.findAllUsuarios();
	}

	/**
	 * Actualiza la información de un usuario en la base de datos.
	 *
	 * @param u El usuario con la información actualizada.
	 */
	public void update(Usuario u) {
		usRepo.save(u);
	}

	/**
	 * Obtiene el ID de un usuario desde la base de datos.
	 *
	 * @param usuarioId El ID del usuario a buscar.
	 * @return El ID del usuario correspondiente.
	 * @throws RuntimeException Si el usuario no es encontrado.
	 */
	@Transactional
	public Long getUsuarioIdFromDatabase(Long usuarioId) {
		Usuario usuario = usRepo.getOne(usuarioId);
		if (usuario != null) {
			return usuario.getId();
		} else {
			throw new RuntimeException("Usuario no encontrado");
		}
	}
}
