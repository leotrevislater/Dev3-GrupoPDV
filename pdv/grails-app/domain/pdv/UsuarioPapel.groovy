package pdv

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.apache.commons.lang.builder.HashCodeBuilder

@ToString(cache=true, includeNames=true, includePackage=false)
class UsuarioPapel implements Serializable {

	private static final long serialVersionUID = 1

	Usuario usuario
	Papel papel

	UsuarioPapel(Usuario u, Papel r) {
		this()
		usuario = u
		papel = r
	}

	@Override
	boolean equals(other) {
		if (!(other instanceof UsuarioPapel)) {
			return false
		}

		other.usuario?.id == usuario?.id && other.papel?.id == papel?.id
	}

	@Override
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (usuario) builder.append(usuario.id)
		if (papel) builder.append(papel.id)
		builder.toHashCode()
	}

	static UsuarioPapel get(long usuarioId, long papelId) {
		criteriaFor(usuarioId, papelId).get()
	}

	static boolean exists(long usuarioId, long papelId) {
		criteriaFor(usuarioId, papelId).count()
	}

	private static DetachedCriteria criteriaFor(long usuarioId, long papelId) {
		UsuarioPapel.where {
			usuario == Usuario.load(usuarioId) &&
			papel == Papel.load(papelId)
		}
	}

	static UsuarioPapel create(Usuario usuario, Papel papel, boolean flush = false) {
		def instance = new UsuarioPapel(usuario: usuario, papel: papel)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(Usuario u, Papel r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = UsuarioPapel.where { usuario == u && papel == r }.deleteAll()

		if (flush) { UsuarioPapel.withSession { it.flush() } }

		rowCount
	}

	static void removeAll(Usuario u, boolean flush = false) {
		if (u == null) return

		UsuarioPapel.where { usuario == u }.deleteAll()

		if (flush) { UsuarioPapel.withSession { it.flush() } }
	}

	static void removeAll(Papel r, boolean flush = false) {
		if (r == null) return

		UsuarioPapel.where { papel == r }.deleteAll()

		if (flush) { UsuarioPapel.withSession { it.flush() } }
	}

	static constraints = {
		papel validator: { Papel r, UsuarioPapel ur ->
			if (ur.usuario == null || ur.usuario.id == null) return
			boolean existing = false
			UsuarioPapel.withNewSession {
				existing = UsuarioPapel.exists(ur.usuario.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['usuario', 'papel']
		version false
	}
}
