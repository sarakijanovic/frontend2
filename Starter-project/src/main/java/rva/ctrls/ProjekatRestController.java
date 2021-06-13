package rva.ctrls;

import java.util.Collection;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import rva.jpa.Projekat;
import rva.repository.ProjekatRepository;

@CrossOrigin
@RestController
@Api(tags = {"Projekat CRUD operacije"})
public class ProjekatRestController {

	@Autowired
	public ProjekatRepository projekatRepository;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@ApiOperation(value="Vraća kolekciju projekata")
	@GetMapping("projekat")
	public Collection<Projekat> getProjekti() {

		return projekatRepository.findAll();
	}

	@ApiOperation(value="Vraća projekat na osnovu prosleđenog id-ja")
	@GetMapping("projekat/{id}")
	public Projekat getProjekat(@PathVariable("id") Integer id) {

		return projekatRepository.getOne(id);
	}
	@ApiOperation(value="Vraća kolekciju projekata na osnovu prosleđenog naziva")
	@GetMapping("projekatNaziv/{naziv}")
	public Collection<Projekat> getProjektiByNaziv(@PathVariable("naziv") String naziv) {

		return projekatRepository.findByNazivContainingIgnoreCase(naziv);

	}

	@ApiOperation(value="Dodavanje podataka o novom projektu")
	@PostMapping("projekat")
	public ResponseEntity<Projekat> insertProjekat(@RequestBody Projekat projekat) {

		if (!projekatRepository.existsById(projekat.getId())) {
			projekatRepository.save(projekat);
			return new ResponseEntity<Projekat>(HttpStatus.OK);
		}

		return new ResponseEntity<Projekat>(HttpStatus.CONFLICT);
	}

	@ApiOperation(value="Izmena podataka o projektu")
	@PutMapping("projekat")
	public ResponseEntity<Projekat> updateProjekat(@RequestBody Projekat projekat) {

		if (!projekatRepository.existsById(projekat.getId()))
			return new ResponseEntity<Projekat>(HttpStatus.CONFLICT);

		projekatRepository.save(projekat);
		return new ResponseEntity<Projekat>(HttpStatus.OK);

	}
	
	@ApiOperation(value="Brisanje projekta na osnovu prosleđenog id-ja")
	@DeleteMapping("projekat/{id}")
	public ResponseEntity<Projekat> deleteProjekat(@PathVariable("id") Integer id) {

		if (!projekatRepository.existsById(id)) {

			return new ResponseEntity<Projekat>(HttpStatus.NO_CONTENT);
		}

		projekatRepository.deleteById(id);

		if (id == -100) {
			jdbcTemplate.execute("INSERT INTO \"projekat\" (\"id\", \"naziv\", \"oznaka\", \"opis\") "
					+ "VALUES(-100, 'test', 'test','test')");
		}
		return new ResponseEntity<Projekat>(HttpStatus.OK);
	}

}
