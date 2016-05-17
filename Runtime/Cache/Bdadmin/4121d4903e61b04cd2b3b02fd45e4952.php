<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的桌面</title>

<link type="text/css" rel="stylesheet" href="/Public/Admin/desktop/css/css.css"/>
<link type="text/css" rel="stylesheet" href="/Public/Admin/desktop/css/jquery.tool.css"/>
<link type="text/css" rel="stylesheet" href="/Public/Admin/desktop/css/smartMenu.css"/>

<script type="text/javascript" src="/Public/Admin/desktop/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="/Public/Admin/desktop/js/jquery.tool.js"></script>
<script type="text/javascript" src="/Public/Admin/desktop/js/shortcut.js"></script>
<script type="text/javascript" src="/Public/Admin/desktop/js/templates.js"></script>
<script type="text/javascript" src="/Public/Admin/desktop/js/jquery-smartMenu.js"></script>
<script type="text/javascript" src="/Public/Admin/desktop/js/core.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	document.body.onselectstart = document.body.ondrag = function(){
		return false;
	}
	Core.init();
});
</script>

</head>
<body id="lxcn" style="background:url(/Public/Admin/desktop/images/background.jpg) repeat right bottom transparent;">

<div id="task-bar">
	<ul class="task-window"></ul>
	<ul class="task-panel">
		<li class="sys" title="系统设定"><b class="">系统设定</b></li>
	</ul>
</div>
<div id="desk"><ul></ul></div>

</body>

<script type="text/javascript">
//id,iconName,iconUrl,url,width,height
var shortcut = [
<?php if(is_array($__MENU__["main"])): $i = 0; $__LIST__ = $__MENU__["main"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?>[<?php echo ($key); ?>,"<?php echo ($menu["title"]); ?>","<?php echo ((isset($menu["menu_img"]) && ($menu["menu_img"] !== ""))?($menu["menu_img"]):"/Public/Images/icos/01.png"); ?>","<?php echo (U($menu["url"])); ?>",<?php echo ($menu["width"]); ?>,<?php echo ($menu["height"]); ?>],<?php endforeach; endif; else: echo "" ;endif; ?>
];
//任务栏右键提示
var GetTaskSystem = function(obj){
    if(!_cache.TaskSystem){
        _cache.TaskSystem = $('<div class="popup-menu task-menu" style="z-index:99999;bottom:30px;display:none"><ul><li><a menu="close" href="<?php echo U("Public/logout");?>">用户退出</a></li>');
        $(document.body).append(_cache.TaskSystem);
        $('.task-menu').bind('contextmenu',function(){
            return false;
        });
    }
    //绑定关闭事件
    $('.task-menu a[menu="close"]').unbind("click").bind("click",function(){
        $('#window_'+obj.attr('window')+'_inner .title-handle .ha-close').click();
        $('.task-menu').hide();
    });
    return _cache.TaskSystem;
}
</script>


</html>