package tp01.bestioles;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import tp01.bestioles.model.Animal;
import tp01.bestioles.model.Species;
import tp01.bestioles.repository.AnimalRepository;
import tp01.bestioles.repository.SpeciesRepository;

import java.util.List;
import java.util.Optional;

@SpringBootApplication
public class BestiolesApplication implements CommandLineRunner {

    @Autowired
    private AnimalRepository animalRepository;
    
    @Autowired
    private SpeciesRepository speciesRepository;

    public static void main(String[] args) {
        SpringApplication.run(BestiolesApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        System.out.println("===== Testing Animal Repository =====");
        
        List<Animal> animals = animalRepository.findAll();
        System.out.println("Liste des animaux (" + animals.size() + " animaux trouvés):");
        for (Animal animal : animals) {
            System.out.println("- " + animal.getName() + " (" + animal.getColor() + "), " 
                    + animal.getSex() + ", espèce: " + animal.getSpecies().getCommonName());
        }
        
        System.out.println("\nCréation d'un nouvel animal...");
        Animal newAnimal = new Animal();
        newAnimal.setName("Rex");
        newAnimal.setColor("Noir et blanc");
        newAnimal.setSex("M");
        
        Optional<Species> species = speciesRepository.findById(2);
        if (species.isPresent()) {
            newAnimal.setSpecies(species.get());
            Animal savedAnimal = animalRepository.save(newAnimal);
            System.out.println("Animal créé avec l'ID: " + savedAnimal.getId());
            
            System.out.println("\nRecherche de l'animal avec l'ID " + savedAnimal.getId());
            Optional<Animal> foundAnimal = animalRepository.findById(savedAnimal.getId());
            if (foundAnimal.isPresent()) {
                System.out.println("Animal trouvé: " + foundAnimal.get().getName());
            } else {
                System.out.println("Animal non trouvé");
            }
            
            System.out.println("\nSuppression de l'animal avec l'ID " + savedAnimal.getId());
            animalRepository.delete(savedAnimal);
            
            List<Animal> updatedAnimals = animalRepository.findAll();
            System.out.println("Nombre d'animaux après suppression: " + updatedAnimals.size());
        } else {
            System.out.println("Espèce non trouvée");
        }
    }
}
