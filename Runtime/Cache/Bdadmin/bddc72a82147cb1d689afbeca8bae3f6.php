<?php if (!defined('THINK_PATH')) exit();?>
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
<meta charset="utf-8">
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
				 onclick="config_edit('添加菜单','<?php echo U('add');?>','800')"><i class="Hui-iconfont">&#xe600;</i> 添加</a></span> 
		</div>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
					
						<th width="25"><input type="checkbox" ></th>
						<th width="80">ID</th>
						<th width="80">名称</th>
						<th width="80">标题</th>
						<th width="80">分组</th>
						<th width="120">类型</th>
						<th width="120">操作</th>
						
					</tr>
				</thead>
				<tbody>
					<?php if(!empty($list)): if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$config): $mod = ($i % 2 );++$i;?><tr class="text-c">
						<td><input class="ids row-selected" type="checkbox" name="id[]" value="<?php echo ($config["id"]); ?>"></td>
						<td><?php echo ($config["id"]); ?></td>
						<td><a  onclick="config_edit('添加菜单','<?php echo U('edit?id='.$config['id']);?>','800')" href="javascript:void(0);"><?php echo ($config["name"]); ?></a></td>
						<td><?php echo ($config["title"]); ?></td>
						<td><?php echo (get_config_group($config["group"])); ?></td>
						<td><?php echo (get_config_type($config["type"])); ?></td>
						<td>
							<a title="编辑" onclick="config_edit('添加菜单','<?php echo U('edit?id='.$config['id']);?>','800')" href="javascript:void(0);">编辑</a>
							<a class="confirm ajax-get" title="删除" href="<?php echo U('del?id='.$config['id']);?>">删除</a>
						</td>
					</tr><?php endforeach; endif; else: echo "" ;endif; ?>
				<?php else: ?>
				<td colspan="6" class="text-center"> aOh! 暂时还没有内容! </td><?php endif; ?>
				</tbody>
			</table>
			
			   <?php echo ($_page); ?>
		</div>
	</div>


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
<script type="text/javascript" src="/Public/Admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 


	<script type="text/javascript">

		
		function config_edit(title, url, w, h) {
			layer_show(title, url, w, h);
		}
		
		
	</script>
		
		
		
		
		
</body>
</html>