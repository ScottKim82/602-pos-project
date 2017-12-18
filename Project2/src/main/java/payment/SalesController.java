package payment;

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
			@RequestParam(value="totalprice2", required=false) String editPrice){		
		
		ModelAndView mav = new ModelAndView();
		
		
		
		java.util.Date date = new java.util.Date();	//오늘날짜 가져오기
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yy/MM");
		String today = sdf.format(date);
		String month = "%"+sdf2.format(date)+"%";
				
	
		if(dayday != null) {		//SaileDailey.jsp에서 날짜수정시 dayday	
		String day = dayday.substring(2, 10);
		System.out.println("day:"+day);
		today = dayday;
		}
		
		
		List<PaymentBean> payment = paydao.selectPayList(today);	//날짜별 payment
		
		List<PaymentdayBean> payday = paydao.selectPaydayList(month);	//월별 paymentday
		List<PaymentdayBean> payday2 = paydao.selectPaydayList2(today);	//날짜별 paymentday
		
		int totalprice = 0;
		for(int i=0; i<payday2.size(); i++) {			//오늘치 총금액
			totalprice += payday2.get(i).getTotalprice();			
		}
		
		if(editPrice!=null) {	//마감정산//SalesEnd.jsp에서 현금금액 수정시
			paydao.EditPaymentday(editPrice);	
			mav.setViewName("redirect:/list.od");
		}
		
		if(sales.equals("dailey")) {		//일일결산			
			mav.setViewName("SalesDailey");			
		}else if(sales.equals("month")) {	//월결산	
			System.out.println("month");
			String str ="[";
			str +="['날짜' , '가격'] ,";
			int num =0;
				
			
			//for(PaymentdayBean pb : payday){
			for(int i=0; i<payday.size()-1; i++) {//신용카드,현금금액 합쳐서 배열로만들어 그래프만들기				
				payday.get(i).getPaydate();
				
				str +="['";
				System.out.println("null"+payday.get(i+1).getPaydate());
				
				if(payday.get(i).getPaydate().equals(payday.get(i+1).getPaydate())) {
					System.out.println("테스트");
					
					str += payday.get(i).getPaydate().substring(0, 10);
					str +="' , ";
					str += payday.get(i).getTotalprice()+payday.get(i+1).getTotalprice();
					i++;
				}else {
					System.out.println("테스트1");
					str += payday.get(i).getPaydate().substring(0, 10);
					str +="' , ";
					str += payday.get(i).getTotalprice();
				}
				str +=" ]";
				
				/*System.out.println("pb.getPaydate():"+pb.getPaydate());
				
				str +="['";
				str  += pb.getPaydate().substring(0, 10);
				str +="' , ";
				str += pb.getTotalprice();
				str +=" ]";
				*/
				num ++;
				if(num<payday.size()){
					str +=",";
				}		
			}
			str += "]";
			
			System.out.println("str:"+str);
			mav.addObject("str", str);			
			mav.setViewName("SalesMonth");
		}else {								//마감정산			
			mav.setViewName("SalesEnd");
		}
		
		
		mav.addObject("payment",payment);	//payment리스트
		mav.addObject("payday",payday);		//paymentday 리스트
		mav.addObject("payday2",payday2);		//paymentday 리스트
		mav.addObject("totalprice",totalprice);	//총금액
		mav.addObject("today",today);			//오늘날짜
		mav.addObject("sales",sales);			//결산종류		
		
		
		return mav;
	}

}
