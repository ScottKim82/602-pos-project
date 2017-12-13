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
	

	//OrderDetailControllder	//��ǰ+�ֹ����� join����Ʈ�������� //PayMentController //����Ʈ ��������
	public List<HashMap<String, Object>> ShopDetailView(String oid) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("oid", oid);
		List<HashMap<String, Object>> maplists = null;
		maplists = sqlSessionTemplate.selectList(namespace+".ShopDetailView", map);
	
		return maplists;
	}
	
	//OrderDetailController	//��ǰ����Ʈ��������
	public List<ProdBean> selectProdList(String categoryid) {
		//System.out.println("dao.selectList: ");
		//System.out.println(categoryid);
		
		List<ProdBean> list = new ArrayList<ProdBean>() ;
		
		list = sqlSessionTemplate.selectList(namespace+".selectProdList", categoryid);
		//System.out.println("prod list.size()"+list.size());
		return list;		
}
	
	//ProdController	//��ǰ ������ +1 	//OrderCancleController +�߰�
	public Integer UpdateProd(Map<String, String> map) {
		int cnt = -1;				
		cnt = sqlSessionTemplate.update(namespace+".UpdateProd", map);
		return cnt;
	}
	
	//ProdController	//��ǰ������ insert +1
	public Integer InsertProd(Map<String, String> map) {
		int cnt = -1;				
		cnt = sqlSessionTemplate.insert(namespace+".InsertProd", map);		
		return cnt;
	}

	//OrderCancleController	//��ü���
	public Integer deleteOrder(String oid) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace+".deleteOrder", oid);
		return cnt;
	}
	
	//OrderCancleController -����
	public Integer UpdateQtyMinus(Map<String, String> map) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".UpdateQtyMinus", map);
		return cnt;
	}
	
	//OrderCancleController	//��ǰ������������
	public OrdBean selectOrderOne(Map<String, String> map) {
		OrdBean list = new OrdBean();
		list = sqlSessionTemplate.selectOne(namespace+".selectByOid",map);
		return list;
	}
	
	//OrderCancleController	//����1���������� ��ǰ�����ϱ�
	public Integer deleteByProd(Map<String, String> map){
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".deleteByProd", map);
		return cnt;
	}	
	

	
}
