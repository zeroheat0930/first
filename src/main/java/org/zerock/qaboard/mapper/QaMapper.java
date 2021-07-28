package org.zerock.qaboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.qaboard.domain.Criteria;
import org.zerock.qaboard.domain.QaVO;

public interface QaMapper {
	
	public QaVO read(int seq);
	public QaVO read_secret(int seq);
	
	public int getTotalCount(Criteria cri);
	
	public List<QaVO> getList();
	
	public List<QaVO> getListWithPaging(Criteria cri);
	
	public void insert(QaVO board);
	
	public void insertSelectKey(QaVO board);

	public int delete(int seq);
	
	public int update(QaVO board);
	
	public void updateReplyCnt(
			@Param("qa_seq") int qa_seq, 
			@Param("amount") int amount);
	
	public void updateReplyCnt_admin(
			@Param("qa_seq") int qa_seq, 
			@Param("amount") int amount);

	public void addCnt(int qa_seq);
	
	public int readCnt(int qa_seq);
}