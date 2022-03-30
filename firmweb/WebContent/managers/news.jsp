<%@ page import="cn.tool.Const" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="<%=Const.ROOT%>managers/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="<%=Const.ROOT%>managers/css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="<%=Const.ROOT%>managers/css/lines.css" rel='stylesheet' type='text/css' />
<link href="<%=Const.ROOT%>managers/css/font-awesome.css" rel="stylesheet">
<!-- jQuery -->
<script src="<%=Const.ROOT%>managers/js/jquery.min.js"></script>
<!----webfonts--->

<!---//webfonts--->  
<!-- Nav CSS -->
<link href="<%=Const.ROOT%>managers/css/custom.css" rel="stylesheet">
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=Const.ROOT%>managers/js/metisMenu.min.js"></script>
<script src="<%=Const.ROOT%>managers/js/custom.js"></script>
<!-- Graph JavaScript -->
<script src="<%=Const.ROOT%>managers/js/d3.v3.js"></script>
<script src="<%=Const.ROOT%>managers/js/rickshaw.js"></script>
<script src="<%=Const.ROOT%>managers/js/bootstrap.min.js"></script>
</head>
<body>
<div id="wrapper">

     <!-- Navigation -->
	<%@include file="/managers/top.jsp"%>
        <div id="page-wrapper">
			<div class="col-md-12 graphs">
				<div class="xs">
					<h3>新闻列表</h3>
					<div class="tab-pane active" id="horizontal-form">
						<form class="form-horizontal" id="myForm" method="post" action="${pageContext.request.contextPath }/news/getAllNews">
							<input type="hidden" name="pageIndex" id="pageIndex" value="1"/>
							<div class="form-group">
								<label for="title" class="col-sm-1 control-label">标题</label>
								<div class="col-sm-2">
									<input type="text" class="form-control1" name="title"  value="${title}" placeholder="标题">
								</div>
								<div class="col-sm-3">
									<button class="btn-info btn">查询</button> <button type="button" class="btn-primary btn" onclick="add()">增加</button>
								</div>
							</div>
						</form>
					</div>
					<div class="panel panel-warning" data-widget="{&quot;draggable&quot;: &quot;false&quot;}" data-widget-static="">
						<div class="panel-body no-padding">
							<table class="table table-striped">
								<thead>

								<tr class="warning">
									<th>新闻编码</th>
									<th>新闻标题</th>
									<th>新闻图片</th>
									<th>新闻内容</th>
									<th>新闻时间</th>
									<th>操作</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach var="news" items="${requestScope.newss}" varStatus="status">
									<tr>
										<td>
											<span>${news.id}</span>
										</td>
										<td>
											<span>${news.title}</span>
										</td>
										<td>
											<span><img src="<%=Const.ROOT%>managers/images/${news.photo}" style="max-width: 40px"></span>
										</td>
										<td>
											<span>${news.content}</span>
										</td>
										<td>
											<span>${news.ntime}</span>
										</td>
										<td>
											<button type="button" onclick="toupdate('${news.id}')" class="label btn_lg label-primary" style="padding:8px 12px">修改</button>
											<button type="button" onclick="todelete('${news.id}')"  class="label btn_lg label-danger" style="padding:8px 12px">删除</button>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<nav>
								<ul class="pagination">
									<c:if test="${pageInfo.pageNum!=1}">
										<li><a href="javascript:doPage('${pageInfo.prePage}')" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li>
									</c:if>
									<c:if test="${pageInfo.pageNum==1}">
										<li class="disabled"><a href="javascript:doPage('${pageInfo.prePage}')" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li>
									</c:if>
									<c:if test="${pageInfo.pageNum!=pageInfo.pages}">
										<li><a href="javascript:doPage('${pageInfo.nextPage}')" aria-label="Next"><span aria-hidden="true">下一页</span></a></li>
									</c:if>
									<c:if test="${pageInfo.pageNum==pageInfo.pages}">
										<li class="disabled"><a href="javascript:doPage('${pageInfo.nextPage}')" aria-label="Next"><span aria-hidden="true">下一页</span></a></li>
									</c:if>
								</ul>
							</nav>
						</div>
					</div>

					<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h2 class="modal-title">新闻添加</h2>
								</div>
								<div class="modal-body">
									<form  id="add" method="post" enctype="multipart/form-data" action="<%=Const.ROOT%>news/doadd"class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" novalidate="novalidate" ng-submit="submit()">
										<fieldset>
											<div class="form-group">
												<label class="control-label">标题</label>
												<input type="text" class="form-control1 ng-invalid ng-invalid-required ng-touched" name="title" ng-model="model.name" required="">
											</div>
											<div class="form-group">
												<label class="control-label">图片</label>
												<input type="file" class="form-control1 ng-invalid ng-invalid-required ng-touched" name="file" ng-model="model.password" required="">
											</div>
											<div class="form-group">
												<label class="control-label">内容</label>
													<textarea name="content"  rows="4" class="form-control1 ng-invalid ng-invalid-required ng-touched" required=""></textarea>
											</div>
										</fieldset>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" onclick="doadd()">保存</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								</div>
							</div><!-- /.modal-content -->
						</div><!-- /.modal-dialog -->
					</div>

					<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h2 class="modal-title">新闻修改</h2>
								</div>
								<div class="modal-body">
									<form id="update" method="post" enctype="multipart/form-data" action="<%=Const.ROOT%>news/doupdate" class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" novalidate="novalidate" ng-submit="submit()">
										<input type="hidden" name="id" id="id"/>
										<fieldset>
											<div class="form-group">
												<label class="control-label">标题</label>
												<input type="text" class="form-control1 ng-invalid ng-invalid-required ng-touched" id="title" name="title" required="">
											</div>
											<div class="form-group">
												<label class="control-label">图片</label>
												<input type="file" class="form-control1 ng-invalid ng-invalid-required ng-touched"  id="file"  name="file" ng-model="model.password" required="">
											</div>
											<div class="form-group">
												<label class="control-label">内容</label>
												<textarea name="content" id="content" rows="4" class="form-control1 ng-invalid ng-invalid-required ng-touched" required=""></textarea>
											</div>
										</fieldset>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" onclick="doupdate()">保存</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								</div>
							</div><!-- /.modal-content -->
						</div><!-- /.modal-dialog -->
					</div>

					<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h2 class="modal-title">删除</h2>
								</div>
								<div class="modal-body">
									是否删除？
									<input type="hidden" id="uid"/>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger" onclick="dodelete()">确定</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								</div>
							</div><!-- /.modal-content -->
						</div><!-- /.modal-dialog -->
					</div>



				</div>
				<div class="copy_layout">
					 
				</div>
			</div>

		</div>
      <!-- /#page-wrapper -->

	<!-- Navigation -->

	<!-- /#page-wrapper -->

</div>
    <!-- /#wrapper -->
    <!-- Bootstrap Core JavaScript -->

<script>

    function doPage(page){
        $("#pageIndex").val(page);
        $("#myForm").submit();
    }

    function add(){
        $("#addModal").modal("show");
    }
    function doadd(){
        $("#add").submit();
    }

    function toupdate(id){
        $.getJSON("${pageContext.request.contextPath }/news/toupdate",{id:id},function(data){
            $("#updateModal #id").val(id);
            $("#updateModal #title").val(data.title);
            $("#updateModal #content").val(data.content);
            $("#updateModal").modal("show");
        });
    }

    function doupdate() {
		$("#update").submit();
    }

    function todelete(id){
        $("#deleteModal #uid").val(id);
        $("#deleteModal").modal("show");
    }

    function dodelete(){
        var id=$("#deleteModal #uid").val();
        $.getJSON("${pageContext.request.contextPath }/news/delete",{id:id},function(data){
            if(data>0){
                location.href="${pageContext.request.contextPath }/news/getAllNews";
			}
        });
    }
</script>
</body>
</html>
