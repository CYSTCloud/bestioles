package tp01.bestioles.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tp01.bestioles.model.Animal;

@Repository
public interface AnimalRepository extends JpaRepository<Animal, Integer> {
}
