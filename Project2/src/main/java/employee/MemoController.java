package employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemoController {
	
	private static final String command = "/memo.ep";
	
	@Autowired
	EmpDao empdao; 
	
	//메모 클릭시
	@RequestMapping(value=command, method= RequestMethod.GET)
	public String doActionGet(Model model) {
		
		List<MemoBean> lists1 = empdao.selectMemo1();	//종류별 메모리스트
		List<MemoBean> lists2 = empdao.selectMemo2();
		List<MemoBean> lists3 = empdao.selectMemo3();
		List<MemoBean> lists4 = empdao.selectMemo4();
		
		model.addAttribute("lists1", lists1);
		model.addAttribute("lists2", lists2);
		model.addAttribute("lists3", lists3);
		model.addAttribute("lists4", lists4);
		
		return "Memo";
	}

}
