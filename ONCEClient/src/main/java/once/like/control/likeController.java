package once.like.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import once.like.service.likeService;

@Controller
public class likeController {

	@Autowired
	private likeService service;
}
