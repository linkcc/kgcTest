<%--
  Created by IntelliJ IDEA.
  User: linkcc
  Date: 2021/1/24
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>list</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
        layui.use(['layer', 'form', 'tree','table','laydate','upload'], function () {
            var form = layui.form;
            var layer = layui.layer;
            var tree = layui.tree;
            var table = layui.table;
            var laydate = layui.laydate;
            var upload = layui.upload;

            //1.显示分页信息
            var tabins = table.render({
                elem: '#postinfoTable'
                , height: 312
                , url: '/postinfo/list' //数据接口
                , page: true //开启分页
                , limit: 3
                , limits: [3, 4, 5, 6]
                , cols: [[ //表头
                    {field: 'id', title: '编号', checkbox: true}
                    , {field: 'title', title: '标题', width: 360}
                    , {field: 'posttime',title: '发帖时间', width: 170,templet: function(d) {
                            return ''+layui.util.toDateString(d.posttime, 'yyyy-MM-dd HH:mm:ss')+'';}}
                    , {field: 'clicknum', title: '点击数'}
                    , {field: 'topicname', title: '板块名称'}
                    , {title: "操作", toolbar: "#barDemo"}
                ]]
            });

            // //渲染日期格式
            // laydate.render({
            //     elem: '#dataTime', //指定元素
            //     format:'yyyy-MM-dd HH:mm:ss'
            // });

            //2.响应查询按键
            form.on('submit(queryPostinfoFilter)', function (data) {
                // layer.msg(data.field.title+","+data.field.topicname)
                tabins.reload({
                    where: {
                        //name请求参数名称  请求参数的值
                        title: data.field.title,
                        topicname: data.field.topicname
                    },
                    method: 'post',
                    page: {
                        curr: 1
                    }
                });
                return false;
            });


            //3.添加btn 弹出页面
            $("#addPostinfo").click(function () {
                //打开对话框
                layer.open({
                    type: 1,
                    title: "发帖",
                    area: ['500px', '400px'],
                    content: $("#addPostinfoDiv")
                })
            })

            //4.完成表单的提交
            form.on('submit(insert)', function (data) {
                //1.这个表单中元素的值 data.field.typename
                $.ajax({
                    type: "post",
                    url: "/postinfo/save",
                    data: $("#savePostinfo").serialize(),
                    success: function (resp) {
                        $("#savePostinfo")[0].reset();
                        layer.closeAll();
                        layer.msg(resp)
                        //刷新table
                        tabins.reload();
                    },
                    error: function () {
                        console.info("出错了")
                    }
                })
                //2.提交
                return false;
            })

            form.on('submit(detailPostinfoFilter)', function (data) {
                layer.closeAll();
                //刷新table
                tabins.reload();
                return false;
            })
            //detailPostinfoFilter

            //5.表格中工具栏事件
            table.on('tool(postinfoTableFilter)', function (data) {
                if (data.event === 'del') {
                    // layer.msg("删除");
                    var id = data.data.id;
                    $.get("/postinfo/delete/" + id, {}, function (resp) {
                        tabins.reload();
                        layer.msg(resp.msg);
                    })
                } else if(data.event === 'edit'){
                    //点击修改操作
                    // layer.msg("修改");
                    layer.open({
                        type: 1,
                        title: "修改",
                        area: ['500px', '400px'],
                        content: $("#updatePostinfoDiv")
                    })
                    var id = data.data.id;
                    $.get("/postinfo/find/" + id, {}, function (resp) {
                        form.val("updPostinfoFilterForm", {
                            "id":resp.id,
                            "title": resp.title,
                            "topicid": resp.topicid,
                            "content": resp.content,
                            "posttime":resp.posttime,
                            // "pic":resp.pic
                        })
                        //显示原有图片
                        var img2 = $("<img/>").prop("src", resp.pic);
                        $("#picDiv2").empty();
                        $("#picDiv2").append(img2);
                    })
                }else {
                    //查看详细
                    // layer.msg("详细");
                    var id = data.data.id;
                    $.get("/postinfo/detailOne/" + id, {}, function (){})
                    layer.open({
                        type: 1,
                        title: "详细",
                        area: ['700px', '500px'],
                        content: $("#detailPostinfoDiv")
                    })
                    $.get("/postinfo/find/" + id, {}, function (resp) {
                        form.val("detailPostinfoFilterForm", {
                            "title": resp.title,
                            "topicid": resp.topicid,
                            "content": resp.content,
                            "pic": resp.pic
                        })
                        var img3 = $("<img/>").prop("src", resp.pic);
                        $("#picDiv3").empty();
                        $("#picDiv3").append(img3);
                    })

                }
            })

            //  6.监听修改的提交按钮
            form.on('submit(updatePostinfoFilter)', function (data) {
                //提交表单中的数据
                $.ajax({
                    type: "post",
                    url: "/postinfo/update",
                    data: $("#updatePostinfo").serialize(),
                    success: function (res) {
                        //1.reload
                        tabins.reload();
                        //2.关闭对话框架
                        layer.closeAll();
                        //3.清空表单内容
                        $("#updatePostinfo")[0].reset();
                        //4.显示修改成功信息
                        layer.msg(res);
                    }
                })
                return false;
            })

            //7.上传图片
            //添加
            upload.render({
                elem: '#upload1',
                url: 'upload',
                done: function (resp) {
                    var img1 = $("<img/>").prop("src", "upload/" + resp.path);
                    $("#picDiv1").append(resp.path);
                    $("#picDiv1").append(img1);
                    $("#pic1").attr("value","upload/" + resp.path)
                },
                error: function () {
                    console.info("出错了")
                }
            })
            //修改
            upload.render({
                elem: '#upload2',
                url: 'upload',
                done: function (resp) {
                    var img2 = $("<img/>").prop("src", "upload/" + resp.path);
                    $("#picDiv2").empty();
                    $("#picDiv2").append(img2);
                    $("#pic2").attr("value","upload/" + resp.path)
                    //刷新表单
                    from.render()
                },
                error: function () {
                    console.info("出错了")
                }
            })

        })
    </script>
