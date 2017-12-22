package employee;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginContoller {
	
	private static final String command= "/login.ep";
	private static final String getPage = "redirect:/list.od";
	
	@Autowired
	@Qualifier("myEmpDao")
	EmpDao empdao;
	
	//Login.jsp에서 호출
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doActionGet(HttpSession session,
			HttpServletResponse response,
			@RequestParam(value="id") String id,
			@RequestParam(value="password") String password
			) throws IOException {
			
		System.out.println("LoginConctoller");
		System.out.println("id:"+id+"password:"+password);		
		
		ModelAndView mav = new ModelAndView();
		
		
		PrintWriter writer;
		response.setContentType("text/html;charset=UTF-8");
				
		writer =response.getWriter();
		
		
		EmpBean login = empdao.EmpList(id);	//리스트가져오기		
		
		
		if(login==null) {	//아이디가 없을경우
			
			System.out.println("null");
							
				writer.println("<script type='text/javascript'>");
				writer.println("alert('없는 아이디입니다')");
				writer.println("history.back()");
				writer.println("</script>");				
				writer.flush();
			
				return new ModelAndView(getPage);
		}else {							//비밀번호가 없을경우
			System.out.println("test");	
			System.out.println(login.getPassword());
			if(!password.equals(login.getPassword())){
				
				System.out.println("password.equals(bean.getPassword()");
				writer.println("<script type='text/javascript'>");
				writer.println("alert('비밀번호가 틀렸습니다')");
				writer.println("history.back()");
				writer.println("</script>");				
				writer.flush();
				
				return new ModelAndView(getPage);
				
			}else {	
				session.setAttribute("login", login);	//로그인세션
				mav.setViewName(getPage);
		}
					
		}	
		
		return mav;	//OrderListController
	}

}
