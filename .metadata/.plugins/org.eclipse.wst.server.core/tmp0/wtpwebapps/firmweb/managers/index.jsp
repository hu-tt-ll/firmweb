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
					<h3>管理员列表</h3>
					<div class="tab-pane active" id="horizontal-form">
						<form class="form-horizontal" id="myForm" method="post" action="${pageContext.request.contextPath }/admin/select">
							<input type="hidden" name="pageIndex" id="pageIndex" value="1"/>
							<div class="form-group">
								<label for="queryname" class="col-sm-1 control-label">用户名</label>
								<div class="col-sm-2">
									<input type="text" class="form-control1" name="username" id="queryname" value="${username}" placeholder="用户名">
								</div>
								<%--<label for="queryUserRole" class="col-sm-1 control-label">身份</label>--%>
								<%--<div class="col-sm-2"><select name="queryUserRole" id="queryUserRole" class="form-control1">--%>
									<%--<c:if test="${roleList != null }">--%>
										<%--<option value="0">--请选择--</option>--%>
										<%--<c:forEach var="role" items="${roleList}">--%>
											<%--<option <c:if test="${role.id == queryUserRole }">selected="selected"</c:if>--%>
											<%--value="${role.id}">${role.roleName}</option>--%>
										<%--</c:forEach>--%>
									<%--</c:if>--%>
								<%--</select></div>--%>
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
									<th>管理员编码</th>
									<th>管理员名称</th>
									<th>操作</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach var="manager" items="${requestScope.managers}" varStatus="status">
									<tr>
										<td>
											<span>${manager.id}</span>
										</td>
										<td>
											<span>${manager.username}</span>
										</td>
										<td>

											<button type="button" onclick="toupdate('${manager.id}')" class="label btn_lg label-primary" style="padding:8px 12px">修改</button>
											<button type="button" onclick="todelete('${manager.id}')"  class="label btn_lg label-danger" style="padding:8px 12px">删除</button>
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
									<h2 class="modal-title">管理员添加</h2>
								</div>
								<div class="modal-body">
									<form  id="add" method="post"  action="<%=Const.ROOT%>admin/doadd"class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" novalidate="novalidate" ng-submit="submit()">
										<fieldset>
											<div class="form-group">
												<label class="control-label">管理员名</label>
												<input type="text" class="form-control1 ng-invalid ng-invalid-required ng-touched" name="username" ng-model="model.name" required="">
											</div>
											<div class="form-group">
												<label class="control-label">密码</label>
												<input type="password" class="form-control1 ng-invalid ng-invalid-required ng-touched" name="password" ng-model="model.password" required="">
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
									<h2 class="modal-title">管理员修改</h2>
								</div>
								<div class="modal-body">
									<form id="update" action="<%=Const.ROOT%>admin/doupdate" method="post" class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" novalidate="novalidate" ng-submit="submit()">
										<input type="hidden" name="id" id="id"/>
										<fieldset>
											<div class="form-group">
												<label class="control-label">管理员名</label>
												<input type="text" class="form-control1 ng-invalid ng-invalid-required ng-touched" id="userName" name="username" required="">
											</div>
											<div class="form-group">
												<label class="control-label">密码</label>
												<input type="text" class="form-control1 ng-invalid ng-invalid-required ng-touched" id="password" name="password" ng-model="model.password" required="">
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
        $.getJSON("${pageContext.request.contextPath }/admin/toupdate",{id:id},function(data){
            $("#updateModal #id").val(id);
            $("#updateModal #userName").val(data.username);
            $("#updateModal #password").val(data.password);
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
        //location.href="${pageContext.request.contextPath }/user/delete/id";
        $.getJSON("${pageContext.request.contextPath }/admin/delete",{id:id},function(data){
            if(data>0){
                location.href="${pageContext.request.contextPath }/admin/select";
			}
        });
    }
</script>
</body>
</html>
