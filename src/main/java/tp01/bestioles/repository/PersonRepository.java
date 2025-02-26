package tp01.bestioles.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tp01.bestioles.model.Person;

@Repository
public interface PersonRepository extends JpaRepository<Person, Integer> {
}
