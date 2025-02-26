package tp01.bestioles.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tp01.bestioles.model.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Integer> {
}
