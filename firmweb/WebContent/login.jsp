<%@ page import="cn.tool.Const" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE HTML>
<html>
<head>
<script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate" media="handheld"  />
<!-- end 云适配 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><s:message code="top.foreign"/></title>

<meta name="baidu-site-verification" content="QIQ6KC1oZ6" />

<script type="text/javascript">
var ctx = "h";
console.log(1);
</script>
<link rel="Shortcut Icon" href="h/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="<%=Const.ROOT%>style/css/style.css"/>

<script src="<%=Const.ROOT%>style/js/jquery.1.10.1.min.js" type="text/javascript"></script>

<script type="text/javascript" src="<%=Const.ROOT%>style/js/jquery.lib.min.js"></script>
<script type="text/javascript" src="<%=Const.ROOT%>style/js/core.min.js"></script>

<script type="text/javascript" src="<%=Const.ROOT%>style/js/conv.js"></script>

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

<body id="login_bg">
	<div class="login_wrapper">
		<div class="login_header">
			<!--  <h1><div width="285" height="62" style="color: #b81900"><s:message code="top.foreign"/></div></h1>-->
			<h1><div width="285" height="62" style="color: #b81900">大学生兼职招聘网站</div></h1>
            <div id="cloud_s"><img src="<%=Const.ROOT%>style/images/cloud_s.png" width="81" height="52" alt="cloud" /></div>
            <div id="cloud_m"><img src="<%=Const.ROOT%>style/images/cloud_m.png" width="136" height="95"  alt="cloud" /></div>
        </div>
        
    	<input type="hidden" id="resubmitToken" value="" />		
		 <div class="login_box">
        	<form id="loginForm" method="post" action="${pageContext.request.contextPath }/panduan/login">
				<input type="text" id="email" name="name" value="" tabindex="1" placeholder="<s:message code="login.message1"/>" required=""/>
			  	<input type="password" id="password" name="password" tabindex="2" placeholder="<s:message code="login.message2"/>" required=""/>
				<div style="margin-bottom:20px;">
				<select name="role">
					<option value="0"><s:message code="login.message3"/></option>
					<option value="1"><s:message code="login.message4"/></option>
				</select>
				</div>
				<a style="color:#fff;" href="javascript:void(0)"  onclick="dosubmit()" class="submitLogin" title="<s:message code="login.message5"/>"/><s:message code="login.message5"/></a>
			</form>
			<div class="login_right">
				<div><s:message code="login.message6"/>？</div>
				<button type="button" class="btn-primary btn" onclick="add()"><s:message code="login.message7"/></button>
			</div>
			 <div class="login_right">
				 <button type="button" class="btn-primary btn" onclick="add2()"><s:message code="login.message8"/></button>
			 </div>
        </div>
        <div class="login_box_btm"></div>
    </div>

	<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<form  id="add" action="<%=Const.ROOT%>user/doadd" method="post" enctype="multipart/form-data">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h2 class="modal-title"><s:message code="login.message11"/></h2>
				</div>
				<div class="modal-body">
					<fieldset>
							<div class="form-group">
								<label class="control-label"><s:message code="login.message9"/></label>
								<input type="text" class="form-control1 "  style="margin:5px;width: 560px" name="username"  required onblur="checkname()" id="auname">
							</div>
							<div class="form-group">
								<label class="control-label"><s:message code="login.message10"/></label>
								<input type="password" class="form-control1" name="password"    style="margin:5px;width: 560px" required>
							</div>
							<div class="form-group">
								<label class="control-label"><s:message code="jianli.message3"/></label>
								<input type="text" class="form-control1 " name="name"   style="margin:5px;width: 560px" required>
							</div>
							<div class="form-group filled">
								<label class="control-label"><s:message code="login.message12"/></label>
								<select class="form-control1 "  required style="margin:5px;width: 560px" name="sex"><option value="? undefined:undefined ?"></option>
									<option value="<s:message code="jianli.message4"/>"><s:message code="jianli.message4"/></option>
									<option value="<s:message code="jianli.message5"/>"><s:message code="jianli.message5"/></option>
								</select>
							</div>
							<div class="form-group">
								<label class="control-label"><s:message code="jianli.message7"/></label>
								<input type="text" class="form-control1 " name="phone"  style="margin:5px;width: 560px" required pattern="^[1][0-9]{10}$">
							</div>
							<div class="form-group">
								<label class="control-label"><s:message code="jianli.message8"/></label>
								<input type="email" class="form-control1 " name="email" style="margin:5px;width: 560px" required pattern="^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$">
							</div>
							<div class="form-group">
								<label class="control-label"><s:message code="jianli.message6"/></label>
								<input type="text" class="form-control1" name="major"  style="margin:5px;width: 560px" required>
							</div>
							<div class="form-group">
								<label class="control-label"><s:message code="jianli.message9"/></label>
								<input type="text" class="form-control1" name="place" style="margin:5px;width: 560px" required>
							</div>
							<div class="form-group filled">
								<label class="control-label"><s:message code="login.message13"/></label>
								<select class="form-control1 "  required style="margin:5px;width: 560px" name="education"><option value="? undefined:undefined ?"></option>
									<option value="<s:message code="addcreate.message10"/>"><s:message code="addcreate.message10"/></option>
									<option value="<s:message code="addcreate.message11"/>"><s:message code="addcreate.message11"/></option>
									<option value="<s:message code="addcreate.message12"/>"><s:message code="addcreate.message12"/></option>
									<option value="<s:message code="addcreate.message13"/>"><s:message code="addcreate.message13"/></option>
									<option value="<s:message code="addcreate.message14"/>"><s:message code="addcreate.message14"/></option>
									<option value="<s:message code="addcreate.message15"/>"><s:message code="addcreate.message15"/></option>
									<option value="<s:message code="addcreate.message16"/>"><s:message code="addcreate.message16"/></option>
								</select>
							</div>
							<div class="form-group">
								<label class="control-label"><s:message code="login.message14"/></label>
								<input type="file" class="form-control1" style="margin:5px;width: 560px" name="file" required>
							</div>
							<div class="form-group">
								<label class="control-label"><s:message code="login.message15"/></label>
								<textarea name="remark"  rows="4" style="margin:5px;width: 560px" class="form-control1"></textarea>
							</div>
						</fieldset>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" ><s:message code="login.message16"/></button>
					<button type="button" class="btn btn-default" data-dismiss="modal"><s:message code="login.message17"/></button>
				</div>
			</div><!-- /.modal-content -->
			</form>
		</div><!-- /.modal-dialog -->
	</div>

	<div class="modal fade" id="addModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<form   action="<%=Const.ROOT%>firm/doadd" method="post" enctype="multipart/form-data">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h2 class="modal-title"><s:message code="login.message18"/></h2>
					</div>
					<div class="modal-body">
						<fieldset>
							<div class="form-group">
								<label class="control-label"><s:message code="login.message19"/></label>
								<input type="text" class="form-control1 "  style="margin:5px;width: 560px" name="firmid"  required>
							</div>
							<div class="form-group">
								<label class="control-label"><s:message code="login.message10"/></label>
								<input type="password" class="form-control1" name="password" style="margin:5px;width: 560px" required>
							</div>
							<div class="form-group">
								<label class="control-label"><s:message code="login.message20"/></label>
								<input type="text" class="form-control1" name="firm" style="margin:5px;width: 560px" required>
							</div>
							<div class="form-group">
								<label class="control-label"><s:message code="list.message7"/></label>
								<input type="text" class="form-control1 " name="name"   style="margin:5px;width: 560px" required>
							</div>
							<div class="form-group">
								<label class="control-label"><s:message code="list.message8"/></label>
								<input type="text" class="form-control1 " name="phone"  style="margin:5px;width: 560px" required pattern="^[1][0-9]{10}$">
							</div>
							<div class="form-group">
								<label class="control-label"><s:message code="list.message9"/></label>
								<input type="text" class="form-control1" name="address"  style="margin:5px;width: 560px" required>
							</div>
							<div class="form-group">
								<label class="control-label"><s:message code="list.message10"/></label>
								<input type="email" class="form-control1 " name="email" style="margin:5px;width: 560px" required pattern="^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$">
							</div>
						</fieldset>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary" ><s:message code="login.message16"/></button>
						<button type="button" class="btn btn-default" data-dismiss="modal"><s:message code="login.message17"/></button>
					</div>
				</div><!-- /.modal-content -->
			</form>
		</div><!-- /.modal-dialog -->
	</div>

<script type="text/javascript">
    function add(){
        $("#addModal").modal("show");
    }

    function add2(){
        $("#addModa2").modal("show");
    }
    function dosubmit(){
        $("#loginForm").submit();
    }
    function checkname(){
    	  $.getJSON("<%=Const.ROOT%>user/exists",{"username":$("#auname").val()},function(data){
              if(data){
                  alert("该用户名已经存在");
              }
          });
    }

</script>
</body>
</html>