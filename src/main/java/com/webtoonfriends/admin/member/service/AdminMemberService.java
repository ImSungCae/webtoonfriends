package com.webtoonfriends.admin.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.webtoonfriends.member.vo.MemberVO;

public interface AdminMemberService {
	public ArrayList<MemberVO> listMember(HashMap condMap) throws Exception;
}
