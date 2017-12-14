package payment;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	//정산 controller
	@RequestMapping(command)
	public ModelAndView doActionGet(
			@RequestParam(value="sales") String sales,		
			/*@RequestParam(value="dayday", required=false) String dayday*/
			HttpServletRequest request, 
			HttpServletResponse response) {		
		
		ModelAndView mav = new ModelAndView();
		System.out.println(sales);
		
		java.util.Date date = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);
		System.out.println();
	
		/*if(dayday !=null) {
			System.out.println("dayday !=null");
		}
		
		System.out.println("day:"+dayday);
		String[] dayday = null;
		request.(dayday);
		 
		System.out.println("day:"+dayday);
		*/
		String[] day = request.getParameterValues("dayday");
		String day2 = request.getParameter("dayday");
		System.out.println("day:"+day+"day2:"+day2);
		
		List<PaymentBean> payment = paydao.selectPayList(today);	//오늘날짜 데이터가져오기
		List<PaymentdayBean> payday = paydao.selectPaydayList(today);
		
		int totalprice = 0;
		for(int i=0; i<payday.size(); i++) {
			totalprice += payday.get(i).getTotalprice();
		}
		
		if(sales.equals("dailey")) {		//일일결산			
			
			mav.addObject("payment",payment);
			mav.addObject("totalprice",totalprice);
			mav.addObject("today",today);
			mav.setViewName("SalesDailey");
			
		}else if(sales.equals("month")) {	//월결산
			
			
			mav.setViewName("SalesMonth");
		}else {								//마감정산
			
			mav.setViewName("SalesEnd");
		}
		
		
		return mav;
	}

}
