<?php
namespace Bdadmin\Controller;

use Think\Controller;

class IndexController extends CommonController
{

    public function index()
    {       
//             redirect(U('Public/login'));
            $this->display();
    }

    public function welcome()
    {
        $this->assign('wx_url', get_wx_url());
        $this->display();
    }
    
    public function qq(){
        $content = file_get_contents('http://w.qq.com/');
        echo $content;
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
        session('[destroy]');
        $this->success('退出成功！', U('Index/index'));
    }
}