<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
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

		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:;" onclick="datadel()"
				class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
					批量删除</a> <a class="btn btn-primary radius" data-title="添加"
				onclick="edit('添加管理员','<?php echo U('Aduser/ad_add');?>','800')"><i
					class="Hui-iconfont">&#xe600;</i> 添加</a> </span>

			<!-- <span class="r">共有数据：<strong>88</strong> 条
			</span> -->
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="" value=""></th>
						<th width="60">ID</th>
						<th width="100">用户名</th>
						<th width="40">登录次数</th>
						<th width="100">最后登录时间</th>
						<th width="40">状态</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
					<?php if(!empty($_list)): if(is_array($_list)): $i = 0; $__LIST__ = $_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr class="text-c">
						<td><input type="checkbox" name="id[]" value="<?php echo ($vo["ad_id"]); ?>"></td>
						<td><?php echo ($vo["ad_id"]); ?></td>
						<td><a><?php echo ($vo["ad_name"]); ?></a></td>

						<td><?php echo ($vo["login"]); ?></td>
						<td><?php echo (date("Y-m-d H:i:s",$vo["login_time"])); ?></td>
						<td><?php echo ($vo["status_text"]); ?></td>

						<td class="td-manage"><?php if(($vo["status"]) == "1"): ?><a
								href="<?php echo U('Aduser/changeStatus?method=forbiduser&id='.$vo['ad_id']);?>"
								class="ajax-get">禁用</a> <?php else: ?> <a
								href="<?php echo U('Aduser/changeStatus?method=resumeuser&id='.$vo['ad_id']);?>"
								class="ajax-get">启用</a><?php endif; ?> 
								
					<a title="修改密码" onclick="edit('修改密码','<?php echo U('Aduser/ad_edit/id/'.$vo['ad_id']);?>','800')"
							class="ml-5" style="text-decoration: none">修改密码</a>
					<a title="授权"
							onclick="edit('用户组授权','<?php echo U('AuthManager/group?ad_id='.$vo['ad_id']);?>','800')"
							class="ml-5 " style="text-decoration: none">授权</a> 
							
				   <a title="删除"
							href="<?php echo U('Aduser/changeStatus?method=deleteuser&id='.$vo['ad_id']);?>"
							class="ml-5 ajax-get confirm" style="text-decoration: none">删除</a>

						</td>

					</tr><?php endforeach; endif; else: echo "" ;endif; ?> <?php else: ?>
					<td colspan="6" class="text-center">aOh! 暂时还没有内容!</td><?php endif; ?>
				</tbody>
			</table>
		</div>
	</div>



	<!--_footer 作为公共模版分离出去-->
	
<script>
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
</script>

<script type="text/javascript" src="/Public/Admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/Public/Admin/lib/layer/2.1/layer.js"></script>
<script type="text/javascript"
	src="/Public/Admin/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/Public/Admin/lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript"
	src="/Public/Admin/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="/Public/Admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript"
	src="/Public/Admin/lib/jquery.validation/1.14.0/messages_zh.min.js"></script>
<script type="text/javascript" src="/Public/Admin/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="/Public/Admin/static/h-ui/js/H-ui.admin.js"></script>
<script type="text/javascript">
	function msg_success(data){
    	layer.msg(data,{icon: 6,time:1000});
    }
    
    function msg_error(data){
    	layer.msg(data,{icon: 5,time:1000});
    }
    
    
    function ajaxload(url,waittime){
   	if(!waittime){
   		waittime=2;
   	}
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



	<script type="text/javascript">
		function edit(title, url, w, h) {
			layer_show(title, url, w, h);
		}
	</script>
</body>
</html>