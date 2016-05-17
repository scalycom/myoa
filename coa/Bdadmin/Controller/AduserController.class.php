<?php
// +----------------------------------------------------------------------
// | Budaohuaxia [ CHUANGJIANG ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.chuangjiangnet.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: zhizunbao
// +----------------------------------------------------------------------
namespace Bdadmin\Controller;

class AduserController extends CommonController
{

    public function index()
    {
        $nickname = I('ad_name');
        $map['status'] = array(
            'egt',
            0
        );
        if (is_numeric($nickname)) {
            $map['ad_id|ad_name'] = array(
                intval($nickname),
                array(
                    'like',
                    '%' . $nickname . '%'
                ),
                '_multi' => true
            );
        } else {
            $map['ad_name'] = array(
                'like',
                '%' . (string) $nickname . '%'
            );
        }
        
        $list = $this->lists('Aduser', $map);
        int_to_string($list);
        $this->assign('_list', $list);
        $this->meta_title = '管理员信息';
        $this->display();
    }

    public function ad_add()
    {
        if (IS_POST) {
            $validate = array(
                array(
                    'ad_name',
                    '/^[a-zA-Z0-9@#]{3,20}$/',
                    '用户名不正确'
                ),
                array(
                    'ad_name',
                    '',
                    '用户名已被使用',
                    0,
                    'unique',
                    1
                ),
                array(
                    'ad_pass',
                    'require',
                    '请填写密码'
                ),
                array(
                    'repass',
                    'ad_pass',
                    '重复密码不正确',
                    0,
                    'confirm'
                )
            );
            $aduser = M('Aduser');
            $data = $aduser->validate($validate)->create();
            if(!$data){
                $this->error($aduser->getError());
            }
            $data['ad_pass'] = $this->password_encrypt($data['ad_pass']);
            $data['create_time'] = time();
            $data['login_time'] = time();
            $data['status'] = 1;
            $aduser->add($data);
            $this->success('添加成功!');
        } else {
            $this->display('ad_edit');
        }
    }

    public function ad_edit()
    {
        if (IS_POST) {
            $ad_id = intval(I('ad_id'));
            $validate = array(
      
                array(
                    'ad_pass',
                    'require',
                    '请填写密码'
                ),
                array(
                    'repass',
                    'ad_pass',
                    '重复密码不正确',
                    0,
                    'confirm'
                )
            );
            $aduser = M('Aduser');
            $data = $aduser->validate($validate)->create();
            if(!$data){
                $this->error($aduser->getError());
            }
            
            $pass['ad_pass'] = $this->password_encrypt($data['ad_pass']);
            
            $aduser->where('ad_id='.$ad_id)->save($pass);
            $this->success('修改成功!');
        } else {
            $map['ad_id'] = intval(I('id'));
            $info = M('Aduser')->where($map)->find();
            $this->assign('info',$info);
            $this->display();
        }
    }

    public function changeStatus($method = null)
    {
        $id = array_unique((array) I('id', 0));
        if (in_array(C('USER_ADMINISTRATOR'), $id)) {
            $this->error("不允许对超级管理员执行该操作!");
        }
        $id = is_array($id) ? implode(',', $id) : $id;
        if (empty($id)) {
            $this->error('请选择要操作的数据!');
        }
        $map['ad_id'] = array(
            'in',
            $id
        );
        switch (strtolower($method)) {
            case 'forbiduser':
                $this->forbid('Aduser', $map);
                break;
            case 'resumeuser':
                $this->resume('Aduser', $map);
                break;
            case 'deleteuser':
                $this->delete('Aduser', $map);
                break;
            default:
                $this->error('参数非法');
        }
    }

    /**
     * 用户行为列表
     *
     * @author huajie <banhuajie@163.com>
     */
    public function action()
    {
        // 获取列表数据
        $Action = M('Action')->where(array(
            'status' => array(
                'gt',
                - 1
            )
        ));
        $list = $this->lists($Action);
        int_to_string($list);
        // 记录当前列表页的cookie
        Cookie('__forward__', $_SERVER['REQUEST_URI']);
        
        $this->assign('_list', $list);
        $this->meta_title = '用户行为';
        $this->display();
    }

    /**
     * 新增行为
     *
     * @author huajie <banhuajie@163.com>
     */
    public function addAction()
    {
        $this->meta_title = '新增行为';
        $this->assign('data', null);
        $this->display('editaction');
    }

    /**
     * 编辑行为
     *
     * @author huajie <banhuajie@163.com>
     */
    public function editAction()
    {
        $id = I('get.id');
        empty($id) && $this->error('参数不能为空！');
        $data = M('Action')->field(true)->find($id);
        
        $this->assign('data', $data);
        $this->meta_title = '编辑行为';
        $this->display('editaction');
    }

    /**
     * 更新行为
     *
     * @author huajie <banhuajie@163.com>
     */
    public function saveAction()
    {
        $res = D('Action')->update();
        if (! $res) {
            $this->error(D('Action')->getError());
        } else {
            $this->success($res['id'] ? '更新成功！' : '新增成功！', Cookie('__forward__'));
        }
    }

    /**
     * 获取用户注册错误信息
     *
     * @param integer $code
     *            错误编码
     * @return string 错误信息
     */
    private function showRegError($code = 0)
    {
        switch ($code) {
            case - 1:
                $error = '用户名长度必须在16个字符以内！';
                break;
            case - 2:
                $error = '用户名被禁止注册！';
                break;
            case - 3:
                $error = '用户名被占用！';
                break;
            case - 4:
                $error = '密码长度必须在6-30个字符之间！';
                break;
            case - 5:
                $error = '邮箱格式不正确！';
                break;
            case - 6:
                $error = '邮箱长度必须在1-32个字符之间！';
                break;
            case - 7:
                $error = '邮箱被禁止注册！';
                break;
            case - 8:
                $error = '邮箱被占用！';
                break;
            case - 9:
                $error = '手机格式不正确！';
                break;
            case - 10:
                $error = '手机被禁止注册！';
                break;
            case - 11:
                $error = '手机号被占用！';
                break;
            default:
                $error = '未知错误';
        }
        return $error;
    }
}