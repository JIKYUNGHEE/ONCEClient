package once.boardQA.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardQADAOImpl implements BoardQADAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}