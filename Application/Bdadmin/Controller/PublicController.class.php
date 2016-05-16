<?php
namespace Bdadmin\Controller;
use Think\Controller;
class PublicController extends BdadminController {
    
    /**
     * 后台用户登录
     */
    public function login($username = null, $password = null, $verify = null){
        if(IS_POST){
            /* 检测验证码 TODO: */
            if(!check_verify($verify)){
                $this->error('验证码输入错误！');
            }
            
            $map['ad_name']  = remove_xss(compile_str($username));
            $map['ad_pass'] = $this->password_encrypt($password);
            $map['status'] = 1;
            $user = M('Aduser')->where($map)->find();
            $ad_id = $user?$user['ad_id']:-1;
            
            if(0 < $ad_id){ //UC登录成功
                /* 登录用户 */
                $ad_user = D('Aduser');
                if($ad_user->login($ad_id)){ //登录用户
                    //TODO:跳转到登录前页面
                    $this->success('登录成功！', U('Index/index'));
                } else {
                    $this->error($ad_user->getError());
                }
    
            } else { //登录失败
                switch($ad_id) {
                    case -1: $error = '用户帐号密码错误！'; break; //系统级别禁用
                    default: $error = '未知错误！'; break; // 0-接口参数错误（调试阶段使用）
                }
                $this->error($error);
            }
        } else {
            if(is_login()){
                $this->redirect('Index/index');
            }else{
                 
                $this->display();
            }
        }
    }
    

    /* 退出登录 */
    public function logout(){
        if(is_login()){
            D('Aduser')->logout();
            session('[destroy]');
            $this->success('退出成功！', U('login'));
        } else {
            $this->redirect('login');
        }
    }
    
    public function passwd(){
        $id = $_GET['p'];
//         var_dump($this->password_encrypt('chuangjiangadmin'));
//         var_dump(time());
//         var_dump(get_client_ip());
    }
    
    public function verify(){
        $config =    array(
            'imageW' =>150,
            'imageH'=>40,
            'fontSize'    =>    20,    // 验证码字体大小
            'length'      =>    4,     // 验证码位数
            'useNoise'    =>    false, // 关闭验证码杂点
        );
        $verify = new \Think\Verify($config);
        $verify->entry(1);
    }
    
    
    
 
}