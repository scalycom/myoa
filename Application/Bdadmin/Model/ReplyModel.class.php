<?php
namespace Bdadmin\Model;

use Think\Model;

/**
 * 关键词回复模型
 * 
 * @author zhizunbao
 */
class ReplyModel extends Model
{

    protected $_validate = array(
        array(
            'keyword',
            'require',
            '关键词不能为空',
            self::MUST_VALIDATE,
            'regex',
            self::MODEL_BOTH
        ),
        array(
            'keyword',
            '',
            '关键词已被使用!!',
            self::MUST_VALIDATE,
            'unique',
            self::MODEL_INSERT
        ),
        array(
            'controller',
            'require',
            '控制器名称不能为空',
            self::MUST_VALIDATE,
            'regex',
            self::MODEL_BOTH
        ),
        array(
            'action',
            'require',
            '方法名称不能为空',
            self::MUST_VALIDATE,
            'regex',
            self::MODEL_BOTH
        )
    )
    ;

    /**
     * 更新分类信息
     * 
     * @return boolean 更新状态
     * @author zhizunbao
     */
    public function update($data = array(),$time=1)
    {
        if ($data) {
            $data = $this->create($data,$time);
        } else {
            $data = $this->create($_POST,$time);
        }
        
        if (! $data) { // 数据对象创建错误
            $this->error = $this->getError();
            return false;
        }
        
        $map['keyword'] = $data['keyword'];
        $keyword_data = $this->where($map)->find();
        if($keyword_data){
            if($keyword_data['id']!=$data['id']){
                $this->error = '关键字已被使用!';
                return false;
            }
        
        }
        
        $data['type'] = $data['type']?1:0;
        
        $map['controller'] = $data['controller'];
        $map['action'] = $data['action'];
        $map['type'] = 0;
        $info =  $this->where($map)->find();
        if(($data['type']==0)&&$info){
            $data['id'] = $info['id'];
            $res = $this->save($data);
        }else{
            $res = $this->add($data);
        }
    
        return true;
    }

    public function get_error()
    {
        return $this->error;
    }
}
