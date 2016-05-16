<?php
return array(
    // '配置项'=>'配置值'
    'SHOW_PAGE_TRACE'=>true,
    /* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__STATIC__' => __ROOT__ . '/Public/Admin/static',
        '__ADDONS__' => __ROOT__ . '/Public/Admin/static/h-ui/Addons',
        '__IMG__' => __ROOT__ . '/Public/Admin/static/h-ui/images',
        '__CSS__' => __ROOT__ . '/Public/Admin/static/h-ui/css',
        '__JS__' => __ROOT__ . '/Public/Admin/static/h-ui/js',
        '__LIB__' => __ROOT__ . '/Public/Admin/lib',
        '__TEMP__' => __ROOT__ . '/Public/Admin/temp',
        '__SKIN__' => __ROOT__ . '/Public/Admin/static/h-ui/skin',
        '__ALL__'=>__ROOT__.'/Public/All'
    ),

    /* 后台错误页面模板 */
    'TMPL_ACTION_ERROR'     =>  MODULE_PATH.'View/Public/error.html', // 默认错误跳转对应的模板文件
    'TMPL_ACTION_SUCCESS'   =>  MODULE_PATH.'View/Public/success.html', // 默认成功跳转对应的模板文件
    'TMPL_EXCEPTION_FILE'   =>  MODULE_PATH.'View/Public/exception.html',// 异常页面的模板文件
)
;