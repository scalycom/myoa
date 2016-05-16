<?php
return array(
    // '配置项'=>'配置值'
    /* 数据缓存设置 */
    'DATA_CACHE_PREFIX' => 'cjnet_', // 缓存前缀
    'DATA_CACHE_TYPE' => 'File', // 数据缓存类型
    
    /* SESSION 和 COOKIE 配置 */
    'SESSION_PREFIX' => 'cjnet_bdhx_', // session前缀
    'COOKIE_PREFIX' => 'cjnet_bdhx_', // Cookie前缀 避免冲突
    'VAR_SESSION_ID' => 'session_id', // 修复uploadify插件无法传递session_id的bug
    /* 用户相关设置 */
    'USER_MAX_CACHE' => 1000, // 最大缓存用户数
    'USER_ADMINISTRATOR' => 1, // 管理员用户ID
    
    /* 数据库配置 */
    'DB_TYPE' => 'mysql', // 数据库类型
    'DB_HOST' => '101.201.211.227', // 服务器地址
    'DB_NAME' => 'budaohuaxia', // 数据库名
    'DB_USER' => 'budaohuaxia_user', // 用户名
    'DB_PWD' => 'GaGVw8TFxw8tp', // 密码
    'DB_PORT' => '3306', // 端口
    'DB_PREFIX' => 'cjnet_'
) // 数据库表前缀

;