package com.zeus.common.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.jspecify.annotations.Nullable;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.zeus.domain.Member;

public class CustomUser extends User {

	private Member member;

	private static final long serialVersionUID = 1L;

	public CustomUser(String username, @Nullable String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public CustomUser(Member member) {
		super(member.getUserId(), member.getUserPw(), member.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
				.collect(Collectors.toList()));
		this.member = member;
	}

	public Member getMember() {
		return member;
	}

	

}
