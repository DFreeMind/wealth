package com.weduoo.wealth.publ.mapper;

import java.util.List;
import java.util.Map;

import com.weduoo.wealth.utils.Mapper;

@Mapper
public interface PullDataAndInsertMapper {

	List<Map<String, String>> queryArticleById(Map<String, String> map);

	int insertArticle(Map<String, String> map);

	List<Map<String, String>> queryInsertedArticles(Map<String, String> map);

	int insertComments(List<Map<String, String>> list);

}
