package service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import service.UserService;
import util.MD5Util;
import constant.Constant;
import dao.UserDao;
import entity.User;
import exception.DuplicateUsernameException;
import exception.UserNotFoundException;
import exception.UserStatusException;

@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	public void regist(User user) throws DuplicateUsernameException {
		User u=userDao.selectByUsername(user.getUsername());
		if(u!=null){
			throw new DuplicateUsernameException("用户名已存在");
		}
		user.setPassword(MD5Util.md5(user.getPassword()));
		user.setStatus(Constant.USER_STATUS_ENABLE);
		user.setCreateDate(new Date());
		userDao.insert(user);
	}

	@Transactional(readOnly=true)
	public User login(String username, String password)
			throws UserNotFoundException, UserStatusException {
		User u = new User();
		u.setUsername(username);
		u.setPassword(MD5Util.md5(password));
		User user=userDao.selectByUsernameAndPassword(u);
		if(user==null){
			throw new UserNotFoundException("用户名或密码错误");
		}
		if(Constant.USER_STATUS_DISABLE.equals(user.getStatus())){
			throw new UserStatusException("用户已被禁用");
		}
		return user;
	}

	@Transactional(readOnly=true)
	public void validateUsername(String username)
			throws DuplicateUsernameException {
		User user=userDao.selectByUsername(username);
		if(user!=null){
			throw new DuplicateUsernameException("用户名已存在");
		}
	}

}
