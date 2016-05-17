<?php

namespace Bdadmin\Controller;

use Think\Controller;
use Com\Wechat;
use Com\WechatAuth;
use Bdadmin\Model\AuthRuleModel;
use Bdadmin\Model\AuthGroupModel;

class CommonController extends BdadminController
{

    public function _initialize()
    {

        if (defined('UID'))
            return;

        define('UID', is_login());
        if (! UID) { // 还没登录 跳转到登录页面
            $this->redirect('Public/login');
        }
        
        /* 读取数据库中的配置 */
        $config = S('DB_CONFIG_DATA');
        if (! $config) {
            $config = api('Config/lists');
            S('DB_CONFIG_DATA', $config);
        }
        C($config); // 添加配置
        
        // 是否是超级管理员
        define('IS_ROOT',   is_administrator());
        if(!IS_ROOT && C('ADMIN_ALLOW_IP')){
            // 检查IP地址访问
            if(!in_array(get_client_ip(),explode(',',C('ADMIN_ALLOW_IP')))){
                $this->error('403:禁止访问');
            }
        }
        // 检测系统权限
        if(!IS_ROOT){
            $access =   $this->accessControl();
            if ( false === $access ) {
                $this->error('403:禁止访问');
            }elseif(null === $access ){
                //检测访问权限
                $rule  = strtolower(MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME);
                if ( !$this->checkRule($rule,array('in','1,2')) ){
                    $this->error('未授权访问!');
                }else{
                    // 检测分类及内容有关的各项动态权限
                    $dynamic    =   $this->checkDynamic();
                    if( false === $dynamic ){
                        $this->error('未授权访问!');
                    }
                }
            }
        }
       
        $this->assign('__POSITION__', $this->get_position());
        $this->assign('__MENU__', $this->getMenus());
        // 获取appid，appsecret，token以及微信消息加密
        $this->appid = C('WX_APPID');
        $this->appsecret = C('WX_APPSECRET');
        $this->wx_en_key = C('WX_EN_KEY');
        
       
    }

    /**
     * 权限检测
     * 
     * @param string $rule
     *            检测的规则
     * @param string $mode
     *            check模式
     * @return boolean
     * @author 朱亚杰 <xcoolcc@gmail.com>
     */
    final protected function checkRule($rule, $type = AuthRuleModel::RULE_URL, $mode = 'url')
    {
        static $Auth = null;
        if (! $Auth) {
            $Auth = new \Think\Auth();
        }
        if (! $Auth->check($rule, UID, $type, $mode)) {
            return false;
        }
        return true;
    }

    /**
     * 检测是否是需要动态判断的权限
     * 
     * @return boolean|null 返回true则表示当前访问有权限
     *         返回false则表示当前访问无权限
     *         返回null，则表示权限不明
     *        
     * @author 朱亚杰 <xcoolcc@gmail.com>
     */
    protected function checkDynamic()
    {}

    /**
     * action访问控制,在 **登陆成功** 后执行的第一项权限检测任务
     *
     * @return boolean|null 返回值必须使用 `===` 进行判断
     *        
     *         返回 **false**, 不允许任何人访问(超管除外)
     *         返回 **true**, 允许任何管理员访问,无需执行节点权限检测
     *         返回 **null**, 需要继续执行节点权限检测决定是否允许访问
     * @author 朱亚杰 <xcoolcc@gmail.com>
     */
    final protected function accessControl()
    {
        $allow = C('ALLOW_VISIT');
        $deny = C('DENY_VISIT');
        $check = strtolower(CONTROLLER_NAME . '/' . ACTION_NAME);
        if (! empty($deny) && in_array_case($check, $deny)) {
            return false; // 非超管禁止访问deny中的方法
        }
        if (! empty($allow) && in_array_case($check, $allow)) {
            return true;
        }
        return null; // 需要检测节点权限
    }

    /**
     * 对数据表中的单行或多行记录执行修改 GET参数id为数字或逗号分隔的数字
     *
     * @param string $model
     *            模型名称,供M函数使用的参数
     * @param array $data
     *            修改的数据
     * @param array $where
     *            查询时的where()方法的参数
     * @param array $msg
     *            执行正确和错误的消息 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *            url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     *            
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    final protected function editRow($model, $data, $where, $msg)
    {
        $id = array_unique((array) I('id', 0));
        $id = is_array($id) ? implode(',', $id) : $id;
        // 如存在id字段，则加入该条件
        $fields = M($model)->getDbFields();
        if (in_array('id', $fields) && ! empty($id)) {
            $where = array_merge(array(
                'id' => array(
                    'in',
                    $id
                )
            ), (array) $where);
        }
        
        $msg = array_merge(array(
            'success' => '操作成功！',
            'error' => '操作失败！',
            'url' => '',
            'ajax' => IS_AJAX
        ), (array) $msg);
        if (M($model)->where($where)->save($data) !== false) {
            $this->success($msg['success'], $msg['url'], $msg['ajax']);
        } else {
            $this->error($msg['error'], $msg['url'], $msg['ajax']);
        }
    }

    /**
     * 禁用条目
     * 
     * @param string $model
     *            模型名称,供D函数使用的参数
     * @param array $where
     *            查询时的 where()方法的参数
     * @param array $msg
     *            执行正确和错误的消息,可以设置四个元素 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *            url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     *            
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    protected function forbid($model, $where = array(), $msg = array( 'success'=>'状态禁用成功！', 'error'=>'状态禁用失败！'))
    {
        $data = array(
            'status' => 0
        );
        $this->editRow($model, $data, $where, $msg);
    }

    /**
     * 恢复条目
     * 
     * @param string $model
     *            模型名称,供D函数使用的参数
     * @param array $where
     *            查询时的where()方法的参数
     * @param array $msg
     *            执行正确和错误的消息 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *            url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     *            
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    protected function resume($model, $where = array(), $msg = array( 'success'=>'状态恢复成功！', 'error'=>'状态恢复失败！'))
    {
        $data = array(
            'status' => 1
        );
        $this->editRow($model, $data, $where, $msg);
    }

    /**
     * 还原条目
     * 
     * @param string $model
     *            模型名称,供D函数使用的参数
     * @param array $where
     *            查询时的where()方法的参数
     * @param array $msg
     *            执行正确和错误的消息 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *            url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     * @author huajie <banhuajie@163.com>
     */
    protected function restore($model, $where = array(), $msg = array( 'success'=>'状态还原成功！', 'error'=>'状态还原失败！'))
    {
        $data = array(
            'status' => 1
        );
        $where = array_merge(array(
            'status' => - 1
        ), $where);
        $this->editRow($model, $data, $where, $msg);
    }

    /**
     * 条目假删除
     * 
     * @param string $model
     *            模型名称,供D函数使用的参数
     * @param array $where
     *            查询时的where()方法的参数
     * @param array $msg
     *            执行正确和错误的消息 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *            url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     *            
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    protected function delete($model, $where = array(), $msg = array( 'success'=>'删除成功！', 'error'=>'删除失败！'))
    {
        $data['status'] = - 1;
        $this->editRow($model, $data, $where, $msg);
    }

    /**
     * 设置一条或者多条数据的状态
     */
    public function setStatus($Model = CONTROLLER_NAME)
    {
        $ids = I('request.ids');
        $status = I('request.status');
        if (empty($ids)) {
            $this->error('请选择要操作的数据');
        }
        
        $map['id'] = array(
            'in',
            $ids
        );
        switch ($status) {
            case - 1:
                $this->delete($Model, $map, array(
                    'success' => '删除成功',
                    'error' => '删除失败'
                ));
                break;
            case 0:
                $this->forbid($Model, $map, array(
                    'success' => '禁用成功',
                    'error' => '禁用失败'
                ));
                break;
            case 1:
                $this->resume($Model, $map, array(
                    'success' => '启用成功',
                    'error' => '启用失败'
                ));
                break;
            default:
                $this->error('参数错误');
                break;
        }
    }

    public function get_position()
    {
        $menu = M('Menu as m1')->join('__MENU__ as m2 ON m1.pid = m2.id')
            ->where("m1.pid !=0 AND m1.url like '%" . CONTROLLER_NAME . "/" . ACTION_NAME . "%'")
            ->field('m1.title as m1title,m1.url as m1url,m2.title as m2title,m2.url as m2url')
            ->find();
       
        
        $data['childname'] = $menu['m1title'];
        $data['childurl'] = U($menu['m1url']);
        $data['parentname'] = $menu['m2title'];
        $data['parenturl'] = U($menu['m2url']);
      
       return $data;
    }

    /**
     * 获取控制器菜单数组,二级菜单元素位于一级菜单的'_child'元素中
     * 
     * @author 朱亚杰 <xcoolcc@gmail.com>
     */
    final public function getMenus($controller = CONTROLLER_NAME)
    {
        $menus = session('ADMIN_MENU_LIST.' . $controller);
        
        if (empty($menus)) {
            // 获取主菜单
            $where['pid'] = 0;
            $where['hide'] = 0;
            if (! C('DEVELOP_MODE')) { // 是否开发者模式
                $where['is_dev'] = 0;
            }
            $menus['main'] = M('Menu')->where($where)
                ->order('sort asc')
                ->select();
            $menus['child'] = array(); // 设置子节点
            foreach ($menus['main'] as $key => $item) {
                // 判断主菜单权限
                if (! IS_ROOT && ! $this->checkRule(strtolower(MODULE_NAME . '/' . $item['url']), AuthRuleModel::RULE_MAIN, null)) {
                    unset($menus['main'][$key]);
                    continue; // 继续循环
                }
                
                if (strtolower(CONTROLLER_NAME . '/' . ACTION_NAME) == strtolower($item['url'])) {
                    $menus['main'][$key]['class'] = 'dropDown dropDown_hover current';
                } else {
                    $menus['main'][$key]['class'] = 'dropDown dropDown_hover';
                }
            }
            
            // 查找当前子菜单
            $pid = M('Menu')->where("pid !=0 AND url like '%{$controller}/" . ACTION_NAME . "%'")->getField('pid');
            
            if ($pid) {
                // 查找当前主菜单
                $nav = M('Menu')->find($pid);
                if ($nav['pid']) {
                    $nav = M('Menu')->find($nav['pid']);
                }
                foreach ($menus['main'] as $key => $item) {
                    // 获取当前主菜单的子菜单项
                    if ($item['id'] == $nav['id']) {
                        $menus['main'][$key]['class'] = 'current';
                        // 生成child树
                        $groups = M('Menu')->where(array(
                            'group' => array(
                                'neq',
                                ''
                            ),
                            'pid' => $item['id']
                        ))
                            ->distinct(true)
                            ->getField("group", true);
                        // 获取二级分类的合法url
                        $where = array();
                        $where['pid'] = $item['id'];
                        $where['hide'] = 0;
                        if (! C('DEVELOP_MODE')) { // 是否开发者模式
                            $where['is_dev'] = 0;
                        }
                        $second_urls = M('Menu')->where($where)->select();
                        
                        if (! IS_ROOT) {
                            // 检测菜单权限
                            $to_check_urls = array();
                            foreach ($second_urls as $key => $to_check_url) {
                                if (stripos($to_check_url, MODULE_NAME) !== 0) {
                                    $rule = MODULE_NAME . '/' . $to_check_url;
                                } else {
                                    $rule = $to_check_url;
                                }
                                if ($this->checkRule($rule, AuthRuleModel::RULE_URL, null))
                                    $to_check_urls[] = $to_check_url;
                            }
                        }
                        // 按照分组生成子菜单树
                        foreach ($groups as $g) {
                            $map = array(
                                'group' => $g
                            );
                            if (isset($to_check_urls)) {
                                if (empty($to_check_urls)) {
                                    // 没有任何权限
                                    continue;
                                } else {
                                    $map['url'] = array(
                                        'in',
                                        $to_check_urls
                                    );
                                }
                            }
                            $map['pid'] = $item['id'];
                            $map['hide'] = 0;
                            if (! C('DEVELOP_MODE')) { // 是否开发者模式
                                $map['is_dev'] = 0;
                            }
                            $menuList = M('Menu')->where($map)
                                ->order('sort asc')
                                ->select();
                            $menus['child'][$g] = list_to_tree($menuList, 'id', 'pid', 'operater', $item['id']);
                        }
                    }
                }
            }
            session('ADMIN_MENU_LIST.' . $controller, $menus);
        }
        return $menus;
    }

    /**
     * 返回后台节点数据
     * 
     * @param boolean $tree
     *            是否返回多维数组结构(生成菜单时用到),为false返回一维数组(生成权限节点时用到)
     *            @retrun array
     *            
     *            注意,返回的主菜单节点数组中有'controller'元素,以供区分子节点和主节点
     *            
     * @author 朱亚杰 <xcoolcc@gmail.com>
     */
    final protected function returnNodes($tree = true)
    {
        static $tree_nodes = array();
        if ($tree && ! empty($tree_nodes[(int) $tree])) {
            return $tree_nodes[$tree];
        }
        if ((int) $tree) {
            $list = M('Menu')->field('id,pid,title,url,tip,hide')
                ->order('sort asc')
                ->select();
            foreach ($list as $key => $value) {
                if (stripos($value['url'], MODULE_NAME) !== 0) {
                    $list[$key]['url'] = MODULE_NAME . '/' . $value['url'];
                }
            }
            $nodes = list_to_tree($list, $pk = 'id', $pid = 'pid', $child = 'operator', $root = 0);
            foreach ($nodes as $key => $value) {
                if (! empty($value['operator'])) {
                    $nodes[$key]['child'] = $value['operator'];
                    unset($nodes[$key]['operator']);
                }
            }
        } else {
            $nodes = M('Menu')->field('title,url,tip,pid')
                ->order('sort asc')
                ->select();
            foreach ($nodes as $key => $value) {
                if (stripos($value['url'], MODULE_NAME) !== 0) {
                    $nodes[$key]['url'] = MODULE_NAME . '/' . $value['url'];
                }
            }
        }
        $tree_nodes[(int) $tree] = $nodes;
        return $nodes;
    }

    /**
     * 通用分页列表数据集获取方法
     *
     * 可以通过url参数传递where条件,例如: index.html?name=asdfasdfasdfddds
     * 可以通过url空值排序字段和方式,例如: index.html?_field=id&_order=asc
     * 可以通过url参数r指定每页数据条数,例如: index.html?r=5
     *
     * @param sting|Model $model
     *            模型名或模型实例
     * @param array $where
     *            where查询条件(优先级: $where>$_REQUEST>模型设定)
     * @param array|string $order
     *            排序条件,传入null时使用sql默认排序或模型属性(优先级最高);
     *            请求参数中如果指定了_order和_field则据此排序(优先级第二);
     *            否则使用$order参数(如果$order参数,且模型也没有设定过order,则取主键降序);
     *            
     * @param boolean $field
     *            单表模型用不到该参数,要用在多表join时为field()方法指定参数
     * @author 朱亚杰 <xcoolcc@gmail.com>
     *        
     * @return array|false 返回数据集
     */
    protected function lists($model, $where = array(), $order = '', $field = true)
    {
        $options = array();
        $REQUEST = (array) I('get.');
        if (is_string($model)) {
            $model = M($model);
        }
        
        $OPT = new \ReflectionProperty($model, 'options');
        $OPT->setAccessible(true);
       
        $pk = $model->getPk();
        
        if ($order === null) {
            // order置空
        } else 
            if (isset($REQUEST['_order']) && isset($REQUEST['_field']) && in_array(strtolower($REQUEST['_order']), array(
                'desc',
                'asc'
            ))) {
                $options['order'] = '`' . $REQUEST['_field'] . '` ' . $REQUEST['_order'];
            } elseif ($order === '' && empty($options['order']) && ! empty($pk)) {
                $options['order'] = $pk . ' desc';
            } elseif ($order) {
                $options['order'] = $order;
            }
        unset($REQUEST['_order'], $REQUEST['_field']);
        
        if (empty($where)) {
            $where = array(
                'status' => array(
                    'egt',
                    0
                )
            );
        }
        if (! empty($where)) {
            $options['where'] = $where;
        }
        
        $options = array_merge((array) $OPT->getValue($model), $options);


        
        $total = $model->where($options['where'])->count();


        
        if (isset($REQUEST['r'])) {
            $listRows = (int) $REQUEST['r'];
        } else {
            $listRows = C('LIST_ROWS') > 0 ? C('LIST_ROWS') : 10;
        }
        

        $page = new \Think\Page($total, $listRows, $REQUEST);
        if ($total > $listRows) {
            $page->setConfig('theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
        }
        $p = $page->show();
       
        $this->assign('_page', $p ? $p : '');
        $this->assign('_total', $total);
        $options['limit'] = $page->firstRow . ',' . $page->listRows;
        
        $model->setProperty('options', $options);
        
        return $model->field($field)->select();
    }
    
    
    public function get_wx(){
        
        if (! S('token') || S('expire') < time()) {
            $WechatAuth = new WechatAuth($this->appid, $this->appsecret);
            $token = $WechatAuth->getAccessToken();
            S('expire', $token['expires_in'] + time());
            S('token', $token['access_token']);
           $access_token = $token['access_token'];
        } else {
            $token = S('token');
            $access_token = $token;
        }
        
        $WechatAuth = new WechatAuth($this->appid, $this->appsecret, $access_token);
        if (! $WechatAuth) {
            $WechatAuth = get_new_token();
        }
        
        return $WechatAuth;
    }
    
    protected function get_new_token()
    {
        $WechatAuth = new WechatAuth($this->appid, $this->appsecret);
        $token = $WechatAuth->getAccessToken();
        S('expire', $token['expires_in']);
        S('token', $token['access_token']);
        $access_token = $token['access_token'];
        $WechatAuth = new WechatAuth($this->appid, $this->appsecret, $access_token);
        return $WechatAuth;
    }
    
    
  
}