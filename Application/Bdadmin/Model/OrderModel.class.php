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

class OrderModel extends Model
{

    protected $_validate = array(
        array(
            'order_id',
            'require',
            '订单ID不能为空',
            self::MUST_VALIDATE,
            'regex',
            self::MODEL_BOTH
        ),
        array(
            'status',
            array(
                0,
                1,
                10
            ),
            '订单状态不正确！',
            2,
            'in'
        ),
        array(
            'ship_status',
            array(
                0,
                1,
                10
            ),
            '发货状态不正确！',
            2,
            'in'
        )
    );



    public function update()
    {
        $data = $this->create();
        
        if (! $data) {
            $this->error = $this->getError();
            
            return false;
        }

       $return = $this->save($data);
       
        
        return $data;
    }

    public function get_error()
    {
        return $this->error;
    }
}
