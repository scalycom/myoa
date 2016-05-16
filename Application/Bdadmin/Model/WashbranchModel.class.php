<?php
// +----------------------------------------------------------------------
// | Budaohuaxia [ CHUANGJIANG ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.chuangjiangnet.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: zhizunbao
// +----------------------------------------------------------------------
namespace Bdadmin\Model;

use Think\Model;

class WashbranchModel extends Model
{

    protected $_validate = array(
        array(
            'wb_name',
            'require',
            '用户名不能为空',
            self::MUST_VALIDATE,
            'regex',
            self::MODEL_BOTH
        ),
        array(
            'wb_name',
            '',
            '用户名已存在',
            self::MUST_VALIDATE,
            'unique',
            1
        ),
        array(
            'branch_name',
            'require',
            '请填写加盟店名'
        )
        ,
        array(
            'branch_pass',
            'require',
            '密码不能为空',
            self::MUST_VALIDATE,
            'regex',
            self::MODEL_BOTH
        ),
        array(
            'phone',
            '/^[1][3-9][0-9]{9}$/',
            '手机号码格式不正确',
            self::MUST_VALIDATE,
            'regex',
            self::MODEL_BOTH
        ),
        array(
            'province',
            '/^[0-9]{1,10}$/',
            '请选择省！'
        ),
        array(
            'city',
            '/^[0-9]{1,10}$/',
            '请选择市'
        ),
        array(
            'district',
            '/^[0-9]{1,10}$/',
            '请选择县'
        ),
        array(
            'branch_pass',
            'require',
            '请填写密码',
            self::MUST_VALIDATE,
            'regex',
            1
        )
    );

    protected $_auto = array(
        array(
            'create_time',
            NOW_TIME,
            self::MODEL_INSERT
        )
       
    );

    public function update($type = 2)
    {
        $data = $this->create($_POST, $type);
        
        if (! $data) {
            $this->error = $this->getError();
            
            return false;
        }
        
        if ($data['branch_pass']) {
            $data['branch_pass'] = md5($data['branch_pass']);
        }
        
        $data['md5_name'] = md5($data['wb_name']);
        
        if ($data['wb_id']) {
            $return = $this->save($data);
        } else {
            $return = $this->add($data);
            $data['wb_id'] = $return;
        }
        
        return $data;
    }

    public function get_error()
    {
        return $this->error;
    }
}
