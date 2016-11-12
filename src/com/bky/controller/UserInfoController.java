package com.bky.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bky.model.UserInfo;
import com.bky.service.UserInfoService;
import com.util.HotelContext;

@Controller
@RequestMapping("userInfo")
public class UserInfoController {
	
	@Autowired
	@Qualifier("userInfoService")
	private UserInfoService userInfoService;
	
	/**
	 * 跳转（测试）
	 * */
	@RequestMapping("toIndex")
	public String toIndex(){
		return "redirect:saveUser.do";
	}
	/**
	 * 登录成功跳转至index页面
	 * */
	@RequestMapping("toIndex2")
	public String toIndex2(){
		return "houtai/shouye";
	}
	/**
	 * 登录
	 * */
	@RequestMapping("toLogin")
	public String toLogin(){
		return "login";
	}
	
	/**
	 * 注册
	 * */
	@RequestMapping(value = "saveUser", method = RequestMethod.POST)
	public void saveUser(HttpServletRequest req,PrintWriter out){
		String username = req.getParameter("userName");
		String pass = req.getParameter("pass");
		String email = req.getParameter("email");
		System.out.println("我的密码是："+pass);
		//实例化对象
		UserInfo userInfo = new UserInfo();
		Long romSum = System.currentTimeMillis();
		userInfo.setUserId(romSum.toString());
		userInfo.setUserName(username);
		userInfo.setPassword(pass);
		userInfo.setEmail(email);
		String save = userInfoService.saveUser(userInfo);
		if(save.equals("success")){
			out.write("true");
		}else{
			out.write("false");
		}
		out.flush();
		out.close();
	}
	
	/**
	 * 登录
	 * */
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "login" , method = RequestMethod.POST)
	public void login(HttpServletRequest req,PrintWriter out,Model model){
		String userName = req.getParameter("userName");
		String pass = req.getParameter("pass");
		//返回如果userInfo如果不为null，则说明存在该用户，允许登录并进行验证码判断
		UserInfo userInfo = userInfoService.selAll(userName, pass);
		if(userInfo != null){
			//当登录成功时将用户信息存入session中
			HttpSession session = req.getSession(true);
			//第一步，判断session是否已经存在该用户信息
			if(session.getAttribute(userInfo.getId().toString()) == null){//不存在，则创建
				session.setAttribute(userInfo.getId().toString(), userInfo);
				//验证码开始
		        String validateC = (String) req.getSession().getAttribute("validateCode");         
		        String veryCode = req.getParameter("writeVer").toUpperCase();         
		        if(veryCode!=null||!"".equals(veryCode)){         
		            if(validateC.equals(veryCode)){         
		                out.write("true");         
		            }else{         
		                out.write("false");         
		            }         
		        }         
				//验证码结束
			}else{//已经登录在线了
				out.write("oldLogin");
			}
			//用户唯一标识
			session.setAttribute("userMyId", userInfo.getId());
		}else
			out.write("error");
		out.flush();         
        out.close();  
	}
	
	/**
	 * 验证用户名
	 * @throws UnsupportedEncodingException 
	 * */
	@RequestMapping(value = "checkUserName", method = RequestMethod.POST)
	public void checkUserName(HttpServletRequest req,PrintWriter out) throws UnsupportedEncodingException{
		String userName = req.getParameter("userName"); 
		String result = "";
		if(userName != null && !userName.equals("")){
			result = userInfoService.CheckUser(userName).toString();
		}
		result = new String(result.getBytes("ISO-8859-1"),"utf-8");
		out.print(result);
	}
	
	/**
	 * @author wuxubiao
	 * @deprecated 用户登出
	 * */
	@RequestMapping("loginOut")
	public String loginOut(HttpServletRequest req){
		String myId = req.getParameter("userMyId");
		HttpSession session = req.getSession(false);
		session.removeAttribute(myId);
		System.out.println(session.getAttribute(myId));
		return "login";
	}
	
	/**
	 * 显示用户
	 * */
	@RequestMapping(value = "show", method = RequestMethod.POST)
	public void show(HttpServletRequest req,PrintWriter out){
		String myId = req.getParameter("myId");
		HttpSession session = req.getSession(false);
		UserInfo user=(UserInfo) session.getAttribute(myId);
		if(null != user)
			out.write(user.getUserName());
		else 
			out.write("userIsNull");
	}
}
