package com.smhrd.Mapper;

import com.smhrd.entity.Member;

public interface MemberMapper {

	public Member memberLogin(Member mvo);

	public int memberJoin(Member mvo);

	public Member memberFindId(Member mvo);

	public Member memberFindPw(Member mvo);

}
