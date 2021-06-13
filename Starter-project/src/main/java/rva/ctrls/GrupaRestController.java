package rva.ctrls;

import java.util.Collection;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import rva.jpa.Grupa;
import rva.repository.GrupaRepository;

@CrossOrigin
@RestController
@Api(tags = {"Grupa CRUD operacije"})

public class GrupaRestController {

	@Autowired
	private GrupaRepository grupaRepository;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@ApiOperation(value="Vraća kolekciju svih grupa iz baze podataka")
	@GetMapping("grupa")
	public Collection<Grupa> getGrupe() {

		return grupaRepository.findAll();
	}
	
	@ApiOperation(value="Vraća grupu na osnovu prosleđenog id-ja")
	@GetMapping("grupa/{id}")
	public Grupa getGrupa(@PathVariable("id") Integer id) {

		return grupaRepository.getOne(id);
	}

	@ApiOperation(value="Vraća kolekciju grupa na osnovu oznake koja se prosledi")
	@GetMapping("grupaOznaka/{oznaka}")
	public Collection<Grupa> getGrupaByNaziv(@PathVariable("oznaka") String oznaka) {
		return grupaRepository.findByOznakaContainingIgnoreCase(oznaka);
	}

	@ApiOperation(value="Dodavanje nove grupe u bazu podataka")
	@PostMapping("grupa") // p
	public ResponseEntity<Grupa> insertGrupa(@RequestBody Grupa grupa) {

		if (!grupaRepository.existsById(grupa.getId())) {
			grupaRepository.save(grupa);
			return new ResponseEntity<Grupa>(HttpStatus.OK);
		}
		return new ResponseEntity<Grupa>(HttpStatus.CONFLICT);

	}

	@ApiOperation(value="Izmena podataka o konkretnoj grupi")
	@PutMapping("grupa")

	public ResponseEntity<Grupa> updateGrupa(@RequestBody Grupa grupa) {

		if (grupaRepository.existsById(grupa.getId())) {
			grupaRepository.save(grupa);
			return new ResponseEntity<Grupa>(HttpStatus.OK);
		}
		return new ResponseEntity<Grupa>(HttpStatus.CONFLICT);

	}
	
	@ApiOperation(value="Brisanje grupe na osnovu prosleđenog id-ja grupe koju korisnik želi da obriše")
	@DeleteMapping("grupa/{id}")
	public ResponseEntity<Grupa> deleteGrupa(@PathVariable("id") Integer id) {

		if (!grupaRepository.existsById(id)) {

			return new ResponseEntity<Grupa>(HttpStatus.NO_CONTENT);
		}

		grupaRepository.deleteById(id);

		if (id == -100) {
			jdbcTemplate.execute("INSERT INTO \"grupa\"(\"id\", \"oznaka\", \"smer\") " + "VALUES (-100, 'test', 1)");
		}

		return new ResponseEntity<Grupa>(HttpStatus.OK);

	}

}
