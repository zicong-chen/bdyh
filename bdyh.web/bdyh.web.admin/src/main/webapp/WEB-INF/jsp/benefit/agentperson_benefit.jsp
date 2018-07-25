<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>代理商个人收益查看</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/node_modules/layui-src/dist/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<table class="layui-table" id="test" lay-filter="demo"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="detail">查看详情</a>
    <%--    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>
</script>
<script src="${pageContext.request.contextPath}/node_modules/layui-src/dist/layui.js" charset="utf-8"></script>

<script>
    layui.config({
        version: '1531663423583' //为了更新 js 缓存，可忽略
    });

    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
        layer = layui.layer //弹层
            ,table = layui.table //表格
            ,carousel = layui.carousel //轮播
            ,upload = layui.upload //上传
            ,element = layui.element; //元素操作

        //向世界问个好
        layer.msg('Hello World');

        //监听Tab切换
        element.on('tab(demo)', function(data){
            layer.msg('切换了：'+ this.innerHTML);
            console.log(data);
        });

        //执行一个 table 实例
        table.render({
            elem: '#test'
            ,height: 332
            ,url: '${pageContext.request.contextPath}/admin/statistics/teacherIncomeStatistics' //数据接口
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'teacherId', title: '老师&nbsp;ID', width:300, sort: true, fixed: 'left'}
                ,{field: 'teacherName', title: '老师用户名', width:300}
                ,{field: 'teacherBenefit', title: '老师收益', width: 300, sort: true}
                ,{field: 'agentBenefit', title: '代理商收益', width: 135, sort: true}
                /*,{field: 'wealth', title: '代理商个人收益', width: 135, sort: true}*/
                /*,{field: 'sex', title: '性别', width:300, sort: true}*/
                /*                ,{field: 'city', title: '城市', width:80}
                                ,{field: 'sign', title: '签名', width: 170}
                                ,{field: 'experience', title: '积分', width: 80, sort: true}
                                ,{field: 'score', title: '评分', width: 80, sort: true}
                                ,{field: 'classify', title: '职业', width: 80}
                                ,{field: 'wealth', title: '财富', width: 135, sort: true}*/
                /*,{fixed: 'right', width: 200, align:'center', toolbar: '#barDemo'}*/
            ]]
        });

        //监听工具条
        table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                /*layer.msg('查看操作');*/
                window.location.href="${pageContext.request.contextPath}/layui/echarts.jsp?teacher_id="+data.id
            }/* else if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                });
            } else if(layEvent === 'edit'){
                layer.msg('编辑操作');
            }*/
        });
    });
</script>

</body>
</html>