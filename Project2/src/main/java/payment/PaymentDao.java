package payment;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
	
	//SlesControllder	//payment 리스트 가져오기	//날짜별
	public List<PaymentBean> selectPayList(String today){
		List<PaymentBean> lists = new ArrayList<PaymentBean>();
		lists = sqlSessionTemplate.selectList(namespace+".selectPayList", today);
		return lists;
	}
	
	//SlesControllder	//paymentday 리스트 가져오기	//월별
	public List<PaymentdayBean> selectPaydayList(String month){
		List<PaymentdayBean> lists = new ArrayList<PaymentdayBean>();
		lists = sqlSessionTemplate.selectList(namespace+".selectPaydayList", month);
		return lists;
	}
	
	//SlesControllder	//paymentday 리스트 가져오기	//날짜별
	public List<PaymentdayBean> selectPaydayList2(String today){
		List<PaymentdayBean> lists = new ArrayList<PaymentdayBean>();
		lists = sqlSessionTemplate.selectList(namespace+".selectPaydayList2", today);
		return lists;
	}
	
	//SalesController	//토탈금액 수정하기
	public Integer EditPaymentday(String editPrice) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".editPrice", editPrice);
		return cnt;
	}
	
	//SalesController //날짜구하기
	public static String getFormatDate(String format, String term_gubun,int term) {
		String ret_date = "";
		Calendar cur_date = Calendar.getInstance(); // 현재 날짜
		SimpleDateFormat formatter; // 날짜 포맷

		term_gubun = term_gubun.toUpperCase();
		if ("".equals(term_gubun))
			term_gubun = "NOW";
		try {
			if (term_gubun.equals("Y") || term_gubun.equals("M")
					|| term_gubun.equals("D") || term_gubun.equals("NOW")) {
				formatter = new SimpleDateFormat(format);

				if (term_gubun.equals("Y")) {
					cur_date.add(Calendar.YEAR, term);
				} else if (term_gubun.equals("M")) {
					cur_date.add(Calendar.MONTH, term);
				} else if (term_gubun.equals("D")) {
					cur_date.add(Calendar.DAY_OF_MONTH, term);
				}
				ret_date = formatter.format(cur_date.getTime());
			}
			return ret_date.trim();
		} catch (Exception e) {
			System.out.println("[MessageUtil::getDateFormt] Error = " + e);
		}
		return "";
	}

}
	

