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
		<div class="cl pd-5 bg-1 bk-gray">
			<span class="l"> <a href="javascript:;" onclick="datadel()"
				class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
					批量删除</a> <a class="btn btn-primary radius" href="javascript:;"
				onclick="menu_add('添加菜单','<?php echo U('add',array('pid'=>I('get.pid',0)));?>','800')"><i
					class="Hui-iconfont">&#xe600;</i> 添加菜单</a>
			</span> 
		</div>
		<table class="table table-border table-bordered table-hover table-bg">
			<thead>
				<tr>
					<th scope="col" colspan="10">菜单管理</th>
				</tr>
				<tr class="text-c">
					<th width="25"><input type="checkbox" value="" name="menuid"></th>
					<th width="40">ID</th>
					<th width="120">名称</th>
					<th width="80">上级菜单</th>
					<th> 分组</th>
					<th width="200">URL</th>
					<th>排序</th>
					<th>仅开发显示</th>
					<th>隐藏</th>

					<th width="70">操作</th>
				</tr>
			</thead>
			<tbody>

		<?php if(!empty($list)): if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><tr class="text-c">
					<td>
					<input type="checkbox" value="" type="checkbox" name="id[]" value="<?php echo ($menu["id"]); ?>">
					</td>
					<td><?php echo ($menu["id"]); ?></td>
					<td><a href="<?php echo U('menulist?pid='.$menu['id']);?>"><?php echo ($menu["title"]); ?></a></td>
					<td><a href="#"><?php echo ((isset($menu["up_title"]) && ($menu["up_title"] !== ""))?($menu["up_title"]):'无'); ?></a></td>
					
					<td><?php echo ($menu["group"]); ?></td>
					<td><?php echo ($menu["url"]); ?></td>
					
					<td><?php echo ($menu["sort"]); ?></td>
					  <td>
                            <a href="<?php echo U('toogleDev',array('id'=>$menu['id'],'value'=>abs($menu['is_dev']-1)));?>" class="ajax-get">
                            <?php echo ($menu["is_dev_text"]); ?>
                            </a>
                        </td>
                        <td>
                            <a href="<?php echo U('toogleHide',array('id'=>$menu['id'],'value'=>abs($menu['hide']-1)));?>" class="ajax-get">
                            <?php echo ($menu["hide_text"]); ?>
                            </a>
                        </td>
					
					<td class="f-14"><a title="编辑" href="javascript:;"
						onclick="menu_edit('菜单编辑','<?php echo U('edit?id='.$menu['id']);?>','1')"
						style="text-decoration: none"><i class="Hui-iconfont">&#xe6df;</i></a>
						<a title="删除" href="<?php echo U('del?id='.$menu['id']);?>"
						 class="ajax-get ml-5 confirm"
						style="text-decoration: none"><i class="Hui-iconfont">&#xe6e2;</i></a>
						
						</td>
				</tr><?php endforeach; endif; else: echo "" ;endif; ?>
				<?php else: ?>
				<td colspan="10" class="text-center"> 暂时还没有内容! </td><?php endif; ?>

			</tbody>
		</table>
		
		   <div class="page">
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




	<!-- js操作S -->
	<script type="text/javascript">
		/*管理员-菜单-添加*/
		function menu_add(title, url, w, h) {
			layer_show(title, url, w, h);
		}
		/*管理员-菜单-编辑*/
		function menu_edit(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}

	</script>
	<!-- js操作E -->
</body>
</html>