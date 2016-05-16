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

class GoodsModel extends Model
{

    protected $_validate = array(
        array(
            'goods_name',
            'require',
            '商品名称不能为空',
            self::MUST_VALIDATE,
            'regex',
            self::MODEL_BOTH
        ),
        array(
            'shop_price',
            '/^[0-9]+(.[0-9]{1,2})?$/',
            '商品价格不正确',
            self::MUST_VALIDATE
        ),
        array(
            'market_price',
            '/^[0-9]+(.[0-9]{1,2})?$/',
            '市场价格不正确',
            self::MUST_VALIDATE
        ),
        array(
            'cat_id',
            '/^[0-9]{1,10}$/',
            '请选择商品分类',
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
        if ($data['promote_start_time']) {
            
            $data['promote_start_time'] = strtotime($data['promote_start_time']);
            
            if ($data['promote_end_time']) {
                $data['promote_end_time'] = strtotime($data['promote_end_time']);
            }
            
            if ($data['promote_end_time'] < $data['promote_start_time']) {
                $this->error = '促销结束时间不能小于开始时间!';
                return false;
            }
        }
        
        if (! $data['goods_id']) {
            $return = $this->add($data);
            if (! $return) {
                $this->error = '添加失败model';
                return false;
            } else {
                $data['goods_id'] = $return;
            }
        } else {
            
            $goods = $this->where('goods_id = '.intval($data['goods_id']))->find();
            
            //是否重写图片
            $is_img = $goods['orign_img'] == $data['orign_img']?1:0;
            
            $return = $this->save($data);
            
            $data['is_img'] = $is_img;
            
        }
        
        return $data;
    }

    public function get_error()
    {
        return $this->error;
    }
}
