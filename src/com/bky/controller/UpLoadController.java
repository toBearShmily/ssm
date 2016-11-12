package com.bky.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Controller
@RequestMapping("upload")
public class UpLoadController {
	
	@RequestMapping("uploadmedth")
	public void uploadmedth(HttpServletRequest req,HttpServletResponse resp) throws IllegalStateException, IOException{
		List<String> strings=null;
		//创建一个通用的多部分解析器
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(req.getSession().getServletContext());
		//判断request是否有文件上传，即多部分请求
		if(multipartResolver.isMultipart(req)){
			//如果有文件上传，转换成多部分request
			MultipartHttpServletRequest  multiRequest = (MultipartHttpServletRequest ) req;
			//取得request中所有文件名
			Iterator<String> iterator = multiRequest.getFileNames();
			while (iterator.hasNext()) {
				//取得上传文件
				MultipartFile multipartFile = multiRequest.getFile(iterator.next());
				if(null != multipartFile){
					//取得当前上传文件的文件名称
					String fileName = multipartFile.getOriginalFilename();
					//如果名称不为“”,说明该文件存在，否则说明该文件不存在
					if("" != fileName.trim()){
						System.out.println("文件名称为："+fileName);
						//重命名上传后的文件名称
						String newFileName = System.currentTimeMillis()+fileName;
						strings = new ArrayList<String>();
						strings.add(newFileName);
						//定义上传路径 
						String path = req.getSession().getServletContext().getRealPath("/fileUpload");
						File localFile = new File(path);
						multipartFile.transferTo(localFile);
						System.out.println("上传成功");
					}
				}
			}
			req.setAttribute("strings", strings);
			
		}
	}
}
