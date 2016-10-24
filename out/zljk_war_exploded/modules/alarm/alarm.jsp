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
<link rel="stylesheet" href="<%=path %>/framework/css/datepicker.css" />

<script type="text/javascript" src="<%=path%>/framework/js/charts/highcharts.js"></script>
<script type="text/javascript" src="<%=path%>/framework/js/charts/exporting.src.js"></script>
<script type="text/javascript" src="<%=path%>/modules/alarm/js/alarm.js"></script>
<script type="text/javascript">
var isRead="${pd.write_read}";//菜单是否只读
	jQuery(document).ready(function() {
		App.init(); // initlayout and core plugins
		var win_h = $(window).height() - 605;
		$("#monitor_date_table").css("min-height", win_h);
		$("#page-content").css("min-height", win_h);
		 $("#user_date_table").css("min-height",win_h-80);
		 $("#container").css("height",win_h-100);
		 if(<%=request.getParameter("alarm_type")%>!='' && <%=request.getParameter("alarm_type")%>!=null){
		  document.getElementById('alarmType').value=<%=request.getParameter("alarm_type")%>;
		 }
		 if(<%=request.getParameter("farmId")%>!='' && <%=request.getParameter("farmId")%>!=null){
			  document.getElementById('farmId').value=<%=request.getParameter("farmId")%>;
			 }
		 if(<%=request.getParameter("houseId")%>!='' && <%=request.getParameter("houseId")%>!=null){
			   document.getElementById('houseId').value=<%=request.getParameter("houseId")%>;
			 }	
		 document.getElementById('alarm_delay').value= '${houseAlarm.alarm_delay}';
		 document.getElementById('temp_cpsation').value= '${houseAlarm.temp_cpsation}';
		 document.getElementById('yincang').value= '${houseAlarm.alarm_way}';
		 document.getElementById('temp_cordon').value= '${houseAlarm.temp_cordon}';
		 if(document.getElementById('alarmType').value != 1){
			 $("#alarm_delay").attr("disabled",true);
			 $("#temp_cpsation").attr("disabled",true);
			 $("#yincang").attr("disabled",true);
			 $("#temp_cordon").attr("disabled",true);
		 }
		 tempCordon();
		 querySBDayageSettingSub();
	});
	
	function tempCordon(){
		if($("#temp_cpsation").val()==0){
			$("#temp_cordon").attr("disabled",true);
		}else {
			$("#temp_cordon").attr("disabled",false);
		}
	}
	
	function alarmHide(){
		if($("#yincang").val()=="1"){
			$("#yincang2").css("display", "block");
		}else{
			$("#yincang2").setAttribute("readOnly","true");
		}
	}
	
</script>

</head>
<body style="background-color: #ffffff;">
	<!--  <div class="container-fluid" id="main-container" style="background-color: #ffffff;"> -->
	<div id="page-content" class="clearfix" style="padding-top: 10px;">
		<div class="row-fluid" style="background-color: #ffffff;">
			<form action="<%=path%>/alarm/queryAlarm2" method="post" style="background-color: #ffffff;" id="alarmForm">
				<%-- <input type="hidden" name="id" value="${pd.id}">
						<input type="hidden" name="pid" value="${pd.pid}"> --%>
				<div class="span12">
					<!-- BEGIN PORTLET-->
					<div class="portlet box blue1">
								<div class="portlet-title">
									<div class="caption">
										<i class="icon-reorder"></i>检索条件
									</div>
<!-- 									<div class="actions"> -->

<!-- 										<a href="javascript:;" class="btn green"><i class="icon-search"></i> 查询</a> -->

<!-- 									</div> -->

								</div>

								<div class="portlet-body form1">
									<!-- BEGIN FORM-->
									<div class="form-horizontal" style="height: 40px;">
										<div style="height: 20px;">
											<div class="span4">
												<div class="control-group">
													<label class="control-label" style="width: 60px;">农场</label>
													<div class="controls" style="margin-left: 65px;">
														<select id="farmId" class="m-wrap span12" tabindex="1" name="farmId" onchange="reflushAlarm();">	
