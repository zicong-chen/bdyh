<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5shiv.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="http://bdpak.cn:8080/bdyhAdmin/admin/static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="http://bdpak.cn:8080/bdyhAdmin/admin/static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css"
          href="http://bdpak.cn:8080/bdyhAdmin/admin/lib/Hui-iconfont/1.0.8/iconfont.css"/>
    <link rel="stylesheet" type="text/css"
          href="http://bdpak.cn:8080/bdyhAdmin/admin/static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="http://bdpak.cn:8080/bdyhAdmin/admin/static/h-ui.admin/css/style.css"/>
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>轮播图列表</title>
    <script type="text/javascript">
    </script>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 轮播图管理 <span
        class="c-gray en">&gt;</span> 轮播图列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                               href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="datadel()"
                                                               class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a
            class="btn btn-primary radius"
            onclick="picture_add('添加轮播图','${pageContext.request.contextPath}/picture/pictureAddPage')"
            href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加轮播图</a></span> <span
            class="r">共有数据：<strong>${homePictureList.size()}</strong> 条</span></div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
            <tr class="text-c">
                <th><input name="" type="checkbox" value=""></th>
                <th>pictureId</th>
                <th>图片名称</th>
                <th>图片</th>

                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${homePictureList }" var="picture">
                <tr class="text-c">
                    <td><input name="isCheckBox" type="checkbox" value="${picture.pictureId}"></td>
                    <td>${picture.pictureId }</td>
                    <th>${picture.pictureName }</th>
                    <td><%-- <a href="javascript:;" onClick="course_edit('查看该课程','${pageContext.request.contextPath}/course/courseVideo/${course.courseId }','10001')"></a> --%><img
                            width="210" height="150" class="picture-thumb"
                            src="http://bdpak.cn:8080/home/home_picture/${picture.picturePath }"></td>

                    <td class="td-status">
                        <c:choose>
                            <c:when test="${picture.status eq 1 }">
                                <span class="label label-success radius">已发布</span>
                            </c:when>
                            <c:otherwise>
                                <span class="label label-defaunt radius">已下架</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <c:choose>
                        <c:when test="${picture.status eq 1 }">
                            <td class="td-manage">
                                <a style="text-decoration:none" onClick="picture_stop(this,'${picture.pictureId }')"
                                   href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>
                                <a style="text-decoration:none" class="ml-5"
                                   onClick="picture_del(this,'${picture.pictureId }')" href="javascript:;" title="删除"><i
                                        class="Hui-iconfont">&#xe6e2;</i></a>
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td class="td-manage">
                                <a style="text-decoration:none" onClick="picture_start(this,'${picture.pictureId }')"
                                   href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>
                                <a style="text-decoration:none" class="ml-5"
                                   onClick="picture_del(this,'${picture.pictureId }')" href="javascript:;" title="删除"><i
                                        class="Hui-iconfont">&#xe6e2;</i></a>
                            </td>
                        </c:otherwise>
                    </c:choose>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="http://bdpak.cn:8080/bdyhAdmin/admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="http://bdpak.cn:8080/bdyhAdmin/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="http://bdpak.cn:8080/bdyhAdmin/admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="http://bdpak.cn:8080/bdyhAdmin/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript"
        src="http://bdpak.cn:8080/bdyhAdmin/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript"
        src="http://bdpak.cn:8080/bdyhAdmin/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="http://bdpak.cn:8080/bdyhAdmin/admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    $('.table-sort').dataTable({
        "aaSorting": [[1, "desc"]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable": false, "aTargets": [0, 5]}// 制定列不参与排序
        ]
    });

    /*图片-添加*/
    function picture_add(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*图片-查看*/
    function course_show(title, url, id) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*图片-审核*/
    function picture_shenhe(obj, id) {
        layer.confirm('审核文章？', {
                btn: ['通过', '不通过'],
                shade: false
            },
            function () {
                $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="picture_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
                $(obj).remove();
                layer.msg('已发布', {icon: 6, time: 1000});
            },
            function () {
                $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="picture_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
                $(obj).remove();
                layer.msg('未通过', {icon: 5, time: 1000});
            });
    }


    /*--------------------------------------------------------------------------start------------------------------------------------------------*/

    /*图片-下架*/
    function picture_stop(obj, id) {
        alert(id);

        //根据courseId下架课程
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/picture/pictureLayDown",
            data: {
                pictureId: id,
            },
            success: function (data) {
                var data = eval('(' + data + ')');
                if (data.status == 1) {
                    layer.confirm('确认要下架吗？', function (index) {
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_start(this,' + id + ')" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
                        $(obj).remove();
                        layer.msg('已下架!', {icon: 5, time: 1000});
                    });
                } else {
                    alert("发生错误!请重新操作");
                }
            }
        });

    }

    /*图片-发布*/
    function picture_start(obj, id) {

        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/picture/pictureLayUp",
            data: {
                pictureId: id,
            },
            success: function (data) {
                var data = eval('(' + data + ')');
                if (data.status == 1) {
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_stop(this,' + id + ')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
                    $(obj).remove();
                    layer.msg('已发布!', {icon: 6, time: 1000});
                } else {
                    alert("发生错误!请重新操作");
                }
            }
        });
    }

    /*课程-删除*/
    function picture_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/picture/pictureDelete",
                data: {
                    pictureId: id,
                },
                success: function (data) {
                    var data = eval('(' + data + ')');
                    if (data.status == 1) {
                        location.href = "${pageContext.request.contextPath}/picture/pictureList";
                    } else {
                        alert("发生错误!请重新操作");
                    }
                }
            });
        });
    }


    /*--------------------------------------------------------------------------end---------------------------------------------------------------*/




    /*课程-申请上线*/
    function course_shengqing(obj, id) {
        alert(id);
        //根据courseId申请课程上线
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/course/courseLayUp",
            data: {
                courseId: id,
            },
            success: function (data) {
                var data = eval('(' + data + ')');
                if (data.status == 1) {
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="course_stop(this,' + id + ')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
                    $(obj).remove();
                    layer.msg('已提交申请，耐心等待审核!', {icon: 1, time: 2000});
                } else {
                    alert("发生错误!请重新操作");
                }
            }
        });

    }


    /*课程-编辑*/
    function course_edit(title, url, id) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    function datadel() {


        var chk_value =[];//定义一个数组
        $('input[name="isCheckBox"]:checked').each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数

            chk_value.push($(this).val());//将选中的值添加到数组chk_value中
        });

        if (chk_value.length <= 0) {
            alert("请勾选")
        } else {
            layer.confirm("确定要删除这些吗？",function () {
                $.ajax({

                    traditional: true,
                    type: "POST",
                    url: "${pageContext.request.contextPath}/picture/batchDeletePicture",
                    data:{
                        pictureIds : chk_value,
                    },
                    success: function (date) {

                        if (date.code === "success") {
                            alert("成功");

                        } else {
                            alert("失败")

                        }
                    }

                })
            })

        }
    }

</script>
</body>
</html>