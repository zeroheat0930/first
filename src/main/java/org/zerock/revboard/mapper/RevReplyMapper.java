package org.zerock.revboard.mapper;

import java.util.List;

import org.zerock.revboard.domain.ReplyVO;

public interface RevReplyMapper {
	
	public int insert(ReplyVO vo);
	
	public ReplyVO read(int reply_seq);
	
	public int update(ReplyVO vo);
	
	public int remove(int reply_seq);
	
	public List<ReplyVO> getListWithPaging(
//			@Param("cri") Criteria cri,
			 int reply_boardseq
			);
}