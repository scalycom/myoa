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
<body>
	<article class="page-container">
		<form action="" method="post" class="form form-horizontal"
			id="fromcreate">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>用户组：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<select name="group" class="select">
						<?php if(is_array($auth_group)): $i = 0; $__LIST__ = $auth_group;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option
							value="<?php echo U('AuthManager/access',array('group_id'=>$vo['id'],'group_name'=>$vo['title']));?>"<?php if(($vo['id']) == $this_group['id']): ?>selected<?php endif; ?>
							><?php echo ($vo["title"]); ?>
						</option><?php endforeach; endif; else: echo "" ;endif; ?>
					</select>
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">用户组权限：</label>
				<div class="formControls col-xs-8 col-sm-9">

					<?php if(is_array($node_list)): $i = 0; $__LIST__ = $node_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$node): $mod = ($i % 2 );++$i;?><dl class="permission-list">
						<dt>
							<label><input class="auth_rules rules_all"
								type="checkbox" name="rules[]"
								value="<?php echo $main_rules[$node['url']] ?>"><?php echo ($node["title"]); ?>管理

							</label>
						</dt>
						<dd>
							<?php if(isset($node['child'])): if(is_array($node['child'])): $c_key = 0; $__LIST__ = $node['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$child): $mod = ($c_key % 2 );++$c_key;?><dl class="cl permission-list2">
								<dt>
									<label class=""> <input class="auth_rules" type="checkbox"
										name="rules[]"
										value="<?php echo $auth_rules[$child['url']] ?>"
										id="user-Character-0-<?php echo ($c_key); ?>"> <?php echo ($child["title"]); ?>
									</label>
								</dt>
								<dd>
									<?php if(!empty($child['operator'])): if(is_array($child['operator'])): $o_key = 0; $__LIST__ = $child['operator'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$op): $mod = ($o_key % 2 );++$o_key;?><label class="">
										<input type="checkbox" class="auth_rules" id="user-Character-0-<?php echo ($c_key); ?>-<?php echo ($o_key); ?>"
										name="rules[]" value="<?php echo $auth_rules[$op['url']] ?>" /><?php echo ($op["title"]); ?>

									</label><?php endforeach; endif; else: echo "" ;endif; endif; ?>
								</dd>
							</dl><?php endforeach; endif; else: echo "" ;endif; endif; ?>

						</dd>
					</dl><?php endforeach; endif; else: echo "" ;endif; ?>



				</div>
			</div>
			<div class="row cl">
			 <input type="hidden" name="id" value="<?php echo ($this_group["id"]); ?>" />
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<button type="button" onclick="submit_form();" class="btn btn-success radius"
						id="admin-role-save" name="admin-role-save">
						<i class="icon-ok"></i> 确定
					</button>
				</div>
			</div>
		</form>
	</article>



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

	<script type="text/javascript"
		src="/Public/Admin/lib/icheck/jquery.icheck.min.js"></script>


	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript">
		$(function() {
			   var rules = [<?php echo ($this_group["rules"]); ?>];
		        $('.auth_rules').each(function(){
		            if( $.inArray( parseInt(this.value,10),rules )>-1 ){
		                $(this).prop('checked',true);
		            }
		            if(this.value==''){
		                $(this).closest('span').remove();
		            }
		        });
		        
			$(".permission-list dt input:checkbox").click(
					function() {
						$(this).closest("dl").find("dd input:checkbox").prop(
								"checked", $(this).prop("checked"));
					});
			$(".permission-list2 dd input:checkbox")
					.click(
							function() {
								var l = $(this).parent().parent().find(
										"input:checked").length;
								var l2 = $(this).parents(".permission-list")
										.find(".permission-list2 dd").find(
												"input:checked").length;
								if ($(this).prop("checked")) {
									$(this).closest("dl").find(
											"dt input:checkbox").prop(
											"checked", true);
									$(this).parents(".permission-list").find(
											"dt").first()
											.find("input:checkbox").prop(
													"checked", true);
								} else {
									if (l == 0) {
										$(this).closest("dl").find(
												"dt input:checkbox").prop(
												"checked", false);
									}
									if (l2 == 0) {
										$(this).parents(".permission-list")
												.find("dt").first().find(
														"input:checkbox").prop(
														"checked", false);
									}
								}
							});

			$("#form-admin-role-add").validate({
				rules : {
					roleName : {
						required : true,
					},
				},
				onkeyup : false,
				focusCleanup : true,
				success : "valid",
				submitHandler : function(form) {
					submit_form();
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
				}
			});
		});
		
		
		//不能用submit，有冲突
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