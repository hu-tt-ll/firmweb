<%@ page import="cn.tool.Const" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<div class="sidebar">
    <c:if test="${sessionScope.role==0}">
    <a class="btn_create" href="<%=Const.ROOT%>note/toAdd"><s:message code="leftthree.message1"/></a>
    </c:if>

    <dl class="company_center_aside">
        <dt><s:message code="leftthree.message2"/></dt>
        <dd>
            <a href="<%=Const.ROOT%>note/getNote"><s:message code="leftthree.message3"/></a>
        </dd>
            <c:if test="${sessionScope.role==0}">
        <dd>
            <a href="<%=Const.ROOT%>reply/getNoteReply"><s:message code="leftthree.message4"/></a>
        </dd>
            </c:if>
    </dl>
</div><!-- end .sidebar -->