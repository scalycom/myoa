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

class WashModel extends Model
{

    protected $_validate = array(
        array(
            'wname',
            'require',
            '洗车名称不能为空',
            self::MUST_VALIDATE,
            'regex',
            self::MODEL_BOTH
        ),
        array(
            'price',
            '/^[0-9]+(.[0-9]{1,2})?$/',
            '洗车价格不正确',
            self::MUST_VALIDATE
        ),
        array(
            'count',
            '/^[0-9]{1,10}$/',
            '周期次数不正确',
            self::MUST_VALIDATE
        ),
        array(
            'cycle_time',
            '/^[0-9]{1,10}$/',
            '周期时间不正确',
            self::MUST_VALIDATE
        ),
        array(
            'time',
            '/^[0-9]{1,10}$/',
            '有效时间不正确',
            self::MUST_VALIDATE
        )
    )
    ;

    protected $_auto = array(
        array(
            'add_time',
            NOW_TIME,
            self::MODEL_INSERT
        ),
        array(
            'status',
            '1',
            self::MODEL_BOTH
        )
    )
    ;

    public function update()
    {
        $data = $this->create();
        
        if (! $data) {
            $this->error = $this->getError();
            
            return false;
        }
        
        if($data['cycle_time']>$data['time']){
            
            $this->error = '周期时间不能大于有效时间!';
            return false;
            
        }
        
        if(!$data['count']){
            
            $this->error = '周期次数不能为0';
            return false;
            
        }
        
        $data['cycle_time'] = $data['cycle_time']*3600*24;
        $data['time'] = $data['time']*3600*24;
        
        if (! $data['wid']) {
            $return = $this->add($data);
            if (! $return) {
                $this->error = '添加失败model';
                return false;
            } else {
                $data['wid'] = $return;
            }
        } else {
       
            $return = $this->save($data);
         
        }
        
        return $data;
    }

    public function get_error()
    {
        return $this->error;
    }
}
