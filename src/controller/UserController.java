package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.UserService;
import vo.AjaxResult;
import entity.User;
import exception.DuplicateUsernameException;
import exception.UserNotFoundException;
import exception.UserStatusException;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@ExceptionHandler(DuplicateUsernameException.class)
	public ModelAndView registExceptionHandler(Exception e){
		return new ModelAndView("regist","e",e);
	}
	
	@ExceptionHandler(value={UserNotFoundException.class,UserStatusException.class})
	public ModelAndView loginExceptionHandler(Exception e){
		return new ModelAndView("login","e",e);
	}
	
	
	@RequestMapping("/regist")
	public String regist(User user) throws Exception{
		userService.regist(user);
		return "redirect:/user/showLogin";
	}
	
	@RequestMapping("/login")
	public String login(String username,String password,HttpSession session) throws Exception {
		User user=userService.login(username, password);
		session.setAttribute("user", user);
		return "redirect:/user/showSuccess";
	}
	
	@RequestMapping("/validateUsername")
	public @ResponseBody AjaxResult validateUsername(String username){
		AjaxResult ajaxResult=new AjaxResult();
		try {
			userService.validateUsername(username);
			ajaxResult.setStatus("success");
			ajaxResult.setData("用户名可用");
		} catch (DuplicateUsernameException e) {
			ajaxResult.setStatus("duplicateUsername");
			ajaxResult.setData(e.getMessage());
		}
		return ajaxResult;
	}
	
	
	
}
