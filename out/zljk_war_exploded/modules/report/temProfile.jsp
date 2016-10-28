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
</head>
<script>
	var houseId="${pd.house_id}";
	<%--var menuPid="${pd.pid}";--%>

var xNames = new Array();//X坐标


var insideTemp1 = new Array();
var insideTemp2 = new Array();
var insideTemp3 = new Array();
var insideTemp4 = new Array();

var insideSetTemp = new Array();//目标温度
/* var insideAvgTemp = new Array();//实际温度 */
var highAlarmTemp = new Array();//高报温度
var lowAlarmTemp = new Array();//低报温度
var outsideTemp = new Array();//室外温度

<c:forEach items="${TemProfile }" var="tep">
	xNames.push('${tep.time }点');
	insideTemp1.push(${tep.inside_temp1 });
	insideTemp2.push(${tep.inside_temp2 });
	insideTemp3.push(${tep.inside_temp3 });
	insideTemp4.push(${tep.inside_temp4 });
	insideSetTemp.push(${tep.inside_set_temp });
	/* insideAvgTemp.push(${tep.inside_avg_temp }); */
	highAlarmTemp.push(${tep.high_alarm_temp });
	lowAlarmTemp.push(${tep.low_alarm_temp });
	outsideTemp.push(${tep.outside_temp });
	
</c:forEach>
</script>

<body style="background-color: #ffffff;">
			<div id="page-content" class="clearfix"  style="padding-top: 10px;"> 
				<div class="row-fluid" style="background-color: #ffffff;">
					<form  method="post" style="background-color: #ffffff;">
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
										<%@ include file="../../framework/org.jsp"%>
											<%-- <div class="span3">
												<div class="control-group">
													<label class="control-label" style="width: 50px;">农场</label>
													<div class="controls" style="margin-left: 55px;">
														<select id="farmId" class="m-wrap span12" tabindex="1" name="farmId" >	
			                                               <!-- 	<option value="">全部</option> -->
			                                                 <c:if test="${!empty farmList}">
			                                                 <c:forEach var="farm" items="${farmList}">
																 <option value="${farm.id }" <c:if test="${pd.farm_id==farm.id}">selected</c:if>>${farm.farm_name_chs }</option>
			                                                 </c:forEach>
		                                                 </c:if>
															<c:if test="!empty farmList1">
																<c:forEach var="farm" items="farmList1">
																	<option value="${farm.farm_id}">${farm.farm_name}</option>
																</c:forEach>
															</c:if>
														</select>
													</div>
												</div>
											</div> --%>
											<!--/span-->

											<%-- <div class="span3">

												<div class="control-group">
													<label class="control-label" style="width: 30px;">栋舍</label>
													<div class="controls" style="margin-left: 35px;">
														<select id="houseId" class="m-wrap span12" tabindex="1" >
															<c:if test="${!empty houseList}">
																<c:forEach var="house" items="${houseList}">
																	<option value="${house.id}" <c:if test="${pd.house_id==house.id}">selected</c:if>>${house.house_name}</option>
																</c:forEach>
															</c:if>
															<!-- <option value="">全部</option> -->
			                                                 <c:if test="${!empty houseList}">
			                                                 <c:forEach var="house" items="${houseList}">
			                                                 <option value="${house.id }">${house.house_name}</option>
			                                                 </c:forEach>
			                                                 </c:if>
														</select>
													</div>
												</div>

											</div> --%>

											<!--/span-->

											<!--/span-->
											 <div class="span3" style="width: 120px;">
												<div class="control-group">
													<label class="control-label" style="width: 30px;">批次</label>
													<div class="controls" style="margin-left: 35px;">
														<select id="batchId" class="m-wrap span12" tabindex="1"  name="batchId" style="width: 100px;">
															<!-- <option value="">全部</option> -->
			                                                 <%-- <c:if test="${!empty batchList}">
			                                                 <c:forEach var="batch" items="${batchList}">
			                                                 <option value="${batch.batch_no}">${batch.batch_no}</option>
			                                                 </c:forEach>
			                                                 </c:if> --%>
														</select>
													</div>
												</div>
											</div> 

											<!--/span-->
											<!--/span-->

											<div class="span3" style="width: 140px;">

												<div class="control-group">

													<label class="control-label" style="width: 30px;">日期</label>

													<div class="controls" style="margin-left: 35px;">
														<div class="input-append date date-picker"  data-date-format="yyyy-mm-dd" data-date-viewmode="years" data-date-minviewmode="months">

															<input class="m-wrap  span11 m-ctrl-medium date-picker " readonly type="text" name="queryTime" id="queryTime" /><span class="add-on"><i class="icon-calendar"></i></span>
			
														</div>

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
										<i class="icon-globe"></i>温度曲线图
									</div>
								</div>

								<div class="portlet-body" id="user_date_table">
									<input type="hidden" name="buttonValue" id="buttonValue">
									<div id="container" class="form-horizontal" ></div>
									<div class="portlet-body form1"> 
										<div class="span4">
											<div class="control-group" style="padding-left: 100px;">
												<input type="button"  style="width: 80px;" value="近一个月" onclick="javascript:buttonMonth();">
											</div>
										</div>
										<div class="span4">
											<div class="control-group" style="padding-left: 100px;">
												<input type="button"  style="width: 80px;" value="近一周" onclick="javascript:buttonWeek();">
											</div>
										</div>
										<div class="span4">
											<div class="control-group" style="padding-left: 100px;">
												<input type="button"  style="width: 80px;" value="当日" onclick="javascript:buttonDay();">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div> 
		 </div> 
<script type="text/javascript" src="<%=path%>/js/bootbox.min.js"></script>
<script type="text/javascript" src="<%=path %>/framework/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="<%=path %>/framework/js/bootstrap-datepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=path%>/modules/report/js/temProfile.js"></script>
</body>
</html>
