package payment;

import java.util.Calendar;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SalesController {
	
	
	private static final String command = "/dailey.pm";
	
	@Autowired
	PaymentDao paydao;
	
	//정산 controller	//List.jsp	//SaileDailey.jsp, End, Month
	@RequestMapping(value=command)
	public ModelAndView doActionGet(
			@RequestParam(value="sales") String sales,
			@RequestParam(value="dayday", required=false) String dayday,
			@RequestParam(value="mon", required=false) String mon,
			@RequestParam(value="totalprice2", required=false) String editPrice){		
		
		ModelAndView mav = new ModelAndView();
		
		String today = paydao.getFormatDate("yyyy-MM-dd","NOW", 0);	//오늘날짜
		String month = "%"+paydao.getFormatDate("yy/MM","NOW", 0)+"%";	//이번달
		String month2 = paydao.getFormatDate("yyyy년 MM월","NOW", 0);	//이번달//출력용
		
	
		if(mon != null) {	//이전달 클릭시	
			
			if(mon.equals("minus1")) {	//1개월전
				month = "%"+paydao.getFormatDate("yy/MM","M",-1)+"%";
				month2 = paydao.getFormatDate("yyyy년 MM월","M",-1);
			}else if(mon.equals("minus2")) {//2개월전
				month = "%"+paydao.getFormatDate("yy/MM","M",-2)+"%";
				month2 = paydao.getFormatDate("yyyy년 MM월","M",-2);
			}else {//3개월전
				month = "%"+paydao.getFormatDate("yy/MM","M",-3)+"%";
				month2 = paydao.getFormatDate("yyyy년 MM월","M",-3);
			}
		}
	
				
		if(dayday != null) {		//SaileDailey.jsp에서 날짜수정시 dayday	
			//String day = dayday.substring(2, 10);
			today = dayday;
		}
		
		
		List<PaymentBean> payment = paydao.selectPayList(today);	//날짜별 주문내역 payment
		List<PaymentdayBean> payday = paydao.selectPaydayList(month);	//월별 결제내역 paymentday
		List<PaymentdayBean> payday2 = paydao.selectPaydayList2(today);	//날짜별 결제내역 paymentday
		
		System.out.println("payday.size: "+ payday.size());
		
		int totalprice = 0;
		for(int i=0; i<payday2.size(); i++) {			//오늘치 총금액
			totalprice += payday2.get(i).getTotalprice();			
		}		

		
		if(sales.equals("dailey")) {		//일일결산			
			mav.setViewName("SalesDailey");
			mav.addObject("today",today);			//오늘날짜
			mav.addObject("payment",payment);	//payment리스트
			mav.addObject("totalprice",totalprice);	//총금액
			
		}else if(sales.equals("month")) {	//월결산	
			String str ="[";
			str +="['날짜' , '판매금액'] ,";
			int num =0;			
			
			for(int i=0; i<payday.size()-1; i++) {//신용카드,현금금액 합쳐서 배열로만들어 그래프만들기				
				payday.get(i).getPaydate();
				
				str +="['";
				
				if(payday.get(i).getPaydate().equals(payday.get(i+1).getPaydate())) {
										
					str += payday.get(i).getPaydate().substring(0, 10);
					str +="' , ";
					str += payday.get(i).getTotalprice()+payday.get(i+1).getTotalprice();
					i++;
				}else {
					str += payday.get(i).getPaydate().substring(0, 10);
					str +="' , ";
					str += payday.get(i).getTotalprice();
				}
				str +=" ]";
				
				num ++;
				if(num<payday.size()){
					str +=",";
				}		
			}
			str += "]";
			
			mav.addObject("size",payday.size());			//월별정산의 사이즈
			mav.addObject("str", str);	
			mav.addObject("sales",sales);
			mav.addObject("month2",month2);				//2017년 12월
			mav.setViewName("SalesMonth");
		}else {								//마감정산			
			mav.setViewName("SalesEnd");
			mav.addObject("sales",sales);
			mav.addObject("today",today);			//오늘날짜
			mav.addObject("payday2",payday2);		//paymentday 리스트
		}
		
		mav.addObject("sales",sales);		//결산종류
			
		
		if(editPrice!=null) {	//마감정산//SalesEnd.jsp에서 현금금액 수정시
			paydao.EditPaymentday(editPrice);	
			mav.setViewName("redirect:/list.od");
		}
		
		return mav;	//List로 간다
	}

}
