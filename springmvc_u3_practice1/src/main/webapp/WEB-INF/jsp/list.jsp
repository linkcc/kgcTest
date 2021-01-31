<%--
  Created by IntelliJ IDEA.
  User: linkcc
  Date: 2021/1/31
  Time: 12:09
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
        layui.use(['table', 'layer', 'form'], function () {
            var table = layui.table;
            var layer = layui.layer;
            var form = layui.form;

            //1.显示分页信息
            var tabins = table.render({
                elem: '#goodTable'
                , height: 312
                , url: '/good/list' //数据接口
                , page: true //开启分页
                , limit: 3
                , limits: [3, 4, 5, 6]
                , cols: [[ //表头
                    //商品id,
                    {field: 'goodId', title: '商品id', checkbox: true}
                    , {field: 'goodName', title: '商品名称'}
                    , {field: 'goodNum', title: '商品数量'}
                    , {field: 'goodPrice', title: '价格'}
                    , {
                        field: 'createDate', title: '创建时间', templet: function (d) {
                            return '' + layui.util.toDateString(d.createDate, 'yyyy-MM-dd HH:mm:ss') + '';
                        }
                    }
                    , {
                        field: 'goodtype', title: '类型名称', templet: function (d) {
                            return d.goodtype.goodtypeName;
                        }
                    }
                    , {title: "操作", toolbar: "#barDemo"}
                ]]
            })

            //2.表格中工具栏事件
            table.on('tool(goodTableFilter)', function (data) {
                if (data.event === 'del') {
                    // layer.msg("删除");
                    layer.confirm("确认删除么", function (index) {
                        var goodId = data.data.goodId;
                        $.get("/good/delete/" + goodId, {}, function (resp) {
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
                        content: $("#updGoodDiv")
                    })
                    var goodId = data.data.goodId;
                    $.get("/good/find/" + goodId, {}, function (resp) {
                        form.val("updGoodFilterForm", {
                            "goodId": resp.goodId,
                            "goodName": resp.goodName,
                            "goodPrice": resp.goodPrice,
                            "goodNum": resp.goodNum,
                            "createDate": '' + layui.util.toDateString(resp.createDate, 'yyyy-MM-dd HH:mm:ss') + '',
                            "goodtypeId": resp.goodtypeId,
                        })
                    })
                }
            })

            //3.响应查询按键
            form.on('submit(queryGoodFilter)', function (data) {
                tabins.reload({
                    where: {
                        //name请求参数名称  请求参数的值
                        goodtypeId: data.field.goodtypeId,
                        goodName: data.field.goodName
                    },
                    method: 'post',
                    page: {
                        curr: 1
                    }
                });
                return false;
            });

            //4.添加btn 弹出添加页面
            $("#addGood").click(function () {
                //打开对话框
                layer.open({
                    type: 1,
                    title: "发帖",
                    area: ['500px', '400px'],
                    content: $("#addGoodDiv")
                })
            })

            //4.完成添加表单的提交
            form.on('submit(insert)', function (data) {
                //1.这个表单中元素的值 data.field.goodName
                // layer.msg(data.field.goodName+","+data.field.createDate)
                $.ajax({
                    type: "post",
                    url: "/good/save",
                    data: $("#saveGood").serialize(),
                    success: function (resp) {
                        $("#saveGood")[0].reset();
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
                    url: "/good/upd",
                    data: $("#updGood").serialize(),
                    success: function (res) {
                        //1.reload
                        tabins.reload();
                        //2.关闭对话框架
                        layer.closeAll();
                        //3.清空表单内容
                        $("#updGood")[0].reset();
                        //4.显示修改成功信息
                        layer.msg(res);
                    }
                })
                return false;
            })
        })
    </script>
</head>
<body>
<div align="center">

    <h2>商品分页显示页面</h2>
    <button class="layui-btn layui-btn-radius layui-btn-warm" id="addGood">添加商品</button>

    <!--查询条件表单begin -->
    <form class="layui-form" id="queryGoodForm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <select name="goodtypeId" lay-verify="">
                        <option value="">请选择一个板块</option>
                        <option value="1">帽子</option>
                        <option value="2">上衣</option>
                        <option value="3">下装</option>
                        <option value="4">外套</option>
                        <option value="5">鞋子</option>
                    </select>
                </div>
                <label class="layui-form-label">商品名称：</label>
                <div class="layui-input-inline">
                    <input type="text" name="goodName" autocomplete="off" class="layui-input" placeholder="请输入商品名称">
                </div>
                <div class="layui-input-inline">
                    <button class="layui-btn" lay-submit lay-filter="queryGoodFilter">查询</button>
                </div>
            </div>
        </div>
    </form>
    <!--查询条件表单end -->

    <!--表单操作  开始 -->
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    </script>
    <!--表单操作  结束 -->

    <%--显示分页信息   开始--%>
    <table border="1" id="goodTable" lay-filter="goodTableFilter"></table>
    <%--显示分页信息   结束--%>

    <!--增加页面  开始 -->
    <div class="layui-container" style="display: none;width: 500px" id="addGoodDiv">
        <h2>发帖</h2>
        <form class="layui-form" id="saveGood"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
            <div class="layui-form-item">
                <label class="layui-form-label">商品名称</label>
                <div class="layui-input-block">
                    <input type="text" name="goodName" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">商品价格</label>
                <div class="layui-input-block">
                    <input type="text" name="goodPrice" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">商品数量</label>
                <div class="layui-input-block">
                    <input type="text" name="goodNum" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">商品类型</label>
                <div class="layui-input-block">
                    <select name="goodtypeId" lay-verify="">
                        <option value="">请选择一个板块</option>
                        <option value="1">帽子</option>
                        <option value="2">上衣</option>
                        <option value="3">下装</option>
                        <option value="4">外套</option>
                        <option value="5">鞋子</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">创建时间</label>
                <div class="layui-input-block">
                    <input type="text" name="createDate" id="createDate" autocomplete="off" class="layui-input">
                    <script>
                        setInterval(function () {
                            date = new Date();//该对bai象du包含zhi系统dao时zhuan间shu
                            strDate = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate()
                                + ' ' + date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
                            document.getElementById('createDate').setAttribute('value', strDate)
                        }, 1000)
                    </script>
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
    <div class="layui-container" style="display: none;width: 500px" id="updGoodDiv">
        <h2>修改</h2>
        <form class="layui-form" id="updGood" lay-filter="updGoodFilterForm"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
            <div class="layui-form-item" hidden>
                <label class="layui-form-label">商品ID</label>
                <div class="layui-input-block">
                    <input type="text" name="goodId" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" >
                <label class="layui-form-label">商品名称</label>
                <div class="layui-input-block">
                    <input type="text" name="goodName" readonly="readonly" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">商品价格</label>
                <div class="layui-input-block">
                    <input type="text" name="goodPrice" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">商品数量</label>
                <div class="layui-input-block">
                    <input type="text" name="goodNum" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">商品类型</label>
                <div class="layui-input-block">
                    <select name="goodtypeId" lay-verify="">
                        <option value="">请选择一个板块</option>
                        <option value="1">帽子</option>
                        <option value="2">上衣</option>
                        <option value="3">下装</option>
                        <option value="4">外套</option>
                        <option value="5">鞋子</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">创建时间</label>
                <div class="layui-input-block" >
                    <input type="text" name="createDate">
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
