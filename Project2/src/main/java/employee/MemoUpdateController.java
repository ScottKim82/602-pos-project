package employee;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class MemoUpdateController {
	
	private static final String command = "/memoupdate.ep";
	
	@Autowired
	EmpDao empdao; 
	
	//Memo.jsp	//메모추가하기
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doActionPost(
			@RequestParam(value="num") String num,
			@RequestParam(value="context") String context) {
		
		System.out.println("MemoUpdateController: post");
		Map<String, String> map = new HashMap<String, String>();
		map.put("num", num);
		map.put("context", context);
		
		empdao.insertMemo(map);		
		
		return "redirect:/memo.ep";
	}
	
	//Memo.jsp	//삭제하기
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGet(
			@RequestParam(value="num") String num) {
		
		System.out.println("MemoUpdateController: get");
		System.out.println("num:"+num);
		empdao.deleteMemo(num);
		
		return "redirect:/memo.ep";
	}

}
