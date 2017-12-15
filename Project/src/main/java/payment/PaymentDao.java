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

	//PaymentController	//��ǰ�� ������ �������� update
	public Integer updatePayment(PaymentBean payment) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".updatePayment", payment);		
		return cnt;
	}
	
	//PaymentController	//��ǰ�� ������ �������� insert
	public Integer insertPayment(PaymentBean payment) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".insertPayment", payment);		
		return cnt;
	}
	
	//PaymentController //���ó�¥ ������ �ݾ� update
	public Integer Updatepaymentday(PaymentdayBean payday) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".Updatepaymentday", payday);		
		return cnt;		
	}
	
	//PaymentController //���ó�¥ ������ �ݾ� insert
	public Integer insertPaymentDay(PaymentdayBean payday) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".insertPaymentDay", payday);		
		return cnt;
	}
	
	//SlesControllder	//payment ����Ʈ ��������
	public List<PaymentBean> selectPayList(String today){
		List<PaymentBean> lists = new ArrayList<PaymentBean>();
		lists = sqlSessionTemplate.selectList(namespace+".selectPayList", today);
		return lists;
	}
	
	//SlesControllder	//paymentday ����Ʈ ��������
	public List<PaymentdayBean> selectPaydayList(String month){
		List<PaymentdayBean> lists = new ArrayList<PaymentdayBean>();
		lists = sqlSessionTemplate.selectList(namespace+".selectPaydayList", month);
		return lists;
	}
}