<!-- 		                                                 <option value="">全部</option> -->
		                                                 <c:if test="${!empty farmList}">
		                                                 <c:forEach var="farm" items="${farmList}">
		                                                 <option value="${farm.id }">${farm.farm_name_chs }</option>
		                                                 </c:forEach>
		                                                 </c:if>
														</select>
													</div>
												</div>
											</div>

											<!--/span-->

											<div class="span4">

												<div class="control-group">

													<label class="control-label" style="width: 60px;">栋舍</label>

													<div class="controls" style="margin-left: 65px;">

														<select id="houseId" class="m-wrap span12" tabindex="1" name="houseId" onchange="search();">
<!-- 														<option value="">全部</option> -->
		                                                 <c:if test="${!empty houseList}">
		                                                 <c:forEach var="house" items="${houseList}">
		                                                 <option value="${house.id }">${house.house_name}</option>
		                                                 </c:forEach>
		                                                 </c:if>
														</select>
													</div>
												</div>
											</div>
											
											<!--/span-->
											<!--/span-->

											<div class="span4">

												<div class="control-group">

													<label class="control-label" style="width: 60px;">报警类别</label>

													<div class="controls" style="margin-left: 65px;">
                                                      <select id="alarmType" class="m-wrap span12" name="alarm_type" tabindex="1" onchange="search();">
														<option value="1">温度设置</option>
                                                        <option value="2">负压设置</option>
                                                        <option value="3">二氧化碳设置</option>
                                                        <option value="4">饮水量设置</option>
														</select>
													</div>

												</div>

											</div>

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
								<i class="icon-globe"></i>报警设置列表
							</div>

<!-- 							<div class="tools"> -->
<!-- 								<a href="javascript:;" class="btn green" onclick="addAlarmUrl();"><i class="icon-plus"></i> 新增</a> -->
<!-- 							</div> -->

						</div>
                        
						<div class="portlet-body" style="overflow-x: auto; overflow-y: auto;" >
							<table class="table table-striped table-bordered table-hover" id="monitor_date_table"  
							style="margin-left: 30px;float: left;width: 500px;" data-options="singleSelect:true,collapsible:true,method:'POST'">
                               <c:if test="${alarmType==1 }">
								<thead style="color: #fff; background-color: #2586C4;">
                                    <!-- 温度设置 -->
									<tr style="width: 550px;height: 15px;">
									    <th style="text-align: center;width: 30px;">
<!-- 									    <a onclick="checkAll();">全选</a> -->
									    </th>
										<th style="text-align: center;">日龄</th>
										<th style="text-align: center;">目标温度</th>
										<th style="text-align: center;">高报温度</th>
										<th style="text-align: center;">低报温度</th>
