package com.bky.controller;

import org.springframework.util.StringUtils;

public class TestController {
	
	public static void main(String[] args) {
		Double d = new Double("12.9");
		System.out.println(d);
		teString();
	}
	
	
	public static void teString(){
		String abcd = "2016-1-24,\"PAY000000192303   \",\"677824749   \",\"310000067575   \",2016-1-24 10:42,\"1	\",\"15,000.00   \",\"01   \",\"   \",,\"Y   \",";
		abcd = StringUtils.replace(abcd, ",\"", "|\"");
		abcd = StringUtils.replace(abcd, "\",", "\"|");
		String[] an = StringUtils.split(abcd, "|\"");
		for(String a : an){
			System.out.println(a);
		}
		

	}
}
