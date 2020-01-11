<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>数据 - AdminLTE2定制版</title>
<meta name="description" content="AdminLTE2定制版">
<meta name="keywords" content="AdminLTE2定制版">

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/morris/morris.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/select2/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<body class="hold-transition skin-purple sidebar-mini">

	<div class="wrapper">

		<!-- 页面头部 -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- 页面头部 /-->
		<!-- 导航侧栏 -->
		<jsp:include page="aside.jsp"></jsp:include>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<div class="content-wrapper">

			<!-- 内容头部 -->
			<section class="content-header">
			<h1>
				产品管理 <small>产品表单</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="${pageContext.request.contextPath}/product/findAll.do">产品管理</a></li>
				<li class="active">产品表单</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

				<!-- 正文区域 -->
				<section class="content"> <!--产品信息-->
				<div class="panel panel-default">
					<div class="panel-heading">产品信息</div>
					<div class="row data-type">

						<div class="col-md-2 title">产品编号</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="productNum"
								placeholder="ID" value="${product.productNum}">
						</div>

						<div class="col-md-2 title">产品名称</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="productName"
								placeholder="产品名称" value="${product.productName}">
						</div>

						<div class="col-md-2 title">出发时间</div>
						<div class="col-md-4 data">
							<div class="input-group date">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text" class="form-control pull-right"
									id="datepicker-a3" value="${product.departureTimeStr }" name="departureTimeStr">
							</div>
						</div>


						<div class="col-md-2 title">出发城市</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="cityName"
								placeholder="出发城市" value="${product.cityName}">
						</div>

						<div class="col-md-2 title">产品价格</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="产品价格"
								name="productPrice" value="${product.productPrice}">
						</div>

						<div class="col-md-2 title">产品状态</div>
						<div class="col-md-4 data">
							<select class="form-control select2" style="width: 100%"
								name="productStatus">
								<option value="0" selected="${product.productStatus eq '0'?'selected':''}">关闭</option>
								<option value="1" selected="${product.productStatus eq '1'?'selected':''}">开启</option>
							</select>
						</div>

						<div class="col-md-2 title rowHeight2x">其他信息</div>
						<div class="col-md-10 data rowHeight2x">
							<textarea class="form-control" rows="3"
								name="productDesc">${product.productDesc}</textarea>
						</div>

					</div>

					<div class="panel-heading">相关订单信息</div>
					<div class="row data-type">

						<!--数据列表-->
						<table id="dataList"
							   class="table table-bordered table-striped table-hover dataTable">
							<thead>
							<tr>
								<th class="" style="padding-right: 0px;"><input
										id="selall" type="checkbox" class="icheckbox_square-blue">
								</th>
								<th class="sorting_asc">ID</th>
								<th class="sorting_desc">订单编号</th>
								<th class="sorting_asc sorting_asc_disabled">产品名称</th>
								<th class="sorting_desc sorting_desc_disabled">金额</th>
								<th class="sorting">下单时间</th>
								<th class="text-center sorting">订单状态</th>
								<th class="text-center">操作</th>
							</tr>
							</thead>
							<tbody>


							<c:forEach items="${pageInfo.list}" var="orders">

								<tr>
									<td><input name="ids" type="checkbox"></td>
									<td>${orders.id }</td>
									<td>${orders.orderNum }</td>
									<td>${orders.product.productName }</td>
									<td>${orders.product.productPrice }</td>
									<td>${orders.orderTimeStr }</td>
									<td class="text-center">${orders.orderStatusStr }</td>
									<td class="text-center">
										<button type="button" class="btn bg-olive btn-xs" onclick="location.href='${pageContext.request.contextPath}/orders/findById.do?id=${orders.id}'">详情</button>
										<button type="button" class="btn bg-olive btn-xs" onclick="location.href='${pageContext.request.contextPath}/orders/findByIdOnlyOrder.do?id=${orders.id}'">编辑</button>
									</td>
								</tr>
							</c:forEach>
							</tbody>
							<!--
                        <tfoot>
                        <tr>
                        <th>Rendering engine</th>
                        <th>Browser</th>
                        <th>Platform(s)</th>
                        <th>Engine version</th>
                        <th>CSS grade</th>
                        </tr>
                        </tfoot>-->
						</table>
						<!--数据列表/-->
					</div>
				</div>

					<!-- .box-footer-->
					<div class="box-footer">
						<div class="pull-left">
							<div class="form-group form-inline">
								总共${pageInfo.pages}页，共${pageInfo.total}条数据。 每页
								<select class="form-control" id="changePageSize" onchange="changePageSize()">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
								</select> 条
							</div>
						</div>

						<div class="box-tools pull-right">
							<ul class="pagination">
								<li>
									<a href="${pageContext.request.contextPath}/product/findById.do?page=0&pageSize=${pageInfo.pageSize}&id=${product.id }" aria-label="Previous">首页</a>
								</li>
								<li><a href="${pageContext.request.contextPath}/product/findById.do?page=${pageInfo.pageNum-1}&pageSize=${pageInfo.pageSize}&id=${product.id }">上一页</a></li>
								<c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
									<li><a href="${pageContext.request.contextPath}/product/findById.do?page=${pageNum}&pageSize=${pageInfo.pageSize}&id=${product.id}">${pageNum}</a></li>
								</c:forEach>
								<li><a href="${pageContext.request.contextPath}/product/findById.do?page=${pageInfo.pageNum+1}&pageSize=${pageInfo.pageSize}&id=${product.id }">下一页</a></li>
								<li>
									<a href="${pageContext.request.contextPath}/product/findById.do?page=${pageInfo.pages}&pageSize=${pageInfo.pageSize}&id=${product.id }" aria-label="Next">尾页</a>
								</li>
							</ul>
						</div>

					</div>
					<!-- /.box-footer-->

				<!--订单信息/--> <!--工具栏-->
				<div class="box-tools text-center">
					<button type="button" class="btn bg-default"
						onclick="history.back(-1);">返回</button>
				</div>
				<!--工具栏/--> </section>
				<!-- 正文区域 /-->
		</div>
		<!-- 内容区域 /-->

		<!-- 底部导航 -->
		<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 1.0.8
		</div>
		<strong>Copyright &copy; 2014-2017 <a
			href="http://www.WHL.cn">研究院研发部</a>.
		</strong> All rights reserved. </footer>
		<!-- 底部导航 /-->

	</div>


	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>

	<script>

		function changePageSize() {
			//获取下拉框的值
			var pageSize = $("#changePageSize").val();

			//向服务器发送请求，改变没页显示条数
			location.href = "${pageContext.request.contextPath}/product/findById.do?page=0&pageSize="
					+ pageSize+"&id=${product.id }";
		}
		$(document).ready(function() {
			$('#changePageSize').val("${pageInfo.pageSize}");
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});
		});

		// 设置激活菜单
		function setSidebarActive(tagUri) {
			var liObj = $("#" + tagUri);
			if (liObj.length > 0) {
				liObj.parent().parent().addClass("active");
				liObj.addClass("active");
			}
		}

		$(document).ready(function() {
			$('#datepicker-a3').datetimepicker({
				format : "yyyy-mm-dd hh:ii",
				autoclose : true,
				todayBtn : true,
				language : "zh-CN"
			});
		});

		$(document).ready(function() {
			// 激活导航位置
			setSidebarActive("order-manage");
			$("#datepicker-a3").datetimepicker({
				format : "yyyy-mm-dd hh:ii",

			});

		});
	</script>


</body>

</html>