<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ page import="cn.tool.Const" %>
<!DOCTYPE HTML>
<head>
</script><script type="text/javascript" async="" src="<%=Const.ROOT%>style/js/conversion.js"></script><script src="<%=Const.ROOT%>style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script><style type="text/css"></style>
<meta content="no-siteapp" http-equiv="Cache-Control">
<link  media="handheld" rel="alternate">
<!-- end 云适配 -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title><s:message code="jianli.message1"/></title>
<script type="text/javascript">
var ctx = "h";
console.log(1);
</script>
<link href="<%=Const.ROOT%>h/images/favicon.ico" rel="Shortcut Icon">
<link href="<%=Const.ROOT%>style/css/style.css" type="text/css" rel="stylesheet">
<link href="<%=Const.ROOT%>style/css/external.min.css" type="text/css" rel="stylesheet">
<link href="<%=Const.ROOT%>style/css/popup.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=Const.ROOT%>style/js/jquery.1.10.1.min.js"></script>
<script src="<%=Const.ROOT%>style/js/jquery.lib.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=Const.ROOT%>style/js/ajaxfileupload.js"></script>
<script src="<%=Const.ROOT%>style/js/additional-methods.js" type="text/javascript"></script>
<!--[if lte IE 8]>
    <script type="text/javascript" src="<%=Const.ROOT%>style/js/excanvas.js"></script>
<![endif]-->
<script src="<%=Const.ROOT%>style/js/conv.js" type="text/javascript"></script>
<script src="<%=Const.ROOT%>style/js/ajaxCross.json" charset="UTF-8"></script></head>
<body>
<div id="body">
	<%@include file="/top.jsp"%>
    <div id="container">
  		<div class="clearfix">
            <div class="content_l">
            	<div class="profile_box" id="basicInfo">
            		<h2><s:message code="jianli.message2"/></h2>
            		<span class="c_edit"></span>
            		<div class="basicShow">
            			            			<span>${user.name}| ${user.sex}  |    ${user.education} |  ${user.major}<br>
            			            			${user.phone}| ${user.email}<br>
            			</span>

            		</div><!--end .basicShow-->

            		<div class="basicEdit dn">
            			<form id="profileForm" action="<%=Const.ROOT%>user/doupdate" method="post" enctype="multipart/form-data" onsubmit="return confirm('是否保存?')">
						  <table>
							  <input type="hidden"  name="id" value="${user.id}">
							  <tbody><tr>
						      <td valign="top">
						        <span class="redstar">*</span>
						      </td> 
						      <td>
						        <input type="text" placeholder="<s:message code="jianli.message3"/>" value="jason" name="name" id="name">
						      </td>
						      <td valign="top"></td> 
						      <td>
						          <ul class="profile_radio clearfix reset">
						            <li class="current">
						           	  	 <s:message code="jianli.message4"/><em></em>
						              	<input type="radio" checked="checked" name="sex" value="<s:message code="jianli.message4"/>">
						            </li>
						            <li>
						            	 <s:message code="jianli.message5"/><em></em>
						              	<input type="radio" name="sex" value="<s:message code="jianli.message5"/>">
						            </li>
						          </ul>  
						      </td>
						    </tr>
						    <tr>
						      <td valign="top">
						        <span class="redstar">*</span>
						      </td> 
						      <td>
						      	<input type="hidden" id="topDegree" value="<s:message code="addcreate.message13"/>" name="education">
						        <input type="button" value="<s:message code="addcreate.message13"/>" id="select_topDegree" class="profile_select_190 profile_select_normal">
								<div class="boxUpDown boxUpDown_190 dn" id="box_topDegree" style="display: none;">
						        	<ul>
										<li><s:message code="addcreate.message10"/></li>
                                            <li><s:message code="addcreate.message11"/></li>
                                            <li><s:message code="addcreate.message12"/></li>
                                            <li><s:message code="addcreate.message13"/></li>
                                            <li><s:message code="addcreate.message14"/></li>
                                            <li><s:message code="addcreate.message15"/></li>
                                            <li><s:message code="addcreate.message16"/></li>
									</ul>
						        </div>  
						      </td>
						      <td valign="top">
						        <span class="redstar">*</span>
						      </td>
								<td>
									<input type="text" id="workyear" value="" name="major" placeholder="<s:message code="jianli.message6"/>">
								</td>
						    </tr>
						    <tr>
						      <td valign="top">
						        <span class="redstar">*</span>
						      </td> 
						      <td colspan="3">
						          <input type="text" placeholder="<s:message code="jianli.message7"/>" value="18644444444" name="phone" id="tel">
						      </td>
						   	</tr>
						   	<tr>
						      <td valign="top">
						        <span class="redstar">*</span>
						      </td> 
						      <td colspan="3">
						          <input type="text" placeholder="<s:message code="jianli.message8"/>" value="jason@qq.com" name="email" id="email">
						      </td>
						    </tr>
						    <tr>
						      <td valign="top">
								  <span class="redstar">*</span>
							  </td>
						      <td colspan="3">
						          <input type="text" id="currentState"  value="" name="place" placeholder="<s:message code="jianli.message9"/>">
						      </td>
						    </tr>
						    <tr>
						      <td></td> 
						      <td colspan="3">
						          <input type="submit"  value="<s:message code="jianli.message10"/>"  class="btn_profile_save">
						          <a class="btn_profile_cancel" href="javascript:;"><s:message code="jianli.message11"/></a>
						      </td>
						    </tr>
						  </tbody></table>
						</form><!--end #profileForm-->
            		</div><!--end .basicEdit-->
            		<input type="hidden" id="nameVal" value="${user.name}">
            		<input type="hidden" id="genderVal" value="${user.sex}">
            		<input type="hidden" id="topDegreeVal" value="${user.education}">
            		<input type="hidden" id="workyearVal" value="${user.major}">
            		<input type="hidden" id="currentStateVal" value="${user.place}">
            		<input type="hidden" id="emailVal" value="${user.email}">
            		<input type="hidden" id="telVal" value="${user.phone}">

            	</div><!--end #basicInfo-->


			</div><!--end .content_l-->
            <div class="content_r">
				<div class="mycenterR" id="myResume">
            		<h2><s:message code="jianli.message12"/>
						<form action="<%=Const.ROOT%>user/jianli" method="post" enctype="multipart/form-data" onsubmit="return check()">
						<input type="hidden"  name="id" value="${user.id}">
						<input type="file" name="file" id="file">
						<input type="submit"  value="<s:message code="jianli.message10"/>" >
						</form>
					</h2>
            		<div class="resumeUploadDiv">
						${user.resume}
					</div>
					
            	</div><!--end #myResume-->
				<%@include file="/lefttwo.jsp"%>
            </div><!--end .content_r-->
        </div>
        <script>
        	function check(){
            	if($("#file").val()==""){
                	alert("请选择简历");
                	return false;
            	}
            	return true;
        	}
        </script>


<script src="<%=Const.ROOT%>style/js/Chart.min.js" type="text/javascript"></script>
<script src="<%=Const.ROOT%>style/js/profile.min.js" type="text/javascript"></script>
<!-- <div id="profileOverlay"></div> -->
<div class="" id="qr_cloud_resume" style="display: none;">
	<div class="cloud">
		<img width="134" height="134" src="">
		<a class="close" href="javascript:;"></a>
	</div>
</div>
<script>
$(function(){
	$.ajax({
        url:ctx+"/mycenter/showQRCode",
        type:"GET",
        async:false
   	}).done(function(data){
        if(data.success){
             $('#qr_cloud_resume img').attr("src",data.content);
        }
   	});
	var sessionId = "resumeQR"+314873;
	if(!$.cookie(sessionId)){
		$.cookie(sessionId, 0, {expires: 1});
	}
	if($.cookie(sessionId) &amp;&amp; $.cookie(sessionId) != 5){
		$('#qr_cloud_resume').removeClass('dn');
	}
	$('#qr_cloud_resume .close').click(function(){
		$('#qr_cloud_resume').fadeOut(200);
		resumeQR = parseInt($.cookie(sessionId)) + 1;
		$.cookie(sessionId, resumeQR, {expires: 1});
	});
});
window.onbeforeunload=function(){
	return null;
}
</script>
			<div class="clear"></div>
			<input type="hidden" value="97fd449bcb294153a671f8fe6f4ba655" id="resubmitToken">
	    	<a rel="nofollow" title="<s:message code="addcreate.message18"/>" id="backtop" style="display: none;"></a>
	    </div><!-- end #container -->
	</div><!-- end #body -->


<script src="<%=Const.ROOT%>style/js/core.min.js" type="text/javascript"></script>
<script src="<%=Const.ROOT%>style/js/popup.min.js" type="text/javascript"></script>

<!--  -->

<script type="text/javascript">
$(function(){
	$('#noticeDot-1').hide();
	$('#noticeTip a.closeNT').click(function(){
		$(this).parent().hide();
	});
});
var index = Math.floor(Math.random() * 2);
var ipArray = new Array('42.62.79.226','42.62.79.227');
var url = "ws://" + ipArray[index] + ":18080/wsServlet?code=314873";
var CallCenter = {
		init:function(url){
			var _websocket = new WebSocket(url);
			_websocket.onopen = function(evt) {
				console.log("Connected to WebSocket server.");
			};
			_websocket.onclose = function(evt) {
				console.log("Disconnected");
			};
			_websocket.onmessage = function(evt) {
				//alert(evt.data);
				var notice = jQuery.parseJSON(evt.data);
				if(notice.status[0] == 0){
					$('#noticeDot-0').hide();
					$('#noticeTip').hide();
					$('#noticeNo').text('').show().parent('a').attr('href',ctx+'/mycenter/delivery.html');
					$('#noticeNoPage').text('').show().parent('a').attr('href',ctx+'/mycenter/delivery.html');
				}else{
					$('#noticeDot-0').show();
					$('#noticeTip strong').text(notice.status[0]);
					$('#noticeTip').show();
					$('#noticeNo').text('('+notice.status[0]+')').show().parent('a').attr('href',ctx+'/mycenter/delivery.html');
					$('#noticeNoPage').text(' ('+notice.status[0]+')').show().parent('a').attr('href',ctx+'/mycenter/delivery.html');
				}
				$('#noticeDot-1').hide();
			};
			_websocket.onerror = function(evt) {
				console.log('Error occured: ' + evt);
			};
		}
};
CallCenter.init(url);
</script>

<div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div></body></html>