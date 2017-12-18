package employee;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myEmpDao")
public class EmpDao {
	
	private static final String namespace = "empl.employee";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public EmpDao() {}
	
	
	//LoginConctoller 로그인정보가져오기
	public EmpBean EmpList(String id) {
		System.out.println("dao.EmpList");	
		System.out.println("id:"+id);
		EmpBean bean = sqlSessionTemplate.selectOne(namespace+".selectEmp", id);
		return bean;		
	}

	
	
	
	
	
	

}
