package com.si_4th_ds_i_p02.acme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping({"/", "/home"})
public class HomeController {
	@GetMapping("/")
	public String slash() {
		return "redirect:/home";
	}

	@GetMapping("/home")
	public String home() {
		return "index";
	}
}
