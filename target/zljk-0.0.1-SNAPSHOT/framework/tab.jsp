<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

	<head>
	<base href="<%=basePath%>">
	
	<script src="<%=path %>/framework/tab/js/jquery-1.7.2.js" type="text/javascript"></script>
	<script src="<%=path %>/framework/tab/js/framework.js" type="text/javascript"></script>
	<link href="<%=path %>/framework/tab/css/import_basic.css" rel="stylesheet" type="text/css"/>
	<link  rel="stylesheet" type="text/css" id="skin" prePath="<%=path %>/framework/tab/" /><!--默认相对于根目录路径为../，可添加prePath属性自定义相对路径，如prePath="<%=request.getContextPath()%>"-->
	<script type="text/javascript" charset="utf-8" src="<%=path %>/framework/tab/js/tab.js"></script>
	</head>
	
	
<body>
<div id="tab_menu" style="height:30px;width:100%;" ></div>
<div style="width:100%;">
	<div id="page" style="width:100%;"></div>
</div>		
</body>
<script type="text/javascript">
var indexMid = new Array("z101"); 
function tabAddHandler(mid,mtitle,murl){
	var inde="";
	var my=0;
	for (var int = 0; int < indexMid.length; int++) {
		if(indexMid[int]==mid){
			my=1;
		}
	}
	if(my!=1){
		indexMid.push(mid);
	}
	if(indexMid.length>9){
		tab.close(indexMid[1]);//关闭选项卡
		indexMid.splice(1,1); //移除数组元素
	}
	
	tab.update({
		id :mid,
		title :mtitle,
		url :"<%=path%>"+murl,
		isClosed :true
	});
	tab.add({
		id :mid,
		title :mtitle,
		url :"<%=path%>"+murl,
		isClosed :true
	});

	tab.activate(mid);
}
 var tab;	
$( function() {
	 tab = new TabView( {
		containerId :'tab_menu',
		pageid :'page',
		cid :'tab1',
		position :"top"
	});
	tab.add( {
		id :'z101',
		title :"实时监测",
		url :"<%=path%>/monitor/showMonitor",
		isClosed :false
	});
});
/* siMenu("z101","lm1","se1","op1","实时监控","/monitor/showMonitor"); */
	function cmainFrameT(){
		var hmainT = document.getElementById("page");
		var bheightT = document.documentElement.clientHeight;
		hmainT .style.width = '100%';
		hmainT .style.height = (bheightT  - 50) + 'px';
	}
	cmainFrameT();
	window.onresize=function(){  
		cmainFrameT();
	};

</script>
</html>

