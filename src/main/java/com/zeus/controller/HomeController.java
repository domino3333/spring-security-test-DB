package com.zeus.controller;

import java.util.Locale;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@MapperScan(basePackages = "com.zeus.mapper")

public class HomeController {

	@GetMapping("/")
	public String home(Locale locale, Model model) {
		
		log.info(locale + "의 방문을 환영합니다.");
		model.addAttribute("serverTime", "2026-02-19");
		return "home";
	}
}