<!-- 										<th style="text-align: center;">操作</th>																				 -->
									</tr>

								</thead>
								<tr style="width: 0px; height: 0px;"></tr>
								<tbody id="tbodySBDayageSettingSubList">
								
                                   <c:if test="${!empty sBDayageSettingSubList}">
		                              <c:forEach var="sBDayageSettingSub" items="${sBDayageSettingSubList}">
		                              <script>	
                                       function chufa${sBDayageSettingSub.uid_num}(){
		                               $("#monitor_date_table").find("input").each(function(){
	                                                             $(this).attr("readOnly",true);
                                       });
		                               //$("#day_age"+${sBDayageSettingSub.uid_num}).removeAttr("readOnly");
		                               $("#set_temp"+${sBDayageSettingSub.uid_num}).removeAttr("readOnly");
		                               $("#high_alarm_temp"+${sBDayageSettingSub.uid_num}).removeAttr("readOnly");
		                               $("#low_alarm_temp"+${sBDayageSettingSub.uid_num}).removeAttr("readOnly");
	                                   }
                                      </script>
                                        <c:if test="${!empty sBDayageSettingSub.set_temp}">
                                            <tr style="width: 550px; height: 15px;" >
                                                <td style="text-align: center;width: 30px;height: 15px;">
                                                    <!--                                         ${index+1} -->
                                                    <input id="${sBDayageSettingSub.uid_num}" type="radio" name="checkedSBDayageSettingSubId" value="${sBDayageSettingSub.uid_num}" onchange="chufa${sBDayageSettingSub.uid_num}();" />
                                                </td>

                                                <td id="day_agea${sBDayageSettingSub.uid_num}" style="text-align: center;height: 15px;">
                                                    <input id="day_age${sBDayageSettingSub.uid_num}" type="text" value="${sBDayageSettingSub.day_age }" readonly="readonly" style="border: none;margin-left:-7px;margin-top:-9px;margin-bottom:0px;text-align: center;width: 100%;height: 100%;">
                                                </td>
                                                <td id="set_tempa${sBDayageSettingSub.uid_num}" style="text-align: center;height: 15px;">
                                                    <input id="set_temp${sBDayageSettingSub.uid_num}" type="text" value="${sBDayageSettingSub.set_temp }" readonly="readonly" style="border: none;margin-left:-7px;margin-top:-9px;margin-bottom:0px;text-align: center;width: 100%; height: 100%;">
                                                </td>
                                                <td id="high_alarm_tempa${sBDayageSettingSub.uid_num}" style="text-align: center;height: 15px;">
                                                    <input id="high_alarm_temp${sBDayageSettingSub.uid_num}" type="text" value="${sBDayageSettingSub.high_alarm_temp }" readonly="readonly" style="border: none;margin-left:-7px;margin-top:-9px;margin-bottom:0px;text-align: center;width: 100%;height: 100%; ">
                                                </td>
                                                <td id="low_alarm_tempa${sBDayageSettingSub.uid_num}" style="text-align: center;height: 15px;">
                                                    <input id="low_alarm_temp${sBDayageSettingSub.uid_num}" type="text" value="${sBDayageSettingSub.low_alarm_temp }" readonly="readonly" style="border: none;margin-left:-7px;margin-top:-9px;margin-bottom:0px;text-align: center;width: 100%;height: 100%; ">
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                                </c:if>
                                <!-- 负压设置 -->
                                <c:if test="${alarmType==2 }">
								<thead style="color: #fff; background-color: #2586C4;">

									<tr style="width: 250px;height: 15px;">
									    <th style="text-align: center;width: 30px;" onclick="checkAll();">
<!-- 									    全选 -->
									    </th>
										<th style="text-align: center;">日龄</th>
<!-- 										<th style="text-align: center;">目标负压</th> -->
										<th style="text-align: center;">高报负压</th>
										<th style="text-align: center;">低报负压</th>
<!-- 										<th style="text-align: center;">操作</th> -->
									</tr>

								</thead>
								<tr style="width: 0px; height: 0px;"></tr>
								<tbody id="tbodySBDayageSettingSubList">
                                   <c:if test="${!empty sBDayageSettingSubList}">
		                              <c:forEach var="sBDayageSettingSub" items="${sBDayageSettingSubList}">
		                              <script>
		                              function chufa${sBDayageSettingSub.uid_num}(){
		                               $("#monitor_date_table").find("input").each(function(){
	                                                             $(this).attr("readOnly",true);
                                       });
		                               //$("#day_age"+${sBDayageSettingSub.uid_num}).removeAttr("readOnly");
		                               $("#set_negative_pressure"+${sBDayageSettingSub.uid_num}).removeAttr("readOnly");
		                               $("#high_alarm_negative_pressure"+${sBDayageSettingSub.uid_num}).removeAttr("readOnly");
		                               $("#low_alarm_negative_pressure"+${sBDayageSettingSub.uid_num}).removeAttr("readOnly");
	                                   }
		                              </script>
		                                 <c:if test="${!empty sBDayageSettingSub.high_alarm_negative_pressure}">
		                                 <tr style="width: 250px;height: 15px;">
		                                            <td style="text-align: center;width: 30px;height: 15px;">
                                                    <!--                                         ${index+1} -->
                                                    <input id="${sBDayageSettingSub.uid_num}" type="radio" name="checkedSBDayageSettingSubId" value="${sBDayageSettingSub.uid_num}" onchange="chufa${sBDayageSettingSub.uid_num}();" />
                                                </td>

                                                <td id="day_agea${sBDayageSettingSub.uid_num}" style="text-align: center;height: 15px;">
                                                    <input id="day_age${sBDayageSettingSub.uid_num}" type="text" value="${sBDayageSettingSub.day_age }" readonly="readonly" style="border: none;margin-left:-7px;margin-top:-9px;margin-bottom:0px;text-align: center;width: 100%;height: 100%;">
                                                </td>
                                                <td id="high_alarm_negative_pressurea${sBDayageSettingSub.uid_num}" style="text-align: center;height: 15px;">
                                                    <input id="high_alarm_negative_pressure${sBDayageSettingSub.uid_num}" type="text" value="${sBDayageSettingSub.high_alarm_negative_pressure }" readonly="readonly" style="border: none;margin-left:-7px;margin-top:-9px;margin-bottom:0px;text-align: center;width: 100%;height: 100%; ">
                                                </td>
                                                <td id="low_alarm_negative_pressurea${sBDayageSettingSub.uid_num}" style="text-align: center;height: 15px;">
                                                    <input id="low_alarm_negative_pressure${sBDayageSettingSub.uid_num}" type="text" value="${sBDayageSettingSub.low_alarm_negative_pressure }" readonly="readonly" style="border: none;margin-left:-7px;margin-top:-9px;margin-bottom:0px;text-align: center;width: 100%;height: 100%; ">
                                                </td>
		                                 </tr>
		                                 </c:if>
		                                  </c:forEach>
		                            </c:if>                   
								</tbody>
                                </c:if>
                                <!-- 二氧化碳设置 -->
                                <c:if test="${alarmType==3 }">
								<thead style="color: #fff; background-color: #2586C4;">

									<tr style="width: 250px;height: 15px;">
									    <th style="text-align: center;width: 30px;" onclick="checkAll();">
