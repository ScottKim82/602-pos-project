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
	
	//���� controller	//List.jsp	//SaileDailey.jsp, End, Month
	@RequestMapping(value=command)
	public ModelAndView doActionGet(
			@RequestParam(value="sales") String sales,
			@RequestParam(value="dayday", required=false) String dayday,
			@RequestParam(value="totalprice2", required=false) String editPrice){		
		
		ModelAndView mav = new ModelAndView();
		
		
		
		java.util.Date date = new java.util.Date();	//���ó�¥ ��������
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yy/MM");
		String today = sdf.format(date);
		String month = "%"+sdf2.format(date)+"%";
				
	
		if(dayday != null) {		//SaileDailey.jsp���� ��¥������ dayday	
		String day = dayday.substring(2, 10);
		System.out.println("day:"+day);
		today = dayday;
		}
		
		
		List<PaymentBean> payment = paydao.selectPayList(today);	//��¥�� payment
		
		List<PaymentdayBean> payday = paydao.selectPaydayList(month);	//���� paymentday
		List<PaymentdayBean> payday2 = paydao.selectPaydayList2(today);	//��¥�� paymentday
		
		int totalprice = 0;
		for(int i=0; i<payday2.size(); i++) {			//����ġ �ѱݾ�
			totalprice += payday2.get(i).getTotalprice();			
		}
		
		if(editPrice!=null) {	//��������//SalesEnd.jsp���� ���ݱݾ� ������
			paydao.EditPaymentday(editPrice);	
			mav.setViewName("redirect:/list.od");
		}
		
		if(sales.equals("dailey")) {		//���ϰ��			
			mav.setViewName("SalesDailey");			
		}else if(sales.equals("month")) {	//�����	
			System.out.println("month");
			String str ="[";
			str +="['��¥' , '����'] ,";
			int num =0;
				
			
			//for(PaymentdayBean pb : payday){
			for(int i=0; i<payday.size()-1; i++) {//�ſ�ī��,���ݱݾ� ���ļ� �迭�θ���� �׷��������				
				payday.get(i).getPaydate();
				
				str +="['";
				System.out.println("null"+payday.get(i+1).getPaydate());
				
				if(payday.get(i).getPaydate().equals(payday.get(i+1).getPaydate())) {
					System.out.println("�׽�Ʈ");
					
					str += payday.get(i).getPaydate().substring(0, 10);
					str +="' , ";
					str += payday.get(i).getTotalprice()+payday.get(i+1).getTotalprice();
					i++;
				}else {
					System.out.println("�׽�Ʈ1");
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
		}else {								//��������			
			mav.setViewName("SalesEnd");
		}
		
		
		mav.addObject("payment",payment);	//payment����Ʈ
		mav.addObject("payday",payday);		//paymentday ����Ʈ
		mav.addObject("payday2",payday2);		//paymentday ����Ʈ
		mav.addObject("totalprice",totalprice);	//�ѱݾ�
		mav.addObject("today",today);			//���ó�¥
		mav.addObject("sales",sales);			//�������		
		
		
		return mav;
	}

}
