package once.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import once.comment.dao.CommentDAO;
import once.comment.vo.CommentVO;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private CommentDAO dao;

	@Override
	public void selectById(String id) {
		dao.selectById(id);
	}

	@Override
	public void insert(CommentVO comment) {
		dao.insert(comment);
	}

	@Override
	public List<CommentVO> list(int num) {
		return dao.list(num);
	}

	@Override
	public void addComment(CommentVO comment) {
		dao.addComment(comment);
	}
	
	@Override
	public List<CommentVO> selectByNum(int num) {
		
		return dao.selectByNum(num);
	}
	
	@Override
	public boolean checkComment(CommentVO comment) {
		
		return dao.checkComment(comment);
	}
}
