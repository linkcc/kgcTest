<%--
  Created by IntelliJ IDEA.
  User: linkcc
  Date: 2021/1/31
  Time: 17:27
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
        layui.use(['table', 'layer', 'form','upload'], function () {
            var table = layui.table;
            var layer = layui.layer;
            var form = layui.form;
            var upload = layui.upload;

            //1.显示分页信息
            var tabins = table.render({
                elem: '#brandTable'
                , height: 312
                , url: '/brand/list' //数据接口
                , page: true //开启分页
                , limit: 6
                , limits: [3, 4, 5, 6]
                , cols: [[ //表头
                    //商品id,
                    {field: 'id', title: '品牌ID', checkbox: true}
                    , {field: 'name', title: '品牌名称'}
                    , {field: 'logo', title: 'LOGO',width: 130 , align: 'center'
                        ,templet:'<div><img style="height:40px;width:50px;" src="{{d.logo}}"></div>'
                    }
                    , {field: 'discription', title: '描述'}
                    , {field: 'url', title: '官方网站'}
                    , {field: 'status', title: '状态', templet: function (d) {
                            return d.status == 1?"在售":"停售";
                        }
                    }
                    , {title: "操作", toolbar: "#barDemo"}
                ]]
            })

            //2.表格中工具栏事件
            table.on('tool(brandTableFilter)', function (data) {
                if (data.event === 'del') {
                    // layer.msg("删除");
                    layer.confirm("确认删除么", function (index) {
                        var id = data.data.id;
                        $.get("/brand/delete/" + id, {}, function (resp) {
                            tabins.reload();
                            layer.msg(resp);
                        })
                        layer.close(index);
                    })
                } else {
                    // layer.msg("修改");
                    layer.open({
                        type: 1,
                        title: "修改",
                        area: ['500px', '400px'],
                        content: $("#updBrandDiv")
                    })
                    var id = data.data.id;
                    $.get("/brand/find/" + id, {}, function (resp) {
                        form.val("updBrandFilterForm", {
                            "id": resp.id,
                            "name": resp.name,
                            // "logo": resp.logo,
                            "discription": resp.discription,
                            "url": resp.url,
                            "status": resp.status,
                        })
                        //显示原有图片
                        var logo = $("<img/>").prop("src", resp.logo);
                        $("#logoDiv2").empty();
                        $("#logoDiv2").append(logo);
                        $("#logo2").attr("value",resp.logo);
                    })
                }
            })

            //3.响应查询按键
            form.on('submit(queryBrandFilter)', function (data) {
                tabins.reload({
                    where: {
                        //name请求参数名称  请求参数的值
                        name: data.field.name,
                        status: data.field.status
                    },
                    method: 'post',
                    page: {
                        curr: 1
                    }
                });
                return false;
            });

            //4.添加btn 弹出添加页面
            $("#addBrand").click(function () {
                //打开对话框
                layer.open({
                    type: 1,
                    title: "添加品牌",
                    area: ['500px', '400px'],
                    content: $("#addBrandDiv")
                })
            })

            //4.完成添加表单的提交
            form.on('submit(insert)', function (data) {
                //1.这个表单中元素的值 data.field.goodName
                $.ajax({
                    type: "post",
                    url: "/brand/save",
                    data: $("#saveBrand").serialize(),
                    success: function (resp) {
                        $("#saveBrand")[0].reset();
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

            //  5.监听修改的提交按钮
            form.on('submit(update)', function (data) {
                //提交表单中的数据
                $.ajax({
                    type: "post",
                    url: "/brand/upd",
                    data: $("#updBrand").serialize(),
                    success: function (res) {
                        //1.reload
                        tabins.reload();
                        //2.关闭对话框架
                        layer.closeAll();
                        //3.清空表单内容
                        $("#updBrand")[0].reset();
                        //4.显示修改成功信息
                        layer.msg(res);
                    }
                })
                return false;
            })

            //6.上传图片
            //添加
            upload.render({
                elem: '#upload1',
                url: 'upload',
                done: function (resp) {
                    var img1 = $("<img/>").prop("src", "upload/" + resp.path);
                    $("#logoDiv1").empty();
                    $("#logoDiv1").append(resp.path);
                    $("#logoDiv1").append(img1);
                    $("#logo1").attr("value","upload/" + resp.path)
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
                    $("#logoDiv2").empty();
                    $("#logoDiv2").append(resp.path);
                    $("#logoDiv2").append(img2);
                    $("#logo2").attr("value","upload/" + resp.path)
                    //刷新表单
                    form.render()
                },
                error: function () {
                    console.info("出错了")
                }
            })
        })
    </script>
</head>
<body>
<div align="center">

    <h2>品牌管理列表</h2>
    <button class="layui-btn layui-btn-radius layui-btn-warm" id="addBrand">添加品牌</button>

    <!--查询条件表单begin -->
    <form class="layui-form" id="queryBrandForm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">名称：</label>
                <div class="layui-input-inline">
                    <input type="text" name="name" autocomplete="off" class="layui-input" placeholder="请输入品牌名称">
                </div>

                <div class="layui-input-inline">
                    <select name="status" lay-verify="">
                        <option value="">请选择销售状态</option>
                        <option value="1" selected>在售</option>
                        <option value="0">停售</option>
                    </select>
                </div>

                <div class="layui-input-inline">
                    <button class="layui-btn" lay-submit lay-filter="queryBrandFilter">查询</button>
                </div>
            </div>
        </div>
    </form>
    <!--查询条件表单end -->

    <!--表单操作  开始 -->
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
    <!--表单操作  结束 -->

    <%--显示分页信息   开始--%>
    <table border="1" id="brandTable" lay-filter="brandTableFilter"></table>
    <%--显示分页信息   结束--%>

    <!--增加页面  开始 -->
    <div class="layui-container" style="display: none;width: 500px" id="addBrandDiv">
        <h2>发帖</h2>
        <form class="layui-form" id="saveBrand"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
            <div class="layui-form-item" hidden>
                <label class="layui-form-label">商品ID</label>
                <div class="layui-input-block">
                    <input type="text" name="id" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" >
                <label class="layui-form-label">品牌名称</label>
                <div class="layui-input-block">
                    <input type="text" name="name" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">品牌LOGO</label>
                <div class="layui-input-block">
                    <input type="text" name="logo" id="logo1" autocomplete="off" class="layui-input">
                    <button type="button" class="layui-btn" id="upload1">
                        <i class="layui-icon">&#xe67c;</i>上传图片
                    </button>
                    <div id="logoDiv1"></div>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">品牌描述</label>
                <div class="layui-input-block">
                    <input type="text" name="discription" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">官方网站</label>
                <div class="layui-input-block">
                    <input type="text" name="url" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">在售状态</label>
                <div class="layui-input-block">
                    <select name="status" lay-verify="">
                        <option value="">请选择在售状态</option>
                        <option value="1">在售</option>
                        <option value="0">停售</option>
                    </select>
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
    <div class="layui-container" style="display: none;width: 500px" id="updBrandDiv">
        <h2>修改</h2>
        <form class="layui-form" id="updBrand" lay-filter="updBrandFilterForm"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
            <div class="layui-form-item" hidden>
                <label class="layui-form-label">商品ID</label>
                <div class="layui-input-block">
                    <input type="text" name="id" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" >
                <label class="layui-form-label">品牌名称</label>
                <div class="layui-input-block">
                    <input type="text" name="name" readonly="readonly" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">品牌LOGO</label>
                <div class="layui-input-block">
                    <input type="text" name="logo" id="logo2" autocomplete="off" class="layui-input">
                    <button type="button" class="layui-btn" id="upload2">
                        <i class="layui-icon">&#xe67c;</i>上传图片
                    </button>
                    <div id="logoDiv2"></div>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">品牌描述</label>
                <div class="layui-input-block">
                    <input type="text" name="discription" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">官方网站</label>
                <div class="layui-input-block">
                    <input type="text" name="url" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">在售状态</label>
                <div class="layui-input-block">
                    <select name="status" lay-verify="">
                        <option value="">请选择在售状态</option>
                        <option value="1">在售</option>
                        <option value="0">停售</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="update">修改</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
    <!--修改页面  结束 -->
</div>

</body>
</html>
