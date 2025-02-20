package com.example.kubeapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class KubeappApplication {

	public static void main(String[] args) {
		SpringApplication.run(KubeappApplication.class, args);
	}

	@GetMapping("/greet/{message}")
	public String greet(@PathVariable String message){
		return "Hi "+message;
	}

}
