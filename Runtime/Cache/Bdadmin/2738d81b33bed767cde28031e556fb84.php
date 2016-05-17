<?php if (!defined('THINK_PATH')) exit();?>﻿<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="/Public/Admin/lib/html5.js"></script>
<script type="text/javascript" src="/Public/Admin/lib/respond.min.js"></script>
<script type="text/javascript" src="/Public/Admin/lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="/Public/Admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/Public/Admin/static/h-ui/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="/Public/Admin/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="/Public/Admin/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="/Public/Admin/static/h-ui/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="/Public/Admin/static/h-ui/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title></title>
</head>
<!--/meta 作为公共模版分离出去-->


</head>
<body>

<nav class="breadcrumb">
		
		<i class="Hui-iconfont">&#xe67f;</i> 首页 
	
	
	<?php if(!empty($__POSITION__["parentname"])): ?><span class="c-gray en">&gt;</span>
		
		<?php echo ($__POSITION__["parentname"]); endif; ?>	
	
	<?php if(!empty($__POSITION__["childname"])): ?><span class="c-gray en">&gt;</span>
		
		<?php echo ($__POSITION__["childname"]); endif; ?>	
		
		
		
		<a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>

<div class="page-container">
	<form class="form form-horizontal" id="fromcreate">
		<div id="tab-system" class="HuiTab">
			<div class="tabBar cl">
			<?php if(is_array(C("CONFIG_GROUP_LIST"))): $i = 0; $__LIST__ = C("CONFIG_GROUP_LIST");if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$group): $mod = ($i % 2 );++$i;?><span><?php echo ($group); ?>配置</span><?php endforeach; endif; else: echo "" ;endif; ?>
			</div>
			
		
			
			<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$list): $mod = ($i % 2 );++$i;?><div class="tabCon">
			<noempty name="list.list">
				<?php if(is_array($list["list"])): $i = 0; $__LIST__ = $list["list"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$config): $mod = ($i % 2 );++$i;?><div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><?php echo ($config["title"]); ?></label>
					<div class="formControls col-xs-8 col-sm-9">
					
					<?php switch($config["type"]): case "0": ?><input type="text" id="website-title" placeholder="<?php echo ($config["remark"]); ?>" name="config[<?php echo ($config["name"]); ?>]" value="<?php echo ($config["value"]); ?>" class="input-text"><?php break;?>
					
					<?php case "1": ?><input type="text" id="website-title" placeholder="<?php echo ($config["remark"]); ?>" name="config[<?php echo ($config["name"]); ?>]" value="<?php echo ($config["value"]); ?>" class="input-text"><?php break;?>
					<?php case "2": ?><textarea name="config[<?php echo ($config["name"]); ?>]" class="textarea"><?php echo ($config["value"]); ?></textarea><?php break;?>
				<?php case "3": ?><textarea name="config[<?php echo ($config["name"]); ?>]" class="textarea"><?php echo ($config["value"]); ?></textarea><?php break;?>
					<?php case "4": ?><select name="config[<?php echo ($config["name"]); ?>]" class="select">
				<?php $_result=parse_config_attr($config['extra']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($key); ?>" <?php if(($config["value"]) == $key): ?>selected<?php endif; ?>><?php echo ($vo); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
			</select><?php break; endswitch;?>
					
					
					</div>
				</div><?php endforeach; endif; else: echo "" ;endif; ?>
			</noempty>
			
			
			
			</div><?php endforeach; endif; else: echo "" ;endif; ?>
		
			
		<div class="row cl" style="padding: 10px;">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				
				<button onClick="submit_form();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存</button>
				
			</div>
		</div>
	</form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/Public/Admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="/Public/Admin/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="/Public/Admin/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="/Public/Admin/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="/Public/Admin/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script> 
<script type="text/javascript" src="/Public/Admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="/Public/Admin/lib/jquery.validation/1.14.0/messages_zh.min.js"></script> 
<script type="text/javascript" src="/Public/Admin/static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="/Public/Admin/static/h-ui/js/H-ui.admin.js"></script> 
 <script type="text/javascript">
    (function(){
    	
        var ThinkPHP = window.Think = {
            "ROOT"   : "", //当前网站地址
            "APP"    : "/index.php", //当前项目地址
            "PUBLIC" : "/Public", //项目公共目录地址
            "DEEP"   : "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
            "MODEL"  : ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
            "VAR"    : ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"]
        }
   
        
    })();
    
    
    function msg_success(data){
    	layer.msg(data,{icon: 6,time:1000});
    }
    
    function msg_error(data){
    	layer.msg(data,{icon: 5,time:1000});
    }
    
    
    function ajaxload(url,waittime=2){
   	 
    if(!url){
    	url ="<?php echo U();?>";
    }
    	
   	 var interval = setInterval(function(){
   	     	var time = --waittime;
   	     	if(time <= 0) {
   	     		location.href = url;
   	     		clearInterval(interval);
   	     	};
   	     }, 1000);
    }
    
    
    
    </script>
<script type="text/javascript" src="/Public/All/js/think.js"></script>
<script type="text/javascript" src="/Public/All/js/common.js"></script>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	$.Huitab("#tab-system .tabBar span","#tab-system .tabCon","current","click","0");
});

function submit_form(url = "<?php echo U('Config/save');?>") {
	$.ajax({
		cache : true,
		type : "POST",
		url : url,
		data : $('#fromcreate').serialize(),// 你的formid
		async : false,
		error : function(request) {
			msg_error('网络错误,请稍后重试!');
		
		},
		success : function(data) {
			if (data.status == 1) {
				
				msg_success(data.info);
				
				ajaxload("<?php echo U('');?>");
				
			
			} else {
				msg_error(data.info);
			}
		}
	});

}
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>