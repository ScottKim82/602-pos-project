package product;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import payment.PaymentBean;

@Component("MyProductDao")
public class ProductDao {
	
	private static final String namespace ="pro.product"; 
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//ProductController	//상품리스트 가져오기
	public List<ProductBean> selectProductList(){
		List<ProductBean> lists = new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(namespace+".selectProductList");	
		return lists;
	}
	
	//ProductListController	//카테고리별 상품리스트
	public List<ProductBean> ProductListBycate(String categoryid){
		List<ProductBean> lists = new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(namespace+".ProductListBycate", categoryid);	
		return lists;
	}
	
	//ProducnController	//상품추가
	public Integer InsertProduct(ProductBean product) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".InsertProduct",product);
		return cnt;
	}
	
	//ProductUpdateController	//상품수정
	public Integer UpdateProd(ProductBean product) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".UpdateProd",product);
		return cnt;
	}
	
	//ProductDeleteController	//상품삭제
	public Integer deleteProduct(int num) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace+".DeleteProd",num);
		return cnt;
	}
	
	//ProductUpdateController	//상품별 주문내역 가져오기
	public List<PaymentBean> selectProdsales(String productname) {
		List<PaymentBean> lists = new ArrayList<PaymentBean>();
		lists = sqlSessionTemplate.selectList(namespace+".selectProdsales", productname);
		return lists;
	}



}
