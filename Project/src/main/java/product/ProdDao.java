package product;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("myProdDao")
public class ProdDao {
	
	
	private static final String namespace ="prod.Product";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<ProdBean> selectList() {
		
		List<ProdBean> list = new ArrayList<ProdBean>() ;
		list = sqlSessionTemplate.selectList(namespace+".selectList");
		return list;		
	}
	

}
