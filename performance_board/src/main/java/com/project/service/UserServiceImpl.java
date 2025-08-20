package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.AuthVO;
import com.project.domain.MemberVO;
import com.project.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserServiceImpl implements UserService {

    @Autowired
    private MemberMapper memberMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;
	
    @Transactional
    @Override
    public boolean registerUser(String username, String password, String email) {
        // 1. 중복 아이디 체크
        if (memberMapper.read(username) != null) {
        	log.info("회원가입 실패 - 중복 아이디: " + username);
        	return false;  // 이미 존재하면 실패 반환
        }

        // 2. MemberVO 객체 생성 및 세팅
        MemberVO member = new MemberVO();
        member.setUserid(username);
        member.setUserpw(passwordEncoder.encode(password));  // 비밀번호 암호화
        member.setUserName(username);  // 필요에 따라 이름 등 세팅
        member.setEmail(email);        // email 컬럼 있다면 세팅

        // 3. 회원정보 저장
        int insertCount = memberMapper.insert(member);

        // 4. 권한 저장 (ROLE_USER 기본 권한)
        AuthVO auth = new AuthVO();
        auth.setUserid(member.getUserid());
        auth.setAuth("ROLE_USER");
        memberMapper.insertAuth(auth);

        return insertCount == 1;
    }


	@Override
	public MemberVO getUserById(String userid) {
		return memberMapper.read(userid);
	}

}
