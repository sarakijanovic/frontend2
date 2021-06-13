package rva.ctrls;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.Api;


@CrossOrigin
@RestController
@Api(tags = {"Početna strana"})
public class ZdravoSvimaController {
	
	@RequestMapping("/")
	public String zdravoSvima() {
		return "Zdravo svima, ovo je početna strana! :)";
	}

}
