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

class InsuranceModel extends Model
{

    protected $_validate = array(
        array(
            'in_name',
            'require',
            '名称不能为空',
            self::MUST_VALIDATE,
            'regex',
            self::MODEL_BOTH
        ),
        array(
            'price',
            '/^[0-9]+(.[0-9]{1,2})?$/',
            '单位价格不正确',
            self::MUST_VALIDATE
        ),
        array(
            'time',
            '/^[0-9]{1,10}$/',
            '有效时间不正确',
            self::MUST_VALIDATE
        )
    );

    protected $_auto = array(
        array(
            'update_time',
            NOW_TIME,
            self::MODEL_INSERT
        ),
        array(
            'status',
            '1',
            self::MODEL_BOTH
        )
    );

    public function update()
    {
        $data = $this->create();
        
        if (! $data) {
           
            $this->error = $this->getError();
            return false;
            
        }
        $data['time'] = $data['time']*3600*24;
        $data['in_id'] = 1;
        $return = $this->save($data);
        
        return $data;
    }

    public function get_error()
    {
        return $this->error;
    }
}
