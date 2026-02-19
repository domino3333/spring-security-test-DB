package com.zeus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/notice")
public class NoticeController {

	@GetMapping("/list")
	public void list() {
		log.info("notice list : 모두가 접근 가능");
	}

	@GetMapping("/register")
	public void registerForm() {
		log.info("notice registerForm : 로그인한 관리자만 접근 가능");
	}

}
