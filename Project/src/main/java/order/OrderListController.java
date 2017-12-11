package order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import product.ProdDao;

@Controller
public class OrderListController {
	
	private static final String command="/list.od";
	private static final String getPage="List";
	
	@Autowired
	OrdDao orddao;
	
	/*@Autowired
	PordDao proddao;*/
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doActionGet() {
		
		//list현재필요없음 확인하기
		ModelAndView mav = new ModelAndView();		
		List<OrdBean> order = orddao.selectList();		
		mav.addObject("order", order);		
		mav.setViewName(getPage);
		
		return mav;
	}
	

}
