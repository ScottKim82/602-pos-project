package payment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myPaymentDao")
public class PaymentDao {

	private static final String namespace ="pay.payMent";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<PaymentBean> selectOrder(String oid) {
		
		List<PaymentBean> lists = new ArrayList<PaymentBean>();
		lists = sqlSessionTemplate.selectList(namespace+".selectOrder", oid);
	
		return lists;
	}

	//PaymentController	//상품이 있을시 결제정보 update
	public Integer updatePayment(PaymentBean payment) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".updatePayment", payment);		
		return cnt;
	}
	
	//PaymentController	//상품이 없을시 결제정보 insert
	public Integer insertPayment(PaymentBean payment) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".insertPayment", payment);		
		return cnt;
	}
	
	//PaymentController //오늘날짜 있을시 금액 update
	public Integer Updatepaymentday(PaymentdayBean payday) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".Updatepaymentday", payday);		
		return cnt;		
	}
	
	//PaymentController //오늘날짜 있을시 금액 insert
	public Integer insertPaymentDay(PaymentdayBean payday) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".insertPaymentDay", payday);		
		return cnt;
	}
	
	//SlesControllder	//payment 리스트 가져오기
	public List<PaymentBean> selectPayList(String today){
		List<PaymentBean> lists = new ArrayList<PaymentBean>();
		lists = sqlSessionTemplate.selectList(namespace+".selectPayList", today);
		return lists;
	}
	
	//SlesControllder	//paymentday 리스트 가져오기
	public List<PaymentdayBean> selectPaydayList(String month){
		List<PaymentdayBean> lists = new ArrayList<PaymentdayBean>();
		lists = sqlSessionTemplate.selectList(namespace+".selectPaydayList", month);
		return lists;
	}
}
