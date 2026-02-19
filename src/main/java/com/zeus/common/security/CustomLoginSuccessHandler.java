package com.zeus.common.security;

import java.io.IOException;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.java.Log;

@Log
public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	
	private RequestCache requestCache = new HttpSessionRequestCache();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		log.info("onAuthenticationSuccess");
		User customUser = (User) authentication.getPrincipal();
		log.info("username = " + customUser.getUsername());
		log.info("username = " + customUser.getPassword());
		log.info("username = " + customUser.getAuthorities().toString());
		// 인증 과정에서 발생한 예외 정보를 세션에서 제거
		clearAuthenticationAttribute(request);
		// 사용자가 인증되기 전에 접근을 시도했던 요청을 가져온다
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		// 이전에 요청한 정보가 없으면 http://localhost:8080/ 으로 가게한다
		if (savedRequest != null) {
			String targetUrl = savedRequest.getRedirectUrl();
			log.info("CustomLoginSuccessHandler Login Success targetUrl = " + targetUrl);
			response.sendRedirect(targetUrl);
		} else {
			response.sendRedirect("/board/home");
		}

		//원하는 곳에서 정보를 뺏었으니 굳이 부모 생성자 호출 안 해도 됨
		//super.onAuthenticationSuccess(request, response, authentication);
	}

	// 인증 과정에서 발생한 예외 정보를 세션에서 제거합니다.
	private void clearAuthenticationAttribute(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return;
		}
		// 세션에서 인증 예외 속성을 제거한다.
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}

}