</head>
<body>
    <h2>论坛发帖列表</h2>
    <button class="layui-btn layui-btn-radius layui-btn-warm" id="addPostinfo">发帖</button>
<%--    <button class="layui-btn layui-btn-radius layui-btn-warm" id="delPostinfo">批量删除</button>--%>

    <!--查询条件表单begin -->
    <form class="layui-form" id="queryPostinfoForm">
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-inline">
                <input type="text" name="title" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">板块</label>
            <div class="layui-input-inline">
                <select name="topicname" lay-verify="">
                    <option value="">请选择一个板块</option>
                    <option value="体育">体育</option>
                    <option value="军事">军事</option>
                    <option value="物理">物理</option>
                    <option value="地理">地理</option>
                    <option value="化学">化学</option>
                    <option value="文学">文学</option>
                    <option value="史学">史学</option>
                </select>
            </div>
            <label class="layui-form-label">点击数</label>
            <div class="layui-input-inline">
                <input type="text" name="clicknum1" autocomplete="off" class="layui-input">
                到
                <input type="text" name="clicknum2" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-input-inline">
                <button class="layui-btn" lay-submit lay-filter="queryPostinfoFilter">查询</button>
            </div>
        </div>
    </form>
    <!--查询条件表单end -->

    <!--表单操作  开始 -->
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        <a class="layui-btn layui-btn-xs" lay-event="detail">详细</a>
    </script>
    <!--表单操作  结束 -->

    <%--显示新闻信息   开始--%>
    <table border="1" id="postinfoTable" lay-filter="postinfoTableFilter"></table>
    <%--显示新闻信息   结束--%>

    <!--增加页面  开始 -->
    <div class="layui-container" style="display: none;width: 500px" id="addPostinfoDiv">
        <h2>发帖</h2>
        <form class="layui-form" id="savePostinfo"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
            <div class="layui-form-item">
                <label class="layui-form-label">标题</label>
                <div class="layui-input-block">
                    <input type="text" name="title" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">帖子类别</label>
                <div class="layui-input-block">
                    <select name="topicid" lay-verify="">
                        <option value="">请选择一个板块</option>
                        <option value="1">体育</option>
                        <option value="2">军事</option>
                        <option value="3">物理</option>
                        <option value="4">地理</option>
                        <option value="5">化学</option>
                        <option value="6">文学</option>
                        <option value="7">史学</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">帖子内容</label>
                <div class="layui-input-block">
                    <textarea  class="layui-textarea" name="content"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">发布时间</label>
                <div class="layui-input-block">
                    <input type="date" name="posttime">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">上传图片</label>
                <input type="text" style="display: none" name="pic" id="pic1">
                <button type="button" class="layui-btn" id="upload1">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                </button>
                <div id="picDiv1">

                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="insert">发帖</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
            <!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
        </form>
    </div>
    <!--增加页面  结束 -->

    <!--修改页面  开始 -->
    <div class="layui-container" style="display: none;width: 500px" id="updatePostinfoDiv">
        <h2>发帖</h2>
        <form class="layui-form" id="updatePostinfo" lay-filter="updPostinfoFilterForm"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
            <div class="layui-form-item" style="display:none;">
                <label class="layui-form-label">id</label>
                <div class="layui-input-block">
                    <input type="text" name="id" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">标题</label>
                <div class="layui-input-block">
                    <input type="text" name="title" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">帖子内容</label>
                <div class="layui-input-block">
                    <textarea  class="layui-textarea" name="content"></textarea>
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">帖子类别</label>
                <div class="layui-input-block">
                    <select name="topicid" lay-verify="">
                        <option value="">请选择一个板块</option>
                        <option value="1">体育</option>
                        <option value="2">军事</option>
                        <option value="3">物理</option>
                        <option value="4">地理</option>
                        <option value="5">化学</option>
                        <option value="6">文学</option>
                        <option value="7">史学</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item" style="display: none">
                <label class="layui-form-label">发布时间</label>
                <div class="layui-input-block">
                    <input type="date" name="posttime">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">上传图片</label>
                <input type="text" style="display: none" name="pic" id="pic2" autocomplete="off" class="layui-input">
                <button type="button" class="layui-btn" id="upload2">
                    <i class="layui-icon">&#xe67c;</i>上传图片
                </button>
                <div id="picDiv2">

                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="updatePostinfoFilter">修改</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
            <!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
        </form>
    </div>
    <!--修改页面  结束 -->

    <!--详细页面  开始 -->
    <div class="layui-container" style="display: none;width: 500px" id="detailPostinfoDiv">
        <h2>详细</h2>
        <form class="layui-form" id="detailPostinfo" lay-filter="detailPostinfoFilterForm"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->

            <div class="layui-form-item">
                <label class="layui-form-label">标题</label>
                <div class="layui-input-block">
                    <input type="text" name="title" autocomplete="off" class="layui-input" disabled>
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">帖子类别</label>
                <div class="layui-input-block">
                    <select name="topicid" lay-verify="">
                        <option value="">请选择一个板块</option>
                        <option value="1">体育</option>
                        <option value="2">军事</option>
                        <option value="3">物理</option>
                        <option value="4">地理</option>
                        <option value="5">化学</option>
                        <option value="6">文学</option>
                        <option value="7">史学</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">帖子内容</label>
                <div class="layui-input-block">
                    <textarea  class="layui-textarea" name="content"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">上传图片</label>
                <div id="picDiv3">

                </div>

            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="detailPostinfoFilter">返回列表</button>
                </div>
            </div>
            <!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
        </form>
    </div>
    <!--详细页面  结束 -->
</body>
</html>
