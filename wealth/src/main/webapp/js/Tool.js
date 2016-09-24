/**
 * 
 */
var Tool={
		/**
		 * 获取项目主目录地址
		 */
		getURL:function(){
			var pathName=window.document.location.pathname;
			var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+2);
			return document.location.protocol+"//"+document.location.host+projectName;
		},
		/**
		 * 单个获取url中的参数值
		 */
		getParam:function(name){
		    var reg = new RegExp( "(^|&)" + name + "=([^&]*)(&|$)" , "i" );
		    var r = window.location.search.substr(1).match(reg);
		    if (r != null) return decodeURI(r[2]); return null;
		}
}