package com.zeus.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.zeus.common.security.CustomAccessDeniedHandler;
import com.zeus.common.security.CustomLoginSuccessHandler;

import jakarta.servlet.DispatcherType;
import lombok.extern.slf4j.Slf4j;

@Configuration
@EnableWebSecurity
@Slf4j
//@EnableWebSecurity: 스프링에서 지원하는 거 안 쓰고 이제 내가 커스텀만들겠다 선언
public class SecurityConfig {

	// 인증과 인가를 필터링할거임
	@Bean
	SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
		log.info("----------------security config" + httpSecurity);

		// 1. csrf 토큰 비활성화
		httpSecurity.csrf(csrf -> csrf.disable());

		// 2. 인가 정책
		httpSecurity.authorizeHttpRequests(auth -> auth.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
				.requestMatchers("/accessError", "/login", "/css/", "/js/", "/error").permitAll()
				.requestMatchers("/board/list").permitAll() // 게시판 목록: 누구나
				.requestMatchers("/board/register").hasRole("MEMBER") // 게시판 등록: 회원만
				.requestMatchers("/notice/list").permitAll() // 공지사항 목록: 누구나
				.requestMatchers("/notice/register").hasRole("ADMIN") // 공지사항 등록: 관리자만
				.anyRequest().authenticated() // 그 외 모든 요청은 인증 필요
		);

		// 3. 접근 거부 시 보여줄 페이지(예외 처리)
//		httpSecurity.exceptionHandling(exception ->exception.accessDeniedPage("/accessError"));
		httpSecurity.exceptionHandling(exception -> exception.accessDeniedHandler(createAccessDeniedHandler()));

		// 4. 기본 로그인 폼은 스프링시큐리티에서 제공하는 것을 쓰겠다
//		httpSecurity.formLogin(Customizer.withDefaults());
		httpSecurity.formLogin(form -> form.loginPage("/login").loginProcessingUrl("/login") // 로그인 폼 action url, 시큐리티가
																								// 낚아챔
//		        .defaultSuccessUrl("/board/list")
				.successHandler(createAuthenticationSuccessHandler()).permitAll() // 로그인 페이지는 누구나 접근 가능해야 함
		);

		// 5. 로그아웃 처리
		// 5. 로그아웃 설정 수정
		httpSecurity.logout(logout -> logout.logoutUrl("/logout") // 로그아웃을 처리할 URL (기본값: /logout)
				.logoutSuccessUrl("/login") // 로그아웃 성공 시 이동할 페이지
				.invalidateHttpSession(true) // HTTP 세션 무효화 (기본값: true)
				.deleteCookies("JSESSIONID", "remember-me") // 로그아웃 시 관련 쿠키 삭제
				.permitAll() // 로그아웃 요청은 누구나 접근 가능해야 함
		);

		return httpSecurity.build();
	}

	@Autowired
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// 지정된 아이디와 패스워드로 로그인이 가능하도록 설정한다.
		auth.inMemoryAuthentication().withUser("member").password("{noop}1234").roles("MEMBER");
		auth.inMemoryAuthentication().withUser("admin").password("{noop}1234").roles("ADMIN", "MEMBER");
	}

	// 3. 접근 거부 시 예외처리를 설정하는 클래스로 이동한다.
	@Bean
	public AccessDeniedHandler createAccessDeniedHandler() {
		return new CustomAccessDeniedHandler();
	}

	@Bean
	public AuthenticationSuccessHandler createAuthenticationSuccessHandler() {
		return new CustomLoginSuccessHandler();
	}

}
