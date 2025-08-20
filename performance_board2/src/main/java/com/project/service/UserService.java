package com.project.service;

import com.project.domain.MemberVO;

public interface UserService {

	public boolean registerUser(String username, String password, String email);
	public MemberVO getUserById(String userid);
}
