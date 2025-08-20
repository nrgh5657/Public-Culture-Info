package com.project.mapper;

import com.project.domain.AuthVO;
import com.project.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String username);

	public int insert(MemberVO member);

	public void insertAuth(AuthVO auth);

}
