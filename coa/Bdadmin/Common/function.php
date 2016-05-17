<?php

/**
 * 后台公共文件
 * 主要定义后台公共函数库
 */

/**
 * 检测用户是否登录
 * 
 * @return integer 0-未登录，大于0-当前登录用户ID
 */
function is_login()
{
    $user = session('user_auth');
    if (empty($user)) {
        return 0;
    } else {
        return session('user_auth_sign') == data_auth_sign($user) ? $user['ad_id'] : 0;
    }
}

/**
 * 检测验证码
 * 
 * @param integer $id
 *            验证码ID
 * @return boolean 检测结果
 */
function check_verify($code, $id = 1)
{
    $verify = new \Think\Verify();
    return $verify->check($code, $id);
}

/**
 * 获取配置的类型
 * 
 * @param string $type
 *            配置类型
 * @return string
 */
function get_config_type($type = 0)
{
    $list = C('CONFIG_TYPE_LIST');
    return $list[$type];
}

/**
 * 获取配置的分组
 * 
 * @param string $group
 *            配置分组
 * @return string
 */
function get_config_group($group = 0)
{
    $list = C('CONFIG_GROUP_LIST');
    return $group ? $list[$group] : '';
}



/**
 * 获取微信服务器地址
 */
function get_wx_url()
{
    return 'http://' . C('WEB_DOMIN') . '/index.php/Index/index';
}

// 分析枚举类型配置值 格式 a:名称1,b:名称2
function parse_config_attr($string)
{
    $array = preg_split('/[,;\r\n]+/', trim($string, ",;\r\n"));
    if (strpos($string, ':')) {
        $value = array();
        foreach ($array as $val) {
            list ($k, $v) = explode(':', $val);
            $value[$k] = $v;
        }
    } else {
        $value = $array;
    }
    return $value;
}

function clearcache()
{
    $cahce_dirs = RUNTIME_PATH;
    $this->rmdirr($cahce_dirs);
    
    @mkdir($cahce_dirs, 0777, true);
    $this->display();
}

function rmdirr($dirname)
{
    if (! file_exists($dirname)) {
        return false;
    }
    if (is_file($dirname) || is_link($dirname)) {
        return unlink($dirname);
    }
    $dir = dir($dirname);
    if ($dir) {
        while (false !== $entry = $dir->read()) {
            if ($entry == '.' || $entry == '..') {
                continue;
            }
            $this->rmdirr($dirname . DIRECTORY_SEPARATOR . $entry);
        }
    }
    $dir->close();
    return rmdir($dirname);
}



