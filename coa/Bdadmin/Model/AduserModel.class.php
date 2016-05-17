<?php
namespace Bdadmin\Model;

use Think\Model;


/**
 * 文档基础模型
 */
class AduserModel extends Model
{


    /**
     * 登录指定用户
     * 
     * @param integer $uid
     *            用户ID
     * @return boolean ture-登录成功，false-登录失败
     */
    public function login($uid)
    {
        /* 检测是否在当前应用注册 */
        $user = $this->field(true)->find($uid);
        
        if(!$user){
            $this->error='该用户不存在!';
        }
        
        /* 登录用户 */
        $this->autoLogin($user);
        
        // 记录行为
        action_log('user_login', 'aduser', $uid, $uid);
        
        return true;
    }

    /**
     * 注销当前用户
     * 
     * @return void
     */
    public function logout()
    {
        session('user_auth', null);
        session('user_auth_sign', null);
    }

    /**
     * 自动登录用户
     * 
     * @param integer $user
     *            用户信息数组
     */
    private function autoLogin($user)
    {
        /* 更新登录信息 */
        $data = array(
            'ad_id' => $user['ad_id'],
            'login' => array(
                'exp',
                '`login`+1'
            ),
            'login_time' => NOW_TIME,
            'login_ip' => get_client_ip(1)
        );
        $this->save($data);
        
        /* 记录登录SESSION和COOKIES */
        $auth = array(
            'ad_id' => $user['ad_id'],
            'ad_name' => $user['ad_name'],
            'login_time' => $user['login_time'],
            'login_ip' => $user['login_ip']
        );
        $_SESSION['ad_id'] = $user['ad_id'];
        session('user_auth', $auth);
        session('user_auth_sign', data_auth_sign($auth));

    }
    
    public function getNickName($uid){
        return $this->where(array('ad_id'=>(int)$uid))->getField('ad_name');
    }
}
