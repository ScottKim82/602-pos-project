package product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import employee.EmpBean;



@Controller
public class ProductListController {
	
	private static final String command ="/productlist.pd";
	
	@Autowired
	ProductDao productdao;
	
	@RequestMapping(command)
	public String doActionGet(
			@RequestParam(value="categoryid", required=false) String categoryid,
			Model model,
			HttpSession session) {
		
		
		List<ProductBean> lists = null;
		
		//전체카테고리 상품리스트
		lists = productdao.selectProductList();		
		
		//카테고리선택시 카테고리별 상품불러오기
		if(categoryid != null) {	
			lists = productdao.ProductListBycate(categoryid);
		}	
					
		model.addAttribute("lists",lists);		
		
		return "Product";
	}

}
