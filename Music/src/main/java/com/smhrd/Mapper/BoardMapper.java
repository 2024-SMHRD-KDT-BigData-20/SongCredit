package com.smhrd.Mapper;

import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.Board;

// 우리가 알고 있던 dao와 같은 기능 (Java와 SQL연결)
@Repository
// @Mapper : mybatis API에서 제공하는 표시
// @Repository : spring framework에서 제공하는 표시
public interface BoardMapper {
	// ******* xml파일과 이름을 동일하게 지어야한다(그래야 연결)
	// mybatis가 알아서 연결고리 빌려와서 일하고 돌려줌 -> 일하는 메소드 안만듦
	// 접근제한자 + 변환타입 + sql문의 id

	public java.util.List<Board> boardList();

	public void boardInsert(Board vo);
	
	public Board boardContent(int idx);

	public void boardUpdate(Board vo);

	public void boardDelete(int idx);

	public void boardContentUpdate(Board vo);

	// 따로 xml로 sql문을 관리 안하는 경우에 annotation으로 sql문 작성
	// 알아서 메소드에 있는 매개변수를 parameterType으로,
	// 메소드의 return타입을 resultType으로 인식
	@Update("update board set count=count+1 where idx=#{idx}")
	public void updateCount(int idx);
}
