<?php


namespace Bdadmin\Model;
use Think\Model;

/**
 * 分类模型
 * @author zhizunbao 
 */
class ArccatModel extends Model{

    protected $_validate = array(
        array('cat_name', 'require', '分类名称不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
        array('pid','/^[0-9]$/','请选择上级分类',self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
    );

    protected $_auto = array(
   
        array('create_time', NOW_TIME, self::MODEL_INSERT),
       
       
    );


    /**
     * 获取分类详细信息
     * @param  milit   $id 分类ID或标识
     * @param  boolean $field 查询字段
     * @return array     分类信息
     * @author zhizunbao 
     */
    public function info($id, $field = true){
        /* 获取分类信息 */
        $map = array();
        if(is_numeric($id)){ //通过ID查询
            $map['id'] = $id;
        } else { //通过标识查询
            $map['name'] = $id;
        }
        return $this->field($field)->where($map)->find();
    }

    /**
     * 获取分类树，指定分类则返回指定分类极其子分类，不指定则返回所有分类树
     * @param  integer $id    分类ID
     * @param  boolean $field 查询字段
     * @return array          分类树
     * @author zhizunbao 
     */
    public function getTree($id = 0, $field = true){
        /* 获取当前分类信息 */
        if($id){
            $info = $this->info($id);
            $id   = $info['id'];
        }

        /* 获取所有分类 */
        $map  = array('status' => array('gt', -1));
        $list = $this->field($field)->where($map)->order('sort')->select();
        $list = list_to_tree($list, $pk = 'cid', $pid = 'pid', $child = 'child', $root = $id);

        /* 获取返回数据 */
        if(isset($info)){ //指定分类则返回当前分类极其子分类
            $info['child'] = $list;
        } else { //否则返回所有分类
            $info = $list;
        }

        return $info;
    }

    /**
     * 获取指定分类子分类ID
     * @param  string $cate 分类ID
     * @return string       id列表
     * @author zhizunbao 
     */
    public function getChildrenId($cate) {
        $field    = 'id,name,pid,title,link_id';
        $category = $this->getTree($cate, $field);
        $ids[]    = $cate;
        foreach ($category['_'] as $key => $value) {
            $ids[] = $value['id'];
        }
        return implode(',', $ids);
    }

    /**
     * 获取指定分类的同级分类
     * @param  integer $id    分类ID
     * @param  boolean $field 查询字段
     * @return array
     * @author zhizunbao 
     */
    public function getSameLevel($id, $field = true){
        $info = $this->info($id, 'pid');
        $map = array('pid' => $info['pid'], 'status' => 1);
        return $this->field($field)->where($map)->order('sort')->select();
    }

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
            $parent = $this->where('cid = '.$data['pid'])->find();
            if(!$parent){
                $this->error = '未找到该顶级分类!';
                return false;
            }
            $data['level'] = $parent['level']+1;
        }
        
       
       
        /* 添加或更新数据 */
        if(empty($data['cid'])){
          
            $res = $this->add($data);
            
        }else{
            
            $res = $this->save($data);
        }
    

        return $res;
    }

    /**
     * 查询后解析扩展信息
     * @param  array $data 分类数据
     * @author zhizunbao 
     */
    protected function _after_find(&$data, $options){
        /* 分割模型 */
        if(!empty($data['model'])){
            $data['model'] = explode(',', $data['model']);
        }

        if(!empty($data['model_sub'])){
            $data['model_sub'] = explode(',', $data['model_sub']);
        }

        /* 分割文档类型 */
        if(!empty($data['type'])){
            $data['type'] = explode(',', $data['type']);
        }

        /* 分割模型 */
        if(!empty($data['reply_model'])){
            $data['reply_model'] = explode(',', $data['reply_model']);
        }

        /* 分割文档类型 */
        if(!empty($data['reply_type'])){
            $data['reply_type'] = explode(',', $data['reply_type']);
        }

        /* 还原扩展数据 */
        if(!empty($data['extend'])){
            $data['extend'] = json_decode($data['extend'], true);
        }
    }
    
    
    
    public  function get_error(){
        return $this->error;
    }

}
