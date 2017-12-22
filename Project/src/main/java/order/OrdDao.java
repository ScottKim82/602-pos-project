package order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import product.ProductBean;

@Component("MyOrderDao")
public class OrdDao {
	
	
	private static final String namespace ="ord.Order";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public OrdDao() {}
	

	//OrderDetailControllder	//상품+주문관련 join리스트가져오기 //PayMentController //리스트 가져오기
	public List<HashMap<String, Object>> ShopDetailView(String oid) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("oid", oid);
		List<HashMap<String, Object>> maplists = null;
		maplists = sqlSessionTemplate.selectList(namespace+".ShopDetailView", map);
	
		return maplists;
	}
	
	//OrderDetailController	//상품리스트가져오기
	public List<ProductBean> selectProdList(String categoryid) {
		List<ProductBean> list = new ArrayList<ProductBean>() ;		
		list = sqlSessionTemplate.selectList(namespace+".selectProdList", categoryid);
		return list;		
}
	
	//ProdController	//상품 있을시 +1 	//OrderCancleController +추가
	public Integer UpdateProd(Map<String, String> map) {
		int cnt = -1;				
		cnt = sqlSessionTemplate.update(namespace+".UpdateProd", map);
		return cnt;
	}
	
	//ProdController	//상품없을시 insert +1
	public Integer InsertProd(Map<String, String> map) {
		int cnt = -1;				
		cnt = sqlSessionTemplate.insert(namespace+".InsertProd", map);		
		return cnt;
	}

	//OrderCancleController	//전체취소
	public Integer deleteOrder(String oid) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace+".deleteOrder", oid);
		return cnt;
	}
	
	//OrderCancleController -빼기
	public Integer UpdateQtyMinus(Map<String, String> map) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".UpdateQtyMinus", map);
		return cnt;
	}
	
	//OrderCancleController	//상품정보가져오기
	public OrdBean selectOrderOne(Map<String, String> map) {
		OrdBean list = new OrdBean();
		list = sqlSessionTemplate.selectOne(namespace+".selectByOid",map);
		return list;
	}
	
	//OrderCancleController	//수량1개남았을시 상품삭제하기
	public Integer deleteByProd(Map<String, String> map){
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".deleteByProd", map);
		return cnt;
	}	
	
	//OrderMoveController	//자리이동
	public Integer OrderMove(Map<String, Integer> map) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".orderMove", map);
		return cnt;
	}

	
}
