<%@ page import="cn.tool.Const" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="<%=Const.ROOT%>admin/select">大学生兼职招聘网站后台</a>
    </div>
    <!-- /.navbar-header -->
    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li>
                    <a href="<%=Const.ROOT%>admin/select"><span class="glyphicon glyphicon-cog"></span><i class="fa nav_icon"></i>管理员管理</a>
                </li>
                <li>
                    <a href="<%=Const.ROOT%>user/getAllUser"><span class="glyphicon glyphicon-user"></span><i class="fa  nav_icon"></i>用户管理</a>

                </li>
                <li>
                    <a href="<%=Const.ROOT%>firm/getAllFirm"><span class="glyphicon glyphicon-th-large"></span><i class="fa  nav_icon"></i>企业管理</a>

                </li>
                <li>
                    <a href="<%=Const.ROOT%>post/getAllPost"><span class="glyphicon glyphicon-th"></span><i class="fa  nav_icon"></i>岗位管理</a>
                </li>
                <li>
                    <a href="<%=Const.ROOT%>notice/getAllNotice"><span class="glyphicon glyphicon-th-list"></span><i class="fa  nav_icon"></i>公告管理</a>
                </li>
                <li>
                    <a href="<%=Const.ROOT%>news/getAllNews"><span class="glyphicon glyphicon-globe"></span><i class="fa  nav_icon"></i>新闻管理</a>
                </li>
                <li>
                    <a href="<%=Const.ROOT%>note/getAllNote"><span class="
glyphicon glyphicon-comment"></span><i class="fa nav_icon"></i>留言管理</a>
                </li>
                <li>
                    <a href="<%=Const.ROOT%>reply/getAllReply"><span class="
glyphicon glyphicon-tasks"></span><i class="fa  nav_icon"></i>回复管理</a>
                </li>
                 <li>
                    <a href="<%=Const.ROOT%>admin/logout"><span class="glyphicon glyphicon-cog"></span><i class="fa nav_icon"></i>系统退出</a>
                </li>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>
