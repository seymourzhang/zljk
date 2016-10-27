<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<head>
<meta charset="utf-8" />
<%@ include file="../../framework/inc.jsp"%>
<script type="text/javascript" src="<%=path%>/framework/js/extJquery.js"></script>
<script type="text/javascript" src="<%=path%>/modules/alarm/js/alarmCurr.js"></script>
</head>
<script>
	jQuery(document).ready(function() {
		App.init(); // initlayout and core plugins
// 		reflushAlarmCurr();
// 		var win_h = $(window).height() - 208;
// 		 $("#real_date_table").css("min-height", win_h);
// 		$("#page-content").css("min-height", win_h);
	});
</script>
<body style="background-color: #ffffff;">
	<!--  <div class="container-fluid" id="main-container" style="background-color: #ffffff;"> -->
	<div id="page-content" class="clearfix" style="padding-top: 10px;">
		<div class="row-fluid" style="background-color:#ffffff;">
			<form id="farmData" method="post" style="background-color: #ffffff;">
				<%-- <input type="hidden" name="id" value="${pd.id}">
						<input type="hidden" name="pid" value="${pd.pid}"> --%>
				<div class="span12">
					<!-- BEGIN PORTLET-->
					<div class="portlet box blue1">
								<div class="portlet-title">
									<div class="caption">
										<i class="icon-reorder"></i>检索条件
									</div>
									<!-- <div class="actions">

										<a href="javascript:;" class="btn green"><i class="icon-search"></i> 查询</a>

									</div> -->

								</div>

								<div class="portlet-body form1">
									<!-- BEGIN FORM-->
									<div class="form-horizontal" style="height: 40px;">
										<div style="height: 20px;">
										<script type="text/javascript">
                                       $(document).ready(function() {
                                       	$.ajax({
                                       		type : "post",
                                       		url : path + "/org/getOrg",
                                       		data : {},
                                       		dataType : "json",
                                       		success : function(result) {
                                       			$("#getOrg option").remove();
                                       			var orglist = result.obj1;
                                       			var list = result.obj;
                                       			var str = '';
                                       			var pid=0;
                                       			count0rg=list.length;
                                       			var no=0;
                                       			for (var i = 0; i < list.length; i++) {
                                       				if(i>1){
                                       					no=1;
                                       				}
                                       				if(i==0){
                                       					str += "<div class='span3' style='width: 180px;'>";
                                       					str += "<div class='control-group'>";
                                       					str += "<label class='control-label' style='width: 30px;'>" + list[i].level_name + "</label>";
                                       					str += "<div class='controls' style='margin-left: 35px;'>";
                                       					str += "<select id='orgId"+list[i].level_id+"' style='width: 160px;' onchange='getOrgList("+(list[i].level_id+1)+","+(list[i].level_id+2)+","+(list[i].level_id+3)+")' class='m-wrap span12' tabindex='1' name='orgId"+list[i].level_id+"'>";
                                       					for (var j = 0; j < orglist.length; j++) {
                                       						if (orglist[j].level_id == list[i].level_id&&pid==orglist[j].parent_id) {
                                       							str +="<option value=" + orglist[j].id + ","+orglist[j].organization_id+">" + orglist[j].name_cn + "</option>";
                                       						}
                                       					}
                                       				
                                       				}else{
                                       					str += "<div class='span3' style='width: 120px;'>";
                                       					str += "<div class='control-group'>";
                                       					str += "<label class='control-label' style='width: 30px;'>" + list[i].level_name + "</label>";
                                       					str += "<div class='controls' style='margin-left: 35px;'>";
                                       					str += "<select id='orgId"+list[i].level_id+"' style='width: 100px;' onchange='getOrgList("+(list[i].level_id+1)+","+(list[i].level_id+2)+","+(list[i].level_id+3)+")' class='m-wrap span12' tabindex='1' name='orgId"+list[i].level_id+"'>";
                                       					str +=getChildList(list[i].parent_id,no);
                                       				}
                                       				
//                                       				for (var j = 0; j < orglist.length; j++) {
//                                       					if (orglist[j].level_id == list[i].level_id&&pid==orglist[j].parent_id) {
//                                       						str +="<option value=" + orglist[j].id + ","+orglist[j].organization_id+">" + orglist[j].name_cn + "</option>";
//                                       					}
//                                       				}
                                       				
                                       				str +="</select></div></div></div>";
                                       			}
                                       			$("#getOrg").append(str);
                                       			id2=list[0].level_id+1;
                                       			getOrgList(list[0].level_id+1,list[0].level_id+2,list[0].level_id+3);
                                       		}
                                       	})
                                       })
                                       	
                                       function getChildList(em,no){
                                       	$.ajaxSetup({ async: false  });
                                       	var str='';
                                           $.get(path+"/org/getOrgByPid?parent_id="+em+"&d="+ new Date().getTime(), function(result){
                                           	var re = $.parseJSON(result);
                                           	var list = re.obj;
//                                            	
                                           		str +="<option value="+0+">" + "全部" + "</option>";
                                           if(no!=1){
	                                           	for (var i = 0; i < list.length; i++) {
	                                       				str +="<option value=" + list[i].id + ","+list[i].organization_id+">" + list[i].name_cn + "</option>";
	                                       		}
                                            }
                                           });
                                           return str;
                                       }
                                       	
                                       function getOrgList(id,id2,id3){   
                                       		if(id==5){
                                       			$.ajax({
                                       				type : "post",
                                       				url : path + "/temProfile/getBatch",
                                       				data : {
                                       					"farmId" : $("#orgId"+(count0rg-1)).val().split(",")[1] ,
                                       					"houseId" :$("#orgId"+count0rg).val().split(",")[1]
                                       				},
                                       				dataType: "json",
                                       				success : function(result) {
                                       					var list = result.obj;
                                       					$("#batchId option").remove();
                                       					for (var i = 0; i < list.length; i++) {
                                       						$("#batchId").append("<option value=" + list[i].batch_no+ ">" + list[i].batch_no + "</option>");
                                       					}
//                                       					$("#batchId").val(list[0].batch_no);
                                       					OrgSearch(count0rg,num);
                                       				}
                                       			})
                                       		}else{
                                       			$.ajax({
                                       				type : "post",
                                       				url : path + "/org/getOrgByPid",
                                       				data : {
                                       					"parent_id" : $("#orgId"+(id-1)).val().split(",")[0]
                                       				},
                                       				dataType: "json",
                                       				success : function(result) {
                                       					var list = result.obj;
                                       					$("#orgId"+id+" option").remove();
                                       					$("#orgId"+id).append("<option value="+0+">" + "全部" + "</option>");
                                       					if(id<id2 && id2<id3 && $("#orgId"+(id-1)).val().split(",")[0]!=0){
	                                       					for (var i = 0; i < list.length; i++) {
	                                       						$("#orgId"+id).append("<option value=" + list[i].id + ","+list[i].organization_id+">" + list[i].name_cn + "</option>");
	                                       					}
                                       				    }
                                       					getOrgList(id+1,id2,id3);
                                       					OrgSearch(count0rg,num);
                                       				}
                                       			})
                                       			
                                       		}
                                       		
                                       	}

                                       </script>
								<div id="getOrg"></div>
