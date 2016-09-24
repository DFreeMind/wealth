/**
 * 
 */
$(function(){
	$("#publish_articles_query").bind("click",function(){
		var page=$("#page_number").val();
		PULL.pullArticlesData(page);
	});
	$("#publish_comments_query").bind("click",function(){
		var article_name=$("#article_name").val();
		PULL.queryInsertedArticles(article_name);
	});
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		  e.target // newly activated tab
		  e.relatedTarget // previous active tab
		  console.log(e.target);
		  console.log(e.relatedTarget);
	});
});

var PULL={
		articlesData:null,
		insertedArticlesData:null,
		/**
		 * 从财富网站拉取数据
		 * @param page
		 */
		pullArticlesData:function(page){
			var url="https://caifu.xinshengdaxue.com/v1/treasure/articles?page="+page+"&limit=30";
			$.get(url,null,function(callbackdata){
				PULL.articlesData=callbackdata.result.data;
				//data数据格式{code: ,result:{data:[],pagination:{}}}
				PULL.createArticleList(callbackdata.result.data);
			},"json");
		},
		/**
		 * 查询已经插入的文章
		 * @param article_name
		 */
		queryInsertedArticles:function(article_name){
			var param={
					article_name:article_name
			}
			$.get(Tool.getURL()+"public/PullDataAndInsertController_queryInsertedArticles.do",param,function(data){
				if(data.length>0){
					PULL.insertedArticlesData=data;
					var tr="";
					for(var i=0,len=data.length;i<len;i++){
						var temp=data[i];
						var oper="";
						if(!temp.comment_id){
							oper="<a class='insert' href='javascript:void(0)' title='插入文章' onclick=\"PULL.insertComments('"+i+"')\">插入</a>"
						}else{
							oper="<span class='text-separate'>已插入</span>"
						}
						tr+="<tr>"
								+"<td>"+(i+1)+"</td>"
								+"<td>"+temp.title+"</td>" 
								+"<td>"+temp.created_at+"</td>"
								+"<td>"+temp.comment_count+"</td>"
								+"<td>"
									+oper
								"</td>"
							"</tr>";
					}
					$("#publish_comments_table tr:gt(0)").remove();
					$("#publish_comments_table").append(tr);
				}else{
					PULL.insertedArticlesData=null;
					layer.msg("暂无数据");
				}
			},"json");
		},
		createArticleList:function(data){
			var tr="";
			for(var i=0,len=data.length;i<len;i++){
				var temp=data[i];
				tr+="<tr>"
						+"<td>"+(i+1)+"</td>" 
						+"<td>"+temp.title+"</td>" 
						+"<td>"+new Date(temp.created_at).toLocaleString()+"</td>"
						+"<td>"+temp.comment_count+"</td>"
						+"<td>"
							+"<a class='validate' href='javascript:void(0)' title='验证文章是否已经插入' onclick=\"PULL.validateData('"+i+"')\">验证</a>"
							+"<span class='text-separate'>|</span>"
							+"<a class='insert' href='javascript:void(0)' title='插入文章' onclick=\"PULL.openInsertWindow('"+i+"')\">插入</a>"
						"</td>"
					"</tr>";
			}
			$("#publish_articles_table tr:gt(0)").remove();
			$("#publish_articles_table").append(tr);
		},
		validateData:function(index){
			var data=PULL.articlesData[index]
			var param={
					article_id:data.article_id
			}
			var flag=false;
			var loading=layer.load();
			$.ajax({ 
		          type : "GET", 
		          url : Tool.getURL()+"public/PullDataAndInsertController_queryArticleById.do", 
		          data : param, 
		          async : false, 
		          dataType:'json',
		          success : function(result){ 
		        	  layer.close(loading);
		        	  if(result.length>0){
							layer.msg("此文章已近插入",{icon:7});
							flag=true;
						}else{
							layer.msg("此文章暂未插入",{icon:5});
							flag=false;
						}
		          } 
		    }); 
			return flag;
		},
		openInsertWindow:function(number){
			if(PULL.validateData(number)){
				return false;  
			 };
			layer.open({
				  type: 1,
				  title: [PULL.articlesData[number].title, 'font-size:14px;'],
				  area: ['400px', '150px'],
				  btn: ['yes', 'no'],
				  closeBtn: 0,
				  shadeClose: true,
				  skin: 'demo-class',
				  content: "<div> " +
				  				"<h5>请选择文章的类型</h5> " +
				  				"<select id='article_type'>" +
				  					"<option value='1001'>正文首次</option>" +
				  					"<option value='1002'>问答</option>" +
				  					"<option value='1003'>正文更新</option>" +
				  					"<option value='1004'>一周奖励</option>" +
				  					"<option value='1005'>下周预告</option>" +
				  				"</select>" +
				  			"</div>",
				  yes: function(index, layero){
					  var article_type=$("#article_type").val();
					  PULL.insertArticles(number,article_type);
				  	  layer.close(index); //如果设定了yes回调，需进行手工关闭
				  },
				  no:function(index, layero){
				  	  layer.close(index); //如果设定了yes回调，需进行手工关闭
				  }
			});
			
		},
		insertArticles:function(index,article_type){
			var data=PULL.articlesData[index];
			data.article_type=article_type;
			var loading=layer.load();
			$.get(Tool.getURL()+"public/PullDataAndInsertController_insertArticle.do",data,function(result){
				if(result.state){
					layer.msg("插入成功",{icon:6});
					$("#publish_comments_query").click();
				}else{
					layer.msg("插入失败",{icon:5});
				}
				layer.close(loading);
			},"json");
		},
		insertComments:function(number){
			var article_id=PULL.insertedArticlesData[number]["article_id"];
			var url="https://caifu.xinshengdaxue.com/v1/treasure/"+article_id+"/comments?page=1&limit=3000000";
			var loading=layer.load();
			$.get(url,null,function(callbackdata){
				var dataList=callbackdata.result.data
				var dataArr=new Array();
				for(var i=0,len=dataList.length;i<len;i++){
					var temp=dataList[i];
					var tempArr=new Array();
					tempArr.push(temp.user_name);
					tempArr.push(temp.article_id);
					tempArr.push(temp.created_at);
					tempArr.push(temp.comment_id);
					tempArr.push(temp.content);
					tempArr.push(temp.index);
					tempArr.push(temp.user_avatar);
					dataArr.push(tempArr.join("$*$"));
				}
				var param={
						dataList:dataArr.join("βΣ")
				}
				$.post(Tool.getURL()+"public/PullDataAndInsertController_insertComments.do",param,function(result){
					if(result.state){
						layer.msg("插入成功",{icon:6});
						$("#publish_comments_query").click();
					}else{
						layer.msg("插入失败",{icon:5});
					}
					layer.close(loading);
				},"json")
			},"json");
		}
}




