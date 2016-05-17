<?php if (!defined('THINK_PATH')) exit();?><!--_meta 作为公共模版分离出去-->

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

<title><?php echo isset($info['id'])?'编辑':'新增';?>后台菜单</title>
</head>
<body>
	<article class="page-container">
		<form class="form form-horizontal skin-minimal input" id="fromcreate"
			method="post">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">标题</label>

				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" name="title"
						value="<?php echo ((isset($info["title"]) && ($info["title"] !== ""))?($info["title"]):''); ?>">
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">排序</label>

				<div class="formControls col-xs-8 col-sm-9">

					<input type="text" class="input-text" name="sort"
						value="<?php echo ((isset($info["sort"]) && ($info["sort"] !== ""))?($info["sort"]):0); ?>">

				</div>
			</div>




			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">链接</label>

				<div class="formControls col-xs-8 col-sm-9">

					<input type="text" class="input-text" name="url"
						value="<?php echo ((isset($info["url"]) && ($info["url"] !== ""))?($info["url"]):''); ?>">

				</div>
			</div>




			<div class="row cl">

				<label class="form-label col-xs-4 col-sm-2">界面宽度</label>

				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" name="width"
						value="<?php echo ((isset($info["width"]) && ($info["width"] !== ""))?($info["width"]):'1200'); ?>">

				</div>
			</div>
			
				<div class="row cl">

				<label class="form-label col-xs-4 col-sm-2">界面高度</label>

				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" name="height"
						value="<?php echo ((isset($info["height"]) && ($info["height"] !== ""))?($info["height"]):'600'); ?>">

				</div>
			</div>

		
		<div class="row cl">

				<label class="form-label col-xs-4 col-sm-2">上级菜单</label>

				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box"> <select name="pid" class="select">
							<?php if(is_array($Menus)): $i = 0; $__LIST__ = $Menus;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><option value="<?php echo ($menu["id"]); ?>"><?php echo ($menu["title_show"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
					</select>

					</span>

				</div>
			</div>



			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">分组</label>

				<div class="formControls col-xs-8 col-sm-9">

					<input type="text" class="input-text" name="group"
						value="<?php echo ((isset($info["group"]) && ($info["group"] !== ""))?($info["group"]):''); ?>">

				</div>
			</div>


			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">缩略图：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<div class="uploader-thum-container">

						<input type="hidden" name="menu_img" value="<?php echo ($info["menu_img"]); ?>"
							id="menu_img" />
						<div id="filePicker" class="button">选择图片</div>
						<div id="cover_id">
							<?php if(!empty($info["menu_img"])): ?><div class="upload-pre-item">
								<img width="200px" height="200px" src="<?php echo ($info["menu_img"]); ?>" />
							</div><?php endif; ?>

						</div>
						<button id="upload_start" type="button"
							class="btn btn-default btn-uploadstar radius ml-10">开始上传</button>
					</div>
				</div>
			</div>


			<div class="row cl">

				<label class="form-label col-xs-4 col-sm-2">是否隐藏</label>

				<div class="formControls col-xs-8 col-sm-9">

					<div class="switch size-S">
						<label class="radio"><input type="radio" name="hide"
							value="1" />是</label> <label class="radio"><input type="radio"
							name="hide" value="0" />否</label>
					</div>

				</div>
			</div>
			<div class="row cl">

				<label class="form-label col-xs-4 col-sm-2">仅开发者模式可见<span
					class="check-tips"></span></label>

				<div class="formControls col-xs-8 col-sm-9">

					<label class="radio"><input type="radio" name="is_dev"
						value="1">是</label> <label class="radio"><input
						type="radio" name="is_dev" value="0">否</label>

				</div>

			</div>



			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">说明：</label>

				<div class="formControls col-xs-8 col-sm-9 skin-minimal">
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" name="tip"
							value="<?php echo ((isset($info["tip"]) && ($info["tip"] !== ""))?($info["tip"]):''); ?>">
					</div>
				</div>
			</div>




			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
					<input type="hidden" name="id" value="<?php echo ((isset($info["id"]) && ($info["id"] !== ""))?($info["id"]):''); ?>">

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
<script type="text/javascript" src="/Public/Admin/static/uploadify/jquery.uploadify.min.js"></script>


	<!--请在下方写此页面业务相关的脚本-->

	<script type="text/javascript">
        Think.setValue("pid", <?php echo ((isset($info["pid"]) && ($info["pid"] !== ""))?($info["pid"]): 0); ?>);
        Think.setValue("hide", <?php echo ((isset($info["hide"]) && ($info["hide"] !== ""))?($info["hide"]): 0); ?>);
        Think.setValue("is_dev", <?php echo ((isset($info["is_dev"]) && ($info["is_dev"] !== ""))?($info["is_dev"]): 0); ?>);
    	var index = parent.layer.getFrameIndex(window.name);

    	function submit_form(url = "<?php echo U('');?>") {
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
    					
    					parent.ajaxload("<?php echo U('menulist?pid='.$info['pid']);?>");
    					
    					parent.layer.close(index);
    				} else {
    					msg_error(data.info);
    				}
    			}
    		});

    	}
    	

    	//上传图片
    	/* 初始化上传插件 */
    	$("#filePicker").uploadify({
    	    "height"          : 30,
    	    "swf"             : "/Public/Admin/static/uploadify/uploadify.swf",
    	    "fileObjName"     : "download",
    	    "buttonText"      : "选择图片",
    	    "uploader"        : "<?php echo U('File/uploadimg/',array('session_id'=>session_id()));?>",
    	    "width"           : 120,
    	    'removeTimeout'	  : 1,
    	    'fileTypeExts'	  : '*.jpg; *.png; *.gif;',
    	    "onUploadSuccess" : uploadPicture,
    	    'auto':false,
    	    'onFallback' : function() {
    	        alert('未检测到兼容版本的Flash.');
    	    }
    	});

    	$('#upload_start').click(function(){
    		$("#filePicker").uploadify('upload');
    	});


    	function uploadPicture(file, data){
    		var data = $.parseJSON(data);
    		var src = '';
    	    if(data.status){
    	    	$("#cover_id").val(data.path);
    	    	src = data.url || '' + data.path
    	    	$('#menu_img').val(src);
    	    /* 	alert($('#menu_img').val()); */
    	    	$("#cover_id").html(
    	    		'<div class="upload-pre-item"><img width="200px" height="200px" src="' + src + '"/></div>'
    	    	);
    	    } else {
    	    	msg_error(data.info);
    	    	setTimeout(function(){
    	    		$('#upload_start').attr('disabled','disabled');
    	        },1500);
    	    }
    	}


    </script>

	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>