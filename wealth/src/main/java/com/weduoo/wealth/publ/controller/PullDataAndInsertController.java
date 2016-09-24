package com.weduoo.wealth.publ.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.weduoo.wealth.publ.service.PullDataAndInsertService;
import com.weduoo.wealth.utils.JsonUtils;
import com.weduoo.wealth.utils.ResponseUtils;

/**
 * 从新生大学网站拉取数据并插入到数据表中
 * @author iBook
 *
 */
@Controller
public class PullDataAndInsertController {
	
	@Resource(name="pullDataAndInsertService")
	private PullDataAndInsertService pdaiService;
	
	public void queryArticleById() throws IOException, Exception{
		HttpServletRequest rep=ServletActionContext.getRequest();
		Map<String,String> map=new HashMap<String,String>();
		
		map.put("article_id", rep.getParameter("article_id"));
		
		List<Map<String,String>> list=pdaiService.queryArticleById(map);
		JsonUtils.write(list, ServletActionContext.getResponse().getWriter());
		
	}
	public void queryInsertedArticles() throws IOException, Exception{
		HttpServletRequest rep=ServletActionContext.getRequest();
		Map<String,String> map=new HashMap<String,String>();
		
		map.put("article_name", rep.getParameter("article_name"));
		
		List<Map<String,String>> list=pdaiService.queryInsertedArticles(map);
		JsonUtils.write(list, ServletActionContext.getResponse().getWriter());
		
	}
	public void insertArticle() throws IOException, Exception{
		HttpServletRequest rep=ServletActionContext.getRequest();
		Map<String,String> map=new HashMap<String,String>();
		
		//UTC日期格式装换2016-09-18T16:19:16.000Z
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.000'Z'");
		df.setTimeZone(TimeZone.getTimeZone("UTC"));
		String create_date=rep.getParameter("created_at");
		
		map.put("article_id", rep.getParameter("article_id"));
		map.put("title", rep.getParameter("title"));
		map.put("created_at", df.parse(create_date).toLocaleString());
		map.put("comment_count", rep.getParameter("comment_count"));
		map.put("article_type", rep.getParameter("article_type"));
		
		int flag=pdaiService.insertArticle(map);
		if(flag>0){
			ResponseUtils.write(ServletActionContext.getResponse(),"{\"state\":true}");
		}else{
			ResponseUtils.write(ServletActionContext.getResponse(),"{\"state\":false}");
		}
	}
	public void insertComments() throws IOException, Exception{
		HttpServletRequest rep=ServletActionContext.getRequest();
		//UTC日期格式装换2016-09-18T16:19:16.000Z
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.000'Z'");
		df.setTimeZone(TimeZone.getTimeZone("UTC"));
		
		String[] dataList=rep.getParameter("dataList").split("\\β\\Σ",-1);
		System.err.println(dataList.length);
		List<Map<String,String>> list=new ArrayList<Map<String,String>>();
		for(int i=0,len=dataList.length;i<len;i++){
			String[] data=dataList[i].split("\\$\\*\\$",-1);
			Map<String,String> map=new HashMap<String,String>();
			String id=UUID.randomUUID().toString().replaceAll("-", "");
			//[user_name,article_id,created_at,comment_id,content,index,user_avatar]
			map.put("id", id);
			map.put("user_name", data[0]);
			map.put("article_id", data[1]);
			map.put("created_at", df.parse(data[2]).toLocaleString());
			map.put("comment_id", data[3]);
			map.put("content", data[4]);
			map.put("index", data[5]);
			map.put("user_avatar", data[6]);
			System.err.println(i);
			list.add(map);
		}
		System.err.println(list);
		int flag=pdaiService.insertComments(list);
		if(flag>0){
			ResponseUtils.write(ServletActionContext.getResponse(),"{\"state\":true}");
		}else{
			ResponseUtils.write(ServletActionContext.getResponse(),"{\"state\":false}");
		}
	}
	
}