<!-- 											<div class="span4"> -->
<!-- 												<div class="control-group"> -->
<!-- 													<label class="control-label" style="width: 60px;">农场</label> -->
<!-- 													<div class="controls" style="margin-left: 65px;"> -->
<!-- 														<select id="farmId" class="m-wrap span12" tabindex="1" name="farmId" onchange="reflushAlarmCurr2();">	 -->
<!-- 		                                                 <option value="">全部</option> -->
<!-- 		                                                 <c:if test="${!empty farmList}"> -->
<!-- 		                                                 <c:forEach var="farm" items="${farmList}"> -->
<!-- 		                                                 <option value="${farm.id }">${farm.farm_name_chs }</option> -->
<!-- 		                                                 </c:forEach> -->
<!-- 		                                                 </c:if> -->
<!-- 														</select> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->

											<!--/span-->

<!-- 											<div class="span4"> -->

<!-- 												<div class="control-group"> -->

<!-- 													<label class="control-label" style="width: 60px;">栋舍</label> -->

<!-- 													<div class="controls" style="margin-left: 65px;"> -->

<!-- 														<select id="houseId" class="m-wrap span12" tabindex="1"  onchange="reflushAlarmCurr();"> -->
<!-- 														<option value="">全部</option> -->
<!-- 		                                                 <c:if test="${!empty houseList}"> -->
<!-- 		                                                 <c:forEach var="house" items="${houseList}"> -->
<!-- 		                                                 <option value="${house.id }">${house.house_name}</option> -->
<!-- 		                                                 </c:forEach> -->
<!-- 		                                                 </c:if> -->
<!-- 														</select> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
											<!--/span-->
						
										</div>
									</div>
									<!-- END FORM-->
								</div>

							</div>

					<!-- END PORTLET-->

					<div class="portlet box blue1">

						<div class="portlet-title">

							<div class="caption">
								<i class="icon-globe"></i>警报列表
							</div>

							<div class="tools">
								<a href="javascript:reflushAlarmCurr();" class="reload"></a> <a href="javascript:;" class="collapse"></a>
							</div>

						</div>

						<div class="portlet-body" style="overflow-x: auto; overflow-y: auto;" id="real_date_table">
							<table class="table table-striped table-bordered table-hover" >

								<thead>

									<tr>
										<th style="text-align: center;">农场</th>
										<th style="text-align: center;">舍号</th>
										<th style="text-align: center;">报警类型</th>
										<th style="text-align: center;">目标值</th>
										<th style="text-align: center;">实际值</th>
										<th style="text-align: center;">警报状态</th>
										<th style="text-align: center;">警报时间</th>
										<th style="text-align: center;">响应时间/分钟</th>
										<th style="text-align: center;">响应人员</th>
									</tr>

								</thead>
								<tbody id="tbodyAlarmCurrList">

								</tbody>

							</table>

						</div>

					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- #main-content -->
	<!-- </div>  -->
	<script type="text/javascript" src="<%=path%>/js/bootbox.min.js"></script>
	<!-- 确认窗口 -->
</body>
</html>
