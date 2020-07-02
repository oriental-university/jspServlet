package com.Dhavisoft.Junit;
import static org.junit.Assert.assertEquals;

import org.junit.Ignore;
import org.junit.Test;
import com.Dhavisoft.DAO.LoginDao;
import com.Dhavisoft.DAO.UserDao;
import com.Dhavisoft.Model.LoginBean;
import com.Dhavisoft.Model.User;

public class JUnitTesting {
	@Test
 public void TestLogin() throws ClassNotFoundException
 {
	
LoginBean lb = new LoginBean();
		lb.setUsername("Inderlal");
		lb.setPassword("inder123");
		assertEquals(true,LoginDao.validate(lb));
 }

	
	@Ignore
 public void TestRegister() throws ClassNotFoundException
 {
	
User ub = new User();
	ub.setFirstName("Inder");
	ub.setLastName("Patel");
		ub.setUsername("inderlal");
		ub.setPassword("inder123");
		assertEquals(1,UserDao.registerEmployee(ub));
 }

}
