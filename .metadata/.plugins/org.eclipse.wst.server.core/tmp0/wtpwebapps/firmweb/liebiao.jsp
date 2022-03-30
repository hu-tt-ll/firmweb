<%@ page import="cn.tool.Const" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE HTML>
<head>
    <script type="text/javascript" async="" src="<%=Const.ROOT%>style/js/conversion.js"></script>
    <script src="<%=Const.ROOT%>style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
    <style type="text/css"></style>
    <meta content="no-siteapp" http-equiv="Cache-Control">
    <link media="handheld" rel="alternate">
    <!-- end 云适配 -->
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title><s:message code="liebiao.message1"/></title>
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
    <script src="<%=Const.ROOT%>style/js/ajaxCross.json" charset="UTF-8"></script>
</head>
<body>
<div id="body">
    <%@include file="/top.jsp" %>
    <div id="container">

        <div class="clearfix">
            <div class="content_l">
                <dl class="c_collections">
                    <dt>
                    <h1><em></em><s:message code="liebiao.message2"/></h1>
                    </dt>
                    <dd>
                        <form id="collectionsForm">
                            <c:forEach var="deliver" items="${requestScope.delivers}" varStatus="status">
                            <ul class="reset my_collections">
                                <li data-id="133340">
                                        <h2 title="">
                                            <a target="_blank" href="javascript:void(0);">
                                                <em>${deliver.post}</em>
                                            </a>
                                        </h2>
                                    <a class="collection_link" target="_blank" href="javascript:void(0);">${deliver.result}</a>
                                        <i></i>
                                    <a class="collection_link" target="_blank" href="javascript:void(0);"><s:message code="liebiao.message3"/></a>
                                </li>
                            </ul>
                            </c:forEach>
                        </form>
                    </dd>
                </dl>
            </div>
            <div class="content_r">
                <%@include file="/lefttwo.jsp" %>
            </div>
        </div>
        <script src="style/js/collections.min.js"></script>

        <div class="clear"></div>
        <input type="hidden" value="4c6ae41d8c254f91becdb5f9ef2d4394" id="resubmitToken">
        <a rel="nofollow" title="<s:message code="addcreate.message18"/>" id="backtop"></a>
    </div><!-- end #container -->
</div><!-- end #body -->


<script src="<%=Const.ROOT%>style/js/core.min.js" type="text/javascript"></script>
<script src="<%=Const.ROOT%>style/js/popup.min.js" type="text/javascript"></script>

<!--  -->

<script type="text/javascript">
    $(function () {
        $('#noticeDot-1').hide();
        $('#noticeTip a.closeNT').click(function () {
            $(this).parent().hide();
        });
    });
    var index = Math.floor(Math.random() * 2);
    var ipArray = new Array('42.62.79.226', '42.62.79.227');
    var url = "ws://" + ipArray[index] + ":18080/wsServlet?code=314873";
    var CallCenter = {
        init: function (url) {
            var _websocket = new WebSocket(url);
            _websocket.onopen = function (evt) {
                console.log("Connected to WebSocket server.");
            };
            _websocket.onclose = function (evt) {
                console.log("Disconnected");
            };
            _websocket.onmessage = function (evt) {
                //alert(evt.data);
                var notice = jQuery.parseJSON(evt.data);
                if (notice.status[0] == 0) {
                    $('#noticeDot-0').hide();
                    $('#noticeTip').hide();
                    $('#noticeNo').text('').show().parent('a').attr('href', ctx + '/mycenter/delivery.html');
                    $('#noticeNoPage').text('').show().parent('a').attr('href', ctx + '/mycenter/delivery.html');
                } else {
                    $('#noticeDot-0').show();
                    $('#noticeTip strong').text(notice.status[0]);
                    $('#noticeTip').show();
                    $('#noticeNo').text('(' + notice.status[0] + ')').show().parent('a').attr('href', ctx + '/mycenter/delivery.html');
                    $('#noticeNoPage').text(' (' + notice.status[0] + ')').show().parent('a').attr('href', ctx + '/mycenter/delivery.html');
                }
                $('#noticeDot-1').hide();
            };
            _websocket.onerror = function (evt) {
                console.log('Error occured: ' + evt);
            };
        }
    };
    CallCenter.init(url);
</script>

<div id="cboxOverlay" style="display: none;"></div>
<div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;">
    <div id="cboxWrapper">
        <div>
            <div id="cboxTopLeft" style="float: left;"></div>
            <div id="cboxTopCenter" style="float: left;"></div>
            <div id="cboxTopRight" style="float: left;"></div>
        </div>
        <div style="clear: left;">
            <div id="cboxMiddleLeft" style="float: left;"></div>
            <div id="cboxContent" style="float: left;">
                <div id="cboxTitle" style="float: left;"></div>
                <div id="cboxCurrent" style="float: left;"></div>
                <button type="button" id="cboxPrevious"></button>
                <button type="button" id="cboxNext"></button>
                <button id="cboxSlideshow"></button>
                <div id="cboxLoadingOverlay" style="float: left;"></div>
                <div id="cboxLoadingGraphic" style="float: left;"></div>
            </div>
            <div id="cboxMiddleRight" style="float: left;"></div>
        </div>
        <div style="clear: left;">
            <div id="cboxBottomLeft" style="float: left;"></div>
            <div id="cboxBottomCenter" style="float: left;"></div>
            <div id="cboxBottomRight" style="float: left;"></div>
        </div>
    </div>
    <div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>
</div>
</body>
</html>