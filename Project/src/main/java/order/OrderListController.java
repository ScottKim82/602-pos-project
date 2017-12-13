package order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class OrderListController {
	
	private static final String command="/list.od";
	private static final String getPage="List";
	
	@Autowired
	OrdDao orddao;

	
	//LoginContoller 호출
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(
			@RequestParam(value="oid", required=false) String oid
			) {		
		
		if(oid !=null) {		//결제하기후 넘어올때 oid를 가지고 넘어온다.		
			orddao.deleteOrder(oid);			
		}
		return getPage;	//List.jsp
	}
	
	
	

}
