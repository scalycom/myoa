<?php


namespace Bdadmin\Model;
use Think\Model;

/**
 * 分类模型
 * @author zhizunbao 
 */
class WxconfigModel extends Model{

    protected $_validate = array(
        array('keyword', 'require', '关键字不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
        array('controller', 'require', '所选应用不正确', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
        array('action', 'require', '所选应用不正确', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
        
    );




   
    /**
     * 更新分类信息
     * @return boolean 更新状态
     * @author zhizunbao 
     */
    public function update(){
        $data = $this->create();
        if(!$data){ //数据对象创建错误
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
     
       
        /* 添加或更新数据 */
        if(empty($data['id'])){
          
            $res = $this->add($data);
            
        }else{
            
            $res = $this->save($data);
        }
    

        return $res;
    }

    
    
    public  function get_error(){
        return $this->error;
    }

}
