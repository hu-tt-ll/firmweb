<%@ page import="cn.tool.Const" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<div class="sidebar">
    <dl class="company_center_aside">
        <dt><s:message code="lefttwo.message1"/></dt>
        <dd>
            <a href="<%=Const.ROOT%>user/toupdate?id=${user.id}"><s:message code="lefttwo.message2"/></a>
        </dd>
        <dd>
            <a href="<%=Const.ROOT%>deliver/getUserDeliver"><s:message code="lefttwo.message3"/></a>
        </dd>
    </dl>


</div><!-- end .sidebar -->