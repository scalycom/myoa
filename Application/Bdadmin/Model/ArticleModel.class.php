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

class ArticleModel extends Model
{

    protected $_validate = array(
        array(
            'title',
            'require',
            '文章名称不能为空',
            self::MUST_VALIDATE,
            'regex',
            self::MODEL_BOTH
        ),
        
        array(
            'cid',
            '/^[0-9]{1,10}$/',
            '请选择文章分类',
            self::MUST_VALIDATE
        )
    );

    protected $_auto = array(
        array(
            'create_time',
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
    
        
        if (! $data['aid']) {
            $return = $this->add($data);
            if (! $return) {
                $this->error = '添加失败model';
                return false;
            } else {
                $data['aid'] = $return;
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
