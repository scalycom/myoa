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

class AgentrankModel extends Model
{

    protected $_validate = array(
        array(
            'rank_name',
            'require',
            '等级名称不能为空',
            self::MUST_VALIDATE,
            'regex',
            self::MODEL_BOTH
        ),
        array(
            'agent_level',
            '/^[0-9]+(.[0-9]{1,2})?$/',
            '请填写等级权重',
            self::MUST_VALIDATE
        )
    );

    protected $_auto = array(
        array(
            'add_time',
            NOW_TIME,
            self::MODEL_INSERT
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
     
        
        if (! $data['rank_id']) {
            $return = $this->add($data);
            if (! $return) {
                $this->error = '添加失败model';
                return false;
            } else {
                $data['rank_id'] = $return;
            }
        } else {
            $return = $this->save($data);
            if (! $return) {
                $this->error = $this->getError();
                return false;
            }
        }
        
        return $data;
    }

    public function get_error()
    {
        return $this->error;
    }
}
