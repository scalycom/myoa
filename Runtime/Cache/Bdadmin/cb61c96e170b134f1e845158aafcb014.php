<?php if (!defined('THINK_PATH')) exit();?><!--_meta 作为公共模版分离出去111-->

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

<title>用户组</title>
</head>
<body>
	<article class="page-container">
		<form class="form form-horizontal skin-minimal input" id="fromcreate"
			method="post">


			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">用户组</label>

				<div class="formControls col-xs-8 col-sm-9">

					<input id="auth-title" type="text" name="title"
						class="text input-text" value="<?php echo ($auth_group["title"]); ?>" />


				</div>
			</div>




			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">描述</label>

				<div class="formControls col-xs-8 col-sm-9">
					
					<textarea id="auth-description" type="text" class="textarea" name="description"><?php echo ($auth_group["description"]); ?></textarea>
					
				</div>
			</div>




			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">

					<input type="hidden" name="id" value="<?php echo ($auth_group["id"]); ?>" />
					<button class="btn btn-primary radius" type="button"
						onclick="submit_form();">
						<i class="Hui-iconfont">&#xe632;</i> 提交
					</button>

				</div>
			</div>
		</form>
	</article>

	<!-- 底部js引入S-->
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
	<!-- 底部js引入E-->



	<!--请在下方写此页面业务相关的脚本-->

	<script type="text/javascript">

    	var index = parent.layer.getFrameIndex(window.name);

    	function submit_form(url = "<?php echo U('AuthManager/writeGroup');?>") {
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
    					
    					parent.msg_success(data.info);
    					
    					parent.ajaxload("<?php echo U('AuthManager/index');?>");
    					
    					parent.layer.close(index);
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