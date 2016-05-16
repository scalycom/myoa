<?php


namespace Bdadmin\Model;
use Think\Model;

/**
 * 分类模型
 * @author zhizunbao 
 */
class AppModel extends Model{

    protected $_validate = array(
        array('app_name', 'require', '分类名称不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
        array('pid','/^[0-9]$/','请选择上级分类',self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
        array('controller', 'require', '控制器名称不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
         
        
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
        
        
        if($data['pid'] != 0){
            $parent = $this->where('app_id = '.$data['pid'])->find();
            if(!$parent){
                $this->error = '未找到该顶级分类!';
                return false;
            }
            
        }else{
            $data['action'] = '';
        }
        
       
       
        /* 添加或更新数据 */
        if(empty($data['app_id'])){
          
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
