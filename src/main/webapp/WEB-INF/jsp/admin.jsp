<%--
  Created by IntelliJ IDEA.
  User: linkcc
  Date: 2021/1/25
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
        layui.use('element', function () {
            var element = layui.element;

            $(".menu").click(function () {
                var title = $(this).text();
                var id = $(this).attr("id");
                var url = $(this).attr("url");

                if ($("li[lay-id=" + id + "]").length === 0) {
                    element.tabAdd('tab1', {
                        title: title,
                        // content:title+url,
                        content: '<iframe width="100%" height="800px" frameborder="0" src=' + url + '></iframe>',
                        id: id
                    })
                }
                element.tabChange('tab1', id)
            })
        });
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">鸿鹏论坛后台管理</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">帖子管理</a></li>
            <li class="layui-nav-item"><a href="">用户管理</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${pageContext.request.contextPath}/userImg/QQ20210125113624.jpg" class="layui-nav-img">
                    消失の猫
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="#">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">论坛管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="menu" id="101" url="list">帖子管理</a></dd>
                        <dd><a href="javascript:;" class="menu" id="102">用户管理</a></dd>
                        <dd><a href="javascript:;" class="menu" id="103">列表三</a></dd>
                        <dd><a href="#">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">云市场</a></li>
                <li class="layui-nav-item"><a href="">发布商品</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="layui-tab layui-tab-card" lay-filter="tab1">
            <ul class="layui-tab-title">
                <li class="layui-this">项目后台</li>
            </ul>
            <div class="layui-tab-content" style="height: 100%">
                <div class="layui-tab-item layui-show">欢迎使用</div>
            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © kgc.com - 底部固定区域
    </div>
</div>

</body>
</html>
