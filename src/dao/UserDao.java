package dao;

import org.springframework.stereotype.Repository;

import entity.User;

/**
 * 用户数据访问对象
 * @author 
 *
 */
@Repository("userDao")
public interface UserDao  {
	
		User selectByUsername(String username);
		
		User selectByUsernameAndPassword(User user);
		
	    int insert(User record);

}

