package com.bky.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.util.MucisPro;


@Controller
public class PlayController {
	@RequestMapping("playMusic")
	public String playMusic(HttpServletRequest request){
		String path=request.getRealPath("/");
		String playPathString = path+"/music/fushishanxia.mp3";
		MucisPro mp = new MucisPro(playPathString);
        mp.play();
        return "music";
	}
}
