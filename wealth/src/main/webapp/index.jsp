<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<script type="text/javascript" src="js/jquery-1.11.3.js" ></script>
	<script type="text/javascript" src="js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="js/layer/layer.js" ></script>
	<script type="text/javascript" src="js/Tool.js" ></script>
	<script type="text/javascript" src="js/index.js" ></script>
</head>
<body>
	<div class="page-header">
	  <h1>自由之路 </h1>
	  <h4>数据之美,源于对于生活的热爱与观察</h4>
	</div>
	<ul class="nav nav-tabs" role="tablist">
	  <li role="presentation" class="active"><a href="#publish_articles" role="tab" data-toggle="tab">发布文章</a></li>
	  <li role="presentation"><a href="#publish_comments" role="tab" data-toggle="tab">发布评论</a></li>
	  <li role="presentation"><a href="#messages" role="tab" data-toggle="tab">Messages</a></li>
	  <li role="presentation"><a href="#settings" role="tab" data-toggle="tab">Settings</a></li>
	</ul>
	<div class="tab-content">
	  <div role="tabpanel" class="tab-pane active" id="publish_articles">
	  	<div class="oper-content">
			<div class="input-group search">
		      <input type="text" class="form-control" id="page_number" placeholder="请输入要查询的页数,每页30条">
		      <span class="input-group-btn">
		        <button class="btn btn-default" type="button" id="publish_articles_query">查询!</button>
		      </span>
		    </div>
		</div>
		<table class="table table-bordered" id="publish_articles_table">
			<tr>
				<td>序号</td>
				<td>文章名</td>
				<td>发布时间</td>
				<td>评论数</td>
				<td>操作</td>
			</tr>
		</table>
	  </div>
	  <div role="tabpanel" class="tab-pane" id="publish_comments">
	  	<div class="oper-content">
			<div class="input-group search">
		      <input type="text" class="form-control" id="article_name" placeholder="请输入要查询的文章名称">
		      <span class="input-group-btn">
		        <button class="btn btn-default" type="button" id="publish_comments_query">查询!</button>
		      </span>
		    </div>
		</div>
		<table class="table table-bordered" id="publish_comments_table">
			<tr>
				<td>序号</td>
				<td>文章名</td>
				<td>发布时间</td>
				<td>评论数</td>
				<td>操作</td>
			</tr>
		</table>
	  </div>
	  <div role="tabpanel" class="tab-pane" id="messages">...</div>
	  <div role="tabpanel" class="tab-pane" id="settings">...</div>
	</div>
</body>
</html>
