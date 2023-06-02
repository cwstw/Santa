package qna.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component
public class QnaDao {
	
	//Qna namespace
	private String namespace = "qna.QnaBean";
	
	//Sqlsessiontemplate 객체 생성
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public QnaDao() {
		System.out.println("QnaDao() 생성자");
	}//QnaDao 생성자 end
	
	public int getTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		return cnt;
	}//getTotalCount end

	public List<QnaBean> getAllQna(Map<String, String> map, Paging pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<QnaBean> qnaList = sqlSessionTemplate.selectList(namespace+".GetAllQna",map,rowBounds);
		return qnaList;
	}//getAllQna end
	
	
}
