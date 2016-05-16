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

class AgentcardModel extends Model
{

    protected $_validate = array(
        array(
            'card_name',
            'require',
            '名片名称不能为空',
            self::MUST_VALIDATE,
            'regex',
            self::MODEL_BOTH
        ),
        array(
            'head_img_x',
            '/^[0-9]+(.[0-9]{1,6})?$/',
            '请填写正确的头像横向位置!',
            self::MUST_VALIDATE
        ),
        array(
            'head_img_y',
            '/^[0-9]+(.[0-9]{1,6})?$/',
            '请填写正确的头像纵向位置!',
            self::MUST_VALIDATE
        ),
        array(
            'head_img_size',
            '/^[0-9]+(.[0-9]{1,6})?$/',
            '请填写正确的头像大小!',
            self::MUST_VALIDATE
        ),
        array(
            'erweima_x',
            '/^[0-9]+(.[0-9]{1,6})?$/',
            '请填写正确的二维码横向位置!',
            self::MUST_VALIDATE
        ),
        array(
            'erweima_y',
            '/^[0-9]+(.[0-9]{1,6})?$/',
            '请填写正确的二维码纵向位置!',
            self::MUST_VALIDATE
        ),
        array(
            'erweima_size',
            '/^[0-9]+(.[0-9]{1,6})?$/',
            '请填写正确的二维码大小!',
            self::MUST_VALIDATE
        ),
        array(
            'name_x',
            '/^[0-9]+(.[0-9]{1,6})?$/',
            '请填写正确的姓名横向位置!',
            self::MUST_VALIDATE
        ),
        array(
            'name_y',
            '/^[0-9]+(.[0-9]{1,6})?$/',
            '请填写正确的姓名纵向位置!',
            self::MUST_VALIDATE
        ),
        array(
            'name_color',
            '/^[0-9a-zA-Z#]{1,10}$/',
            '请填写正确的姓名颜色!',
            self::MUST_VALIDATE
        ),
        array(
            'name_size',
            '/^[0-9a-zA-Z]{1,10}$/',
            '请填写正确的姓名字体大小!',
            self::MUST_VALIDATE
        ),
        array(
            'name_text_x',
            '/^[0-9]+(.[0-9]{1,6})?$/',
            '请填写正确的名称横向位置!',
            self::MUST_VALIDATE
        ),
        array(
            'name_text_y',
            '/^[0-9]+(.[0-9]{1,6})?$/',
            '请填写正确的名称纵向位置!',
            self::MUST_VALIDATE
        ),
        array(
            'name_text_color',
            '/^[0-9a-zA-Z#]{1,10}$/',
            '请填写正确的名称颜色!',
            self::MUST_VALIDATE
        ),
        array(
            'name_text_size',
            '/^[0-9a-zA-Z]{1,10}$/',
            '请填写正确的名称字体大小!',
            self::MUST_VALIDATE
        ),
        
        array(
            'shop_x',
            '/^[0-9]+(.[0-9]{1,6})?$/',
            '请填写正确的商店名称横向位置!',
            self::MUST_VALIDATE
        ),
        array(
            'shop_y',
            '/^[0-9]+(.[0-9]{1,6})?$/',
            '请填写正确的商店名称纵向位置!',
            self::MUST_VALIDATE
        ),
        array(
            'shop_color',
            '/^[0-9a-zA-Z#]{1,10}$/',
            '请填写正确的商店名称颜色!',
            self::MUST_VALIDATE
        ),
        array(
            'shop_size',
            '/^[0-9a-zA-Z]{1,10}$/',
            '请填写正确的商店名称字体大小!',
            self::MUST_VALIDATE
        ),
        array(
            'biaoyu_text',
            'require',
            '请填写正确的标语!',
            self::MUST_VALIDATE
        ),
        array(
            'biaoyu_x',
            '/^[0-9]+(.[0-9]{1,6})?$/',
            '请填写正确的商店名称横向位置!',
            self::MUST_VALIDATE
        ),
        array(
            'biaoyu_y',
            '/^[0-9]+(.[0-9]{1,6})?$/',
            '请填写正确的商店名称纵向位置!',
            self::MUST_VALIDATE
        ),
        array(
            'biaoyu_color',
            '/^[0-9a-zA-Z#]{1,10}$/',
            '请填写正确的商店名称颜色!',
            self::MUST_VALIDATE
        ),
        array(
            'biaoyu_size',
            '/^[0-9a-zA-Z]{1,10}$/',
            '请填写正确的商店名称字体大小!',
            self::MUST_VALIDATE
        ),
        array(
            'cover_img',
            'require',
            '请选择背景!',
            self::MUST_VALIDATE
        )
        
    );

    public function update()
    {
        $data = $this->create();
        
        if (!$data) {
            $this->error = $this->getError();
            
            return false;
        }
     
        
        if (! $data['id']) {
            $return = $this->add($data);
            if (! $return) {
                $this->error = '添加失败model';
                return false;
            } else {
                $data['id'] = $return;
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
