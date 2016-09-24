package com.weduoo.wealth.publ.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weduoo.wealth.publ.mapper.PullDataAndInsertMapper;

@Service
@Transactional
public class PullDataAndInsertService {
	
	@Resource(name="pullDataAndInsertMapper")
	private PullDataAndInsertMapper pdaiMapper;

	public List<Map<String, String>> queryArticleById(Map<String, String> map) {
		return pdaiMapper.queryArticleById(map);
	}

	public int insertArticle(Map<String, String> map) {
		return pdaiMapper.insertArticle(map);
	}

	public List<Map<String, String>> queryInsertedArticles(Map<String, String> map) {
		return pdaiMapper.queryInsertedArticles(map);
	}

	public int insertComments(List<Map<String, String>> list) {
		return pdaiMapper.insertComments(list);
	}
}