<!-- 									    全选 -->
									    </th>
										<th style="text-align: center;">日龄</th>
<!-- 										<th style="text-align: center;">目标二氧化碳</th> -->
										<th style="text-align: center;">高报二氧化碳</th>
<!-- 										<th style="text-align: center;">低报二氧化碳</th> -->
<!-- 										<th style="text-align: center;">操作</th> -->
									</tr>

								</thead>
								<tr style="width: 0px; height: 0px;"></tr>
								<tbody id="tbodySBDayageSettingSubList">
                                   <c:if test="${!empty sBDayageSettingSubList}">
		                              <c:forEach var="sBDayageSettingSub" items="${sBDayageSettingSubList}">
		                              <script>
		                              function chufa${sBDayageSettingSub.uid_num}(){
		                               $("#monitor_date_table").find("input").each(function(){
	                                                             $(this).attr("readOnly",true);
                                       });
		                               //$("#day_age"+${sBDayageSettingSub.uid_num}).removeAttr("readOnly");
		                               $("#set_co2c"+${sBDayageSettingSub.uid_num}).removeAttr("readOnly");
		                               $("#high_alarm_co2c"+${sBDayageSettingSub.uid_num}).removeAttr("readOnly");
		                               $("#low_alarm_co2c"+${sBDayageSettingSub.uid_num}).removeAttr("readOnly");
	                                   }
		                              </script>
		                                 <c:if test="${!empty sBDayageSettingSub.high_alarm_co2}">
		                                 <tr >
		                                           <td style="text-align: center;width: 30px;height: 15px;">
                                                    <!--                                         ${index+1} -->
                                                    <input id="${sBDayageSettingSub.uid_num}" type="radio" name="checkedSBDayageSettingSubId" value="${sBDayageSettingSub.id}" onchange="chufa${sBDayageSettingSub.uid_num}();" />
                                                </td>

                                                <td id="day_agea${sBDayageSettingSub.uid_num}" style="text-align: center;height: 15px;">
                                                    <input id="day_age${sBDayageSettingSub.uid_num}" type="text" value="${sBDayageSettingSub.day_age }" readonly="readonly" style="border: none;margin-left:-7px;margin-top:-9px;margin-bottom:0px;text-align: center;width: 100%;height: 100%;">
                                                </td>
                                                <td id="high_alarm_co2a${sBDayageSettingSub.uid_num}" style="text-align: center;height: 15px;">
                                                    <input id="high_alarm_co2c${sBDayageSettingSub.uid_num}" type="text" value="${sBDayageSettingSub.high_alarm_co2 }" readonly="readonly" style="border: none;margin-left:-7px;margin-top:-9px;margin-bottom:0px;text-align: center;width: 100%;height: 100%; ">
                                                </td>
		                                 </tr>
		                                 </c:if>
		                                  </c:forEach>
		                            </c:if>                   
								</tbody>
                                </c:if>
                                <!-- 饮水量设置 -->
                                <c:if test="${alarmType==4 }">
								<thead style="color: #fff; background-color: #2586C4;">

									<tr style="width: 500px;height: 15px;">
									    <th style="text-align: center;width: 30px;" onclick="checkAll();">
