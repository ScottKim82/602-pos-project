package payment;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SalesController {
	
	
	private static final String command = "/dailey.pm";
	
	@Autowired
	PaymentDao paydao;
	
	//���� controller
	@RequestMapping(command)
	public ModelAndView doActionGet(
			@RequestParam(value="sales") String sales,
			@RequestParam(value="dayday", required=false) String dayday) {		
		
		System.out.println("SalesController");
		ModelAndView mav = new ModelAndView();
		System.out.println(sales);
		
		java.util.Date date = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yy/MM");
		String today = sdf.format(date);
		String month = "%"+sdf2.format(date)+"%";
		System.out.println("month:"+month);
		

		
		if(dayday != null) {
	
		String day = dayday.substring(2, 10);
		System.out.println("day:"+day);
		today = dayday;
		}
		
		List<PaymentBean> payment = paydao.selectPayList(today);	//���ó�¥ �����Ͱ�������
		List<PaymentdayBean> payday = paydao.selectPaydayList(month);
		
		int totalprice = 0;
		for(int i=0; i<payday.size(); i++) {
			totalprice += payday.get(i).getTotalprice();
		}
		
		mav.addObject("payment",payment);	//payment����Ʈ
		mav.addObject("payday",payday);		//paymentday ����Ʈ
		mav.addObject("totalprice",totalprice);	//�ѱݾ�
		mav.addObject("today",today);			//���ó�¥
		mav.addObject("sales",sales);			//�������
		
		if(sales.equals("dailey")) {		//���ϰ��			
			
			mav.setViewName("SalesDailey");
			
		}else if(sales.equals("month")) {	//�����

			
			mav.setViewName("SalesMonth");
		}else {								//��������
			
			mav.setViewName("SalesEnd");
		}
		
		
		return mav;
	}

}
