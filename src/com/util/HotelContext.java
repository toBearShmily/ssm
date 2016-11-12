package com.util;

import java.io.Serializable;
import javax.servlet.http.HttpServletRequest;
import com.bky.model.UserInfo;

public class HotelContext implements Serializable {
	/*private Integer userId;//用户id
	private String userName;//用户名称
	private Date loginDate;//登录时间
	private String randomCode;//验证码*/
	
	private static final String SESSION_USER_CONTEXT = "hotelContext";
	/**
	 * @author wuxubiao
	 * @deprecated 判断当前用户是否为已登录用户,登录则从已有session中取，否则将登录用户存入session
	 * */
	public void saveSession(UserInfo userInfo,HttpServletRequest req){
		UserInfo userInfo2 = (UserInfo) req.getSession().getAttribute(SESSION_USER_CONTEXT);
		if(null==userInfo2){
			req.getSession().setAttribute(SESSION_USER_CONTEXT, userInfo);
			req.getSession().setMaxInactiveInterval(14400);//session时长
		}
	}
	
	
}
