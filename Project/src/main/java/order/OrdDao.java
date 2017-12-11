package order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("MyOrderDao")
public class OrdDao {
	
	
	private static final String namespace ="ord.Order";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public OrdDao() {}
	
	public List<OrdBean> selectList() {
		
		List<OrdBean> list = new ArrayList<OrdBean>() ;
		list = sqlSessionTemplate.selectList(namespace+".selectList");
		return list;		
	}
	
	public List<OrdBean> selectListByoid(int oid) {
		
		List<OrdBean> bean = new ArrayList<OrdBean>() ;
		bean = sqlSessionTemplate.selectList(namespace+".selectByOid", oid);
		
		return bean;	
	}
	
public List<HashMap<String, Object>> ShopDetailView(int oid) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("oid", oid);
		List<HashMap<String, Object>> maplists = null;
		maplists = sqlSessionTemplate.selectList(namespace+".ShopDetailView", map);
	
		return maplists;
	}
	

}
