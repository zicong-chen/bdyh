<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="http://bdpak.cn:8080/bdyhAdmin/admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="http://bdpak.cn:8080/bdyhAdmin/admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="http://bdpak.cn:8080/bdyhAdmin/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="http://bdpak.cn:8080/bdyhAdmin/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="http://bdpak.cn:8080/bdyhAdmin/admin/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>修改密码</title>
<meta name="keywords" content="">
<meta name="description" content="">
</head>
<body>
<article class="page-container">
	<form action="/" method="post" class="form form-horizontal" id="form-change-password">
		<input hidden="hidden" name="teacherId" value="${teacher.teacherId }">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>姓名：</label>
			<div class="formControls col-xs-8 col-sm-9"> ${teacher.teacherName } </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>账户：</label>
			<div class="formControls col-xs-8 col-sm-9"> ${teacher.username } </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>新密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" autocomplete="off" placeholder="" name="newpassword" id="newpassword">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" autocomplete="off" placeholder="" name="newpassword2" id="new-password2">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="http://bdpak.cn:8080/bdyhAdmin/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="http://bdpak.cn:8080/bdyhAdmin/admin/lib/layer/2.4/layer.js"></script>  
<script type="text/javascript" src="http://bdpak.cn:8080/bdyhAdmin/admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="http://bdpak.cn:8080/bdyhAdmin/admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="http://bdpak.cn:8080/bdyhAdmin/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="http://bdpak.cn:8080/bdyhAdmin/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="http://bdpak.cn:8080/bdyhAdmin/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript">
$(function(){
	$("#form-change-password").validate({
		rules:{
			newpassword:{
				required:true,
				minlength:6,
				maxlength:20
			},
			newpassword2:{
				required:true,
				minlength:6,
				maxlength:20,
				equalTo: "#newpassword"
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			var fd = new FormData($("#form-change-password")[0]);
			$.ajax({
				url : "${pageContext.request.contextPath}/teacher/changePassword",
				type : "post",
				data : fd,
				dataType : "json",
				processData : false, // 告诉jQuery不要去处理发送的数据
				contentType : false, // 告诉jQuery不要去设置Content-Type请求头
				success: function(data){
					if (data.status==1){
						alert("修改成功");
					}else{
						alert("修改失败！");
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