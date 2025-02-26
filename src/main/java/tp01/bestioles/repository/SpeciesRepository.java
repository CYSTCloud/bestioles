package tp01.bestioles.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tp01.bestioles.model.Species;

@Repository
public interface SpeciesRepository extends JpaRepository<Species, Integer> {
}