<!-- 									    全选 -->
									    </th>
										<th style="text-align: center;">日龄</th>
										<th style="text-align: center;">目标耗水</th>
										<th style="text-align: center;">高报耗水</th>
										<th style="text-align: center;">低报耗水</th>
<!-- 										<th style="text-align: center;">操作</th> -->
									</tr>

								</thead>
								<tr style="width: 0px; height: 0px;"></tr>
								<tbody id="tbodySBDayageSettingSubList">
                                   <c:if test="${!empty sBDayageSettingSubList}">
		                              <c:forEach var="sBDayageSettingSub" items="${sBDayageSettingSubList}">
		                              <script>
		                              function chufa${sBDayageSettingSub.uid_num}(){
		                               $("#monitor_date_table").find("input").each(function(){
	                                                             $(this).attr("readOnly",true);
                                       });
		                               //$("#day_age"+${sBDayageSettingSub.uid_num}).removeAttr("readOnly");
		                               $("#set_water_deprivation"+${sBDayageSettingSub.uid_num}).removeAttr("readOnly");
		                               $("#high_water_deprivation"+${sBDayageSettingSub.uid_num}).removeAttr("readOnly");
		                               $("#low_water_deprivation"+${sBDayageSettingSub.uid_num}).removeAttr("readOnly");
	                                   }
		                              </script>
		                                 <c:if test="${!empty sBDayageSettingSub.set_water_deprivation}">
		                                 <tr style="width: 500px;height: 15px;">
		                                            <td style="text-align: center;width: 30px;height: 15px;">
                                                    <!--                                         ${index+1} -->
                                                    <input id="${sBDayageSettingSub.uid_num}" type="radio" name="checkedSBDayageSettingSubId" value="${sBDayageSettingSub.uid_num}" onchange="chufa${sBDayageSettingSub.uid_num}();" />
                                                </td>

                                                <td id="day_agea${sBDayageSettingSub.uid_num}" style="text-align: center;height: 15px;">
                                                    <input id="day_age${sBDayageSettingSub.uid_num}" type="text" value="${sBDayageSettingSub.day_age }" readonly="readonly" style="border: none;margin-left:-7px;margin-top:-9px;margin-bottom:0px;text-align: center;width: 100%;height: 100%;">
                                                </td>
                                                <td id="set_water_deprivationa${sBDayageSettingSub.uid_num}" style="text-align: center;height: 15px;">
                                                    <input id="set_water_deprivation${sBDayageSettingSub.uid_num}" type="text" value="${sBDayageSettingSub.set_water_deprivation }" readonly="readonly" style="border: none;margin-left:-7px;margin-top:-9px;margin-bottom:0px;text-align: center;width: 100%; height: 100%;">
                                                </td>
                                                <td id="high_water_deprivationa${sBDayageSettingSub.uid_num}" style="text-align: center;height: 15px;">
                                                    <input id="high_water_deprivation${sBDayageSettingSub.uid_num}" type="text" value="${sBDayageSettingSub.high_water_deprivation }" readonly="readonly" style="border: none;margin-left:-7px;margin-top:-9px;margin-bottom:0px;text-align: center;width: 100%;height: 100%; ">
                                                </td>
                                                <td id="low_water_deprivationa${sBDayageSettingSub.uid_num}" style="text-align: center;height: 15px;">
                                                    <input id="low_water_deprivation${sBDayageSettingSub.uid_num}" type="text" value="${sBDayageSettingSub.low_water_deprivation }" readonly="readonly" style="border: none;margin-left:-7px;margin-top:-9px;margin-bottom:0px;text-align: center;width: 100%;height: 100%; ">
                                                </td>
		                                 </tr>
		                                 </c:if>
		                                  </c:forEach>
		                            </c:if>                   
								</tbody>
                                </c:if>
                                
							</table>
                            <table style="margin-right: 200px;margin-left: 800px;height: 10px;width: 500px;margin-top: 0px;">
							<thead>

									<tr>
										<th>报警延迟</th>	
										<td>
										<select id="alarm_delay" name="alarm_delay" class="m-wrap span12" tabindex="1" onchange="">													
														<c:if test="${!empty alarm_delay}">
		                                                 <c:forEach var="alarmDelay" items="${alarm_delay}">
		                                                 <option value="${alarmDelay.biz_code }">${alarmDelay.code_name }</option>
		                                                 </c:forEach>
		                                                 </c:if>
														</select>
										</td>
										<th>语音报警</th>
                                    <td>
                                    <a href="javascript:bindingUserUrl();" onclick="">上传报警通讯录</a>
                                    </td>																		
									</tr>
									<tr>
									<th>温度补偿</th>	
									<td>
									<select id="temp_cpsation" name="temp_cpsation" class="m-wrap span12" tabindex="1" onchange="tempCordon()">									                    
														<option value="1">是</option>
														<option value="0">否</option>                                                        
														</select>
									</td>	
									<th>补偿值</th>	
									<td>
									<input  type="text" id="temp_cordon" class="span6 m-wrap" style="width: 100px;" name="temp_cordon">
									</td>								
									</tr>
									<tr>
									<th>
									报警形式
									</th>
									<td>
									<select id="yincang" name="alarm_way" class="m-wrap span12" tabindex="1" onchange="alarmHide();">
														<option value="02">独立探头报警</option>
														<option value="03">平均温度报警</option>                                                        
														</select>
									</td>
									<td id="yincang2" style="display:none;">
									    <label><input name="Fruit" type="checkbox" value="1" />1号探头 </label> 
										<label><input name="Fruit" type="checkbox" value="2" />2号探头 </label> 
										<label><input name="Fruit" type="checkbox" value="3" />3号探头 </label> 
										<label><input name="Fruit" type="checkbox" value="4" />4号探头</label> 
									</td>	
									</tr>
								</thead>
						</table>
						<div class="portlet-body" style="margin-left: 25px;float:left;">
						<button type="button" class="btn blue" onclick="addAlarmUrl()">
