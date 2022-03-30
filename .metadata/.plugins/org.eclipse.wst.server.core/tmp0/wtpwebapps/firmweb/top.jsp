<%@ page import="cn.tool.Const" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<div id="header">
    <div class="wrapper">
        <a href="javascript:void(0)" class="logo">
            <!--  <div style="font-size:15px;padding-top: 5px"><s:message code="top"/></div>-->
            <div style="font-size:15px;padding-top: 5px">大学生兼职招聘网站</div>
        </a>
        <ul class="reset" id="navheader">
            <li ><a href="<%=Const.ROOT%>panduan/getNotice"><s:message code="top.index"/></a></li>
            <li ><a href="<%=Const.ROOT%>news/getNews"><s:message code="top.message1"/></a></li>
            <li ><a href="<%=Const.ROOT%>note/getNote"><s:message code="top.message2"/></a></li>
            <c:if test="${sessionScope.role==0}">
            <li ><a href="<%=Const.ROOT%>user/toupdate?id=${user.id}" rel="nofollow"><s:message code="top.message3"/></a></li>
            </c:if>
            <c:if test="${sessionScope.role==1}">
            <li ><a href="<%=Const.ROOT%>post/getPost" rel="nofollow"><s:message code="top.message4"/></a></li>
            </c:if>
            <li><a href="<%=Const.ROOT%>managers/login.jsp"  target="_blank"><s:message code="top.message5"/></a></li>
        </ul>
        <ul class="loginTop">
            <c:if test="${not empty sessionScope.user}">
                <li><a href="javascript:void(0);"><s:message code="top.message6"/>，${user.name}</a></li>
                <li>|</li>
                <li><a href="javascript:logout()"><s:message code="top.message7"/></a></li>
            </c:if>
            <c:if test="${empty sessionScope.user}">
            <li><a href="<%=Const.ROOT%>user/tologin" rel="nofollow"><s:message code="top.message8"/></a></li>
            </c:if>
           
        </ul>
    </div>
</div><!-- end #header -->
<script>
function logout(){
	if(confirm('是否退出?')){
		location.href="<%=Const.ROOT%>panduan/logout";
	}
}
</script>