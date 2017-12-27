package product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {

	private static final String command ="/product.pd";
	
	@Autowired
	ProductDao productdao;

	//Product.jsp	//상품추가
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doActionPost(				
			@ModelAttribute("product") @Valid ProductBean product,	
			BindingResult result,
			HttpServletResponse response) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		
		PrintWriter writer;
		response.setContentType("text/html;charset=UTF-8");				
		writer =response.getWriter();	
		
		if (result.hasErrors()) {	//유효성검사
			
			writer.println("<script type='text/javascript'>");
			writer.println("alert('상품명과 금액을 정확히 입력해주세요')");
			writer.println("history.back()");
			writer.println("</script>");				
			writer.flush();			
			return mav;
		} 
		int categoryid = 0;		//카테고리id 설정
		if(product.getCategoryname().equals("김밥류")) {	categoryid = 1;}
		else if(product.getCategoryname().equals("면류")) { categoryid = 2;}
		else if(product.getCategoryname().equals("분식류")) { categoryid = 3;}
		else if(product.getCategoryname().equals("덮밥류")) { categoryid = 4;}
		else if(product.getCategoryname().equals("찌개류")) { categoryid = 5;}
		else if(product.getCategoryname().equals("기타")) { categoryid = 6;}
		product.setCategoryid(categoryid);
				
		productdao.InsertProduct(product);	//상품추가
		
		writer.println("<script type='text/javascript'>");	//창닫고 부모창이동
		writer.println("opener.parent.location='productlist.pd'");
		writer.println("self.close()");
		writer.println("</script>");
		writer.flush();	

		mav.setViewName("ProductInput");
		return mav;
	}
	
		

}