<!-- 						<i class="icon-ok"></i> -->
<!-- 						<a href="javascript:addAlarmUrl();"><i class="icon-edit"></i> -->
						&nbsp;&nbsp;&nbsp;&nbsp;新增&nbsp;&nbsp;&nbsp;&nbsp;
<!-- 						</a> -->
						</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;
						<button type="button" class="btn blue" onclick="batchChange()">
<!--                          <a href="javascript:batchChange();" onclick="batchChange();"> -->
<!--                          <i class="icon-ok"></i> -->
<!--                          <i class="icon-trash"></i> -->
                        &nbsp;&nbsp;&nbsp;&nbsp;删除&nbsp;&nbsp;&nbsp;&nbsp;
<!--                          </a> -->
                         </button> 
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         &nbsp;&nbsp;
                         <button type="button" class="btn blue" onclick="update()">                                                          
<!--                          <a href="javascript:update();"><i class="icon-edit"></i> -->
                        &nbsp;&nbsp;&nbsp;&nbsp;保存&nbsp;&nbsp;&nbsp;&nbsp;
<!--                         </a> -->
                        </button>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;
                         <button type="button" class="btn blue" onclick="applyAlarmUrl()">
<!--                          <a href="javascript:applyAlarmUrl();"><i class="icon-edit"></i> -->
                             &nbsp;&nbsp;  应用至&nbsp;&nbsp;
<!--                          </a> -->
                         </button>
						</div>
						</div>
                        
                        
<!--                         <div class="portlet-body" style="margin-right: 200px;margin-left: 500px;height: 10px;margin-top: 0px;"> -->
							

<!-- 						</div>	 -->
						
					</div>
					
					<div class="portlet box blue1">
								<div class="portlet-title">
									<div class="caption">
										<i class="icon-globe"></i>报警曲线图
									</div>
								</div>

								<div class="portlet-body" id="user_date_table">
									<input type="hidden" name="buttonValue" id="buttonValue">
									<div id="container" class="form-horizontal" ></div>
								</div>
							</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="<%=path%>/js/bootbox.min.js"></script>
</body>
</html>