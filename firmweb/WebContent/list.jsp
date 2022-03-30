<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="cn.tool.Const" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE HTML>
<html>
<head>
<script id="allmobilize" charset="utf-8" src="<%=Const.ROOT%>style/js/allmobilize.min.js"></script>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate" media="handheld"  />
<!-- end 云适配 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><s:message code="top.foreign"/></title>
<script type="text/javascript">
var ctx = "h";
console.log(1);
</script>
<link rel="Shortcut Icon" href="http://www.lagou.com/h/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="<%=Const.ROOT%>style/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=Const.ROOT%>style/css/external.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=Const.ROOT%>style/css/popup.css"/>
<script src="<%=Const.ROOT%>style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=Const.ROOT%>style/js/jquery.lib.min.js"></script>
<script src="<%=Const.ROOT%>style/js/ajaxfileupload.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=Const.ROOT%>style/js/additional-methods.js"></script>
<!--[if lte IE 8]>
    <script type="text/javascript" src="<%=Const.ROOT%>style/js/excanvas.js"></script>
<![endif]-->
<script type="text/javascript" src="<%=Const.ROOT%>style/js/conv.js"></script>



</head>
<body>
<div id="body">
	<%@include file="/top.jsp"%>
    <div id="container">
       	<div class="sidebar">
			<div id="options" class="greybg">
			<c:forEach var="notice" items="${requestScope.notices}" varStatus="status">
				<dl>
                   	<dt>${notice.title}<em ></em></dt>
	                <dd>
						<div>${notice.content}</div>
						<div>${notice.ntime}</div>
					</dd>
                </dl>
			</c:forEach>
						</div>
        </div>
        
        <div class="content">
        	<div id="search_box">
		<form action="<%=Const.ROOT%>panduan/queryPostFirm" method="post">
			<ul id="searchType">
				<li data-searchtype="1" class="type_selected"><s:message code="list.message1"/></li>
				<li data-searchtype="4"><s:message code="list.message2"/></li>
			</ul>
			<div class="searchtype_arrow"></div>

        <input type="text" id="search_input" name = "kd"  tabindex="1" value=""  placeholder="<s:message code="addcreate.message3"/>"  />
        <input type="hidden" name="spc" id="spcInput" value="1"/>
		<input type="submit" id="search_button" value="<s:message code="search"/>" />
        </form>
</div>
<style>
.ui-autocomplete{width:488px;background:#fafafa !important;position: relative;z-index:10;border: 2px solid #91cebe;}
.ui-autocomplete-category{font-size:16px;color:#999;width:50px;position: absolute;z-index:11; right: 0px;/*top: 6px; */text-align:center;border-top: 1px dashed #e5e5e5;padding:5px 0;}
.ui-menu-item{ *width:439px;vertical-align: middle;position: relative;margin: 0px;margin-right: 50px !important;background:#fff;border-right: 1px dashed #ededed;}
.ui-menu-item a{display:block;overflow:hidden;}
</style>
<script type="text/javascript" src="<%=Const.ROOT%>style/js/search.min.js"></script>
			<div class="breakline"></div>
			<br>
			<div id="tet">
			<c:forEach var="post" items="${requestScope.pageInfo.list}" varStatus="status">
			     <form action="<%=Const.ROOT%>deliver/doadd" method="post">
            	            <ul class="hot_pos reset">
								<li class="odd clearfix">
									<div class="hot_pos_l">
			                        <div class="mb10">
			                            <a href="javascript:void(0)" style="text-decoration:none">${post.post}</a>
									</div>
			                        <span><em class="c7"><s:message code="list.message3"/>：</em>${post.salary}</span>
			                        <span><em class="c7"><s:message code="list.message4"/>：</em> ${post.num}</span>
										<br />
			                        <span><em class="c7"><s:message code="list.message5"/>： </em>${post.education}</span>

			                    </div> 
						        <div class="hot_pos_r">
						        <c:if test="${sessionScope.role==0}">
			                        <div class="apply">
			                        <a href="javascript:void(0)" target="_blank"  onclick="toudi(this)" id="add"><s:message code="list.message6"/></a>
									</div>
								</c:if>
			                        <div class="mb10"><a href="javascript:void(0)" style="text-decoration:none">${post.firm}</a>  </div>
			                        <span><em class="c7"><s:message code="list.message7"/>： </em>${post.name}</span>
									<span><em class="c7"><s:message code="list.message8"/>：</em> ${post.phone}</span>
									<br />
			                        <span><em class="c7"><s:message code="list.message9"/>： </em>${post.address}</span>
			                        <span><em class="c7"><s:message code="list.message10"/>： </em>${post.email}</span>
			                    </div>
			                 </li>
							</ul>
						 <input type="hidden" value="${post.id}" name="pid">
						 <input type="hidden" value="${sessionScope.user.id}" name="uid">
				 </form>
			</c:forEach>
			</div>
			<div class="Pagination myself">
				<c:if test="${pageInfo.pageNum!=1}">
					<a href="<%=Const.ROOT%>panduan/getNotice?pageNum=${pageInfo.firstPage}" class="current" title="1"><s:message code="list.message11"/></a>
				</c:if>
				<c:if test="${pageInfo.pageNum==1}">
					<a href="javascript:void(0);"><s:message code="list.message11"/></a>
				</c:if>
				<c:if test="${pageInfo.pageNum!=1}">
					<a href="<%=Const.ROOT%>panduan/getNotice?pageNum=${pageInfo.prePage}" class="current" ><s:message code="list.message12"/> </a>
				</c:if>
				<c:if test="${pageInfo.pageNum==1}">
					<a href="javascript:void(0);"> <s:message code="list.message12"/></a>
				</c:if>
				<c:forEach items="${pageInfo.navigatepageNums}" var="i">
					<c:if test="${pageInfo.pageNum==i}">
						<a href="javascript:void(0);" title="2" class="current">${i}</a>
					</c:if>
					<c:if test="${pageInfo.pageNum!=i}">
						<a href="<%=Const.ROOT%>panduan/getNotice?pageNum=${i}">${i}</a>
					</c:if>
				</c:forEach>
				<c:if test="${pageInfo.pageNum!=pageInfo.pages}">
					<a href="<%=Const.ROOT%>panduan/getNotice?pageNum=${pageInfo.nextPage}" class="current"><s:message code="list.message13"/> </a>
				</c:if>
				<c:if test="${pageInfo.pageNum==pageInfo.pages}">
					<a href="javascript:void(0);"><s:message code="list.message13"/></a>
				</c:if>
				<c:if test="${pageInfo.pageNum!=pageInfo.pages}">
					<a href="<%=Const.ROOT%>panduan/getNotice?pageNum=${pageInfo.lastPage}" class="current" title="30"><s:message code="list.message14"/></a>
				</c:if>
				<c:if test="${pageInfo.pageNum==pageInfo.pages}">
					<a href="javascript:void(0);" title="30"><s:message code="list.message14"/></a>
				</c:if>
			</div>
			</div>

		</div>

<script>
function toudi(th) {
	if(confirm("<s:message code='list.message15'/>")){
		$(th).parent().parent().parent().parent().parent().submit();
	}
}
$(function(){

	$(".workplace dd").not('.more').children('a').click(function(){
		$('#lc').val(1);
		editForm("cityInput" , $(this).html());
	});
	
	$("#box_expectCity dd span").click(function(){
		$('#lc').val(1);
		editForm("cityInput" , $(this).html());
	});
	
	$('#options dd div').click(function(){
		var firstName = $(this).parents('dl').children('dt').text();
		var fn = $.trim(firstName);
		if (fn=="<s:message code='list.message16'/>"){
			editForm("yxInput" , $(this).html());
		}
		else if(fn=="<s:message code='list.message17'/>"){
			editForm("gjInput" , $(this).html());
		}
		else if(fn=="<s:message code='list.message18'/>"){
			editForm("xlInput" , $(this).html());
		}
		else if(fn=="<s:message code='list.message19'/>"){
			editForm("gxInput" , $(this).html());
		}
		else if(fn=="<s:message code='list.message20'/>"){
			editForm("stInput" , $(this).html());
		}
	});
	
	$('#selected ul').delegate('li span.select_remove','click',function(event){
		var firstName = $(this).parent('li').find('strong').text();
		var fn = $.trim(firstName);
		if (fn=="<s:message code='list.message16'/>")
			editForm("yxInput" , "");
		else if(fn=="<s:message code='list.message17'/>")
			editForm("gjInput" , "");
		else if(fn=="<s:message code='list.message18'/>")
			editForm("xlInput" , "");
		else if(fn=="<s:message code='list.message19'/>")
			editForm("gxInput" , "");
		else if(fn=="<s:message code='list.message20'/>")
			editForm("stInput" , "");
	});
	
	/* search结果飘绿	*/
	(function($) {
		var searchVal = $('#search_input').val();
		var reg = /\s/g;     
		searchVal = searchVal.replace(reg, "").split(""); 
		
		var resultL = '';
		var resultR = '';
		$('.hot_pos li').each(function(){
			resultL = $('.hot_pos_l a',this).text().split("");
			$.each(resultL,function(i,v){
				if($.inArray(v.toLowerCase(),searchVal) != -1 || $.inArray(v.toUpperCase(),searchVal) != -1){
					resultL[i] = '<span>'+ v +'</span>';
				}
			});
			$('.hot_pos_l a',this).html(resultL.join(''));
			
			resultR = $('.hot_pos_r .mb10 a',this).text().split("");
			$.each(resultR,function(i,v){
				if($.inArray(v.toLowerCase(),searchVal) != -1 || $.inArray(v.toUpperCase(),searchVal) != -1){
					resultR[i] = '<span>'+ v +'</span>';
				}
			});
			$('.hot_pos_r .mb10 a',this).html(resultR.join(''));
		});
		
	})(jQuery);
	
	//didi tip
   	if($.cookie('didiTip') != 1 && false){
		$('#tip_didi').show();
	}
	$('#tip_didi a').click(function(){
		$(this).parent().remove();
		$.cookie('didiTip',1,{ expires: 30, path: '/'});
	});
	
});

function editForm(inputId,inputValue){
	$("#"+inputId).val(inputValue);
	var keyword = $.trim($('#search_input').val());
	var reg =  /[`~!@\$%\^\&\*\(\)_<>\?:"\{\},\\\/;'\[\]]/ig;
	var re = /#/g;
	var r = /\./g;
	var kw = keyword.replace(reg," ");

	if(kw == ''){
		$('#searchForm').attr('action','list.html所有职位').submit();	
	}else{
		kw = kw.replace(re,'井');
		kw = kw.replace(r,'。');
		$('#searchForm').attr('action','list.html'+kw).submit();
	}
	//$("#searchForm").submit();
}
</script>

			<div class="clear"></div>
			<input type="hidden" id="resubmitToken" value="" />
	    	<a id="backtop" title="<s:message code="addcreate.message18"/>" rel="nofollow"></a>
	    </div><!-- end #container -->
	</div><!-- end #body -->

<script type="text/javascript" src="<%=Const.ROOT%>style/js/core.min.js"></script>
<script type="text/javascript" src="<%=Const.ROOT%>style/js/popup.min.js"></script>

<!--  -->

</body>
</html>