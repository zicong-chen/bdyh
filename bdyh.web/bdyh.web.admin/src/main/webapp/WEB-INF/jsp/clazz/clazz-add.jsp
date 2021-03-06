<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="Bookmark" href="/favicon.ico">
    <link rel="Shortcut Icon" href="/favicon.ico"/>
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

    <!-- 城市选择 -->
    <!--
    <link href="http://bdpak.cn:8080/bdyhAdmin/admin/city/css/city.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://bdpak.cn:8080/bdyhAdmin/admin/city/js/jquery.min.js"></script>
    <script type="text/javascript" src="http://bdpak.cn:8080/bdyhAdmin/admin/city/js/city.min.js"></script>
     -->

    <script src="http://bdpak.cn:8080/bdyhAdmin/admin/city/jquery/jquery-1.9.1.min.js"></script>
    <script src="http://bdpak.cn:8080/bdyhAdmin/admin/city/cityselect/cityselect.js"></script>
    <link href="http://bdpak.cn:8080/bdyhAdmin/admin/city/cityselect/cityLayout.css" type="text/css" rel="stylesheet">

    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <!--/meta 作为公共模版分离出去-->


    <script type="text/javascript">
        $(function () {
            init_city_select($("#district"));
        });
    </script>

    <title>添加年级</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
</head>
<body>
<article class="page-container">
    <form action="${pageContext.request.contextPath}/teacher/teacherAdd" class="form form-horizontal"
          id="form-grade-add" method="POST">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>年级：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="gradename" name="gradename">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;添加&nbsp;&nbsp;">
            </div>
        </div>


    </form>
</article>

<!--_footer 作为公共模版分离出去-->


<script type="text/javascript" src="http://bdpak.cn:8080/bdyhAdmin/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="http://bdpak.cn:8080/bdyhAdmin/admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="http://bdpak.cn:8080/bdyhAdmin/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript"
        src="http://bdpak.cn:8080/bdyhAdmin/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript"
        src="http://bdpak.cn:8080/bdyhAdmin/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript"
        src="http://bdpak.cn:8080/bdyhAdmin/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript"
        src="http://bdpak.cn:8080/bdyhAdmin/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>


<script type="text/javascript">
    $(function () {
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form-grade-add").validate({
            rules: {
                gradename: {
                    required: true,
                },

            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
                //这里使用异步提交是为了验证区域存不存在,验证成功后
                var newgrade=$('#gradename').val();
                $.ajax({
                    url: "${pageContext.request.contextPath}/clazz/clazzAdd",
                    type: "post",
                    data: {
                          clazz:newgrade
                        },
                    dataType: "json",
             /*       processData: false, // 告诉jQuery不要去处理发送的数据
                    contentType: false, // 告诉jQuery不要去设置Content-Type请求头*/
                    success: function (data) {
                        console.log(data);
                        if (data.code=="success") {
                            alert("添加年级成功");
                            window.parent.location.reload();
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);//刷新父页面并且关闭窗口
                        }
                        else {
                            alert("添加失败");
                        }
                    }
                });
            }
        });
    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>