<?php
// +----------------------------------------------------------------------
// | Budaohuaxia [ CHUANGJIANG ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.chuangjiangnet.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: zhizunbao
// +----------------------------------------------------------------------
namespace Bdadmin\Controller;

use Think\Controller;

class BdadminController extends Controller
{

    protected $appid = '';

    protected $appsecret = '';

    protected $wx_en_key = '';

    /**
     * 密码加密处理
     *
     * @param string $password            
     */
    protected function password_encrypt($password = '')
    {
        return md5(md5($password) . 'cjnet');
    }

    public function wash_fenhong()
    {
        
        if (I('hash') !== md5('cjnetbdhx')) {
        exit();
        }
        // 获取本周的时间
        $week_start = mktime(0, 0, 0, date("m"), date("d") - date("w") + 1, date("Y"));
        $week_end = mktime(23, 59, 59, date("m"), date("d") - date("w") + 7, date("Y"));
        
        $total_fee = $this->order_money_count($week_start, $week_end);
        
        $bonus_user = M('Wxuser as u')->join('__BONUS_COUNT__ as bc ON bc.uid=u.uid and u.bonus_rank=bc.bonus_rank')
            ->where('u.status>0 and bc.bonus_count<bc.bonus_total and fenhong_time<' . (time() - 2400 * 3600))
            ->field('u.uid,bc.*,bc.id as bc_id')
            ->select();
        $rank = M('Bonusrank')->where('bonus_ratio>0')
            ->order('sort asc')
            ->select();
        foreach ($rank as $k => $v) {
            $ranklist[$v['rank_id']] = $v;
        }
        
        if ($bonus_user) {
            foreach ($bonus_user as $k => $v) {
                
                $bl_data['uid'] = $v['uid'];
                $bl_data['bc_id'] = $v['bc_id'];
                $temp_get_money = ($ranklist[$v['bonus_rank']]['bonus_ratio'] * $total_fee) / 100;
                $temp_get_money = sprintf("%.2f", $temp_get_money);
                
                $bl_data['count_money'] = $temp_get_money;
                $bl_data['time'] = time();
                
               
                
                $bc_data['bonus_count'] = $v['bonus_count'] + $temp_get_money;
                $bc_data['fenhong_time'] = $bl_data['time'];
                
                // 更新分红count
                M('Bonus_count')->where('id=' . $v['bc_id'])->save($bc_data);
                // 更新分红log
                M('Bonus_log')->add($bl_data);
                
                // 更新account
                add_account_log($v['uid'], $temp_get_money, 1, date('Y-m-d') . '分红');
                
                // 更新usermoney
                M('Wxuser')->where('uid=' . $v['uid'])->setInc('user_money', $temp_get_money);
            }
        }
    }

    public function insurance_fan()
    {
        if (I('hash') !== md5('cjnetbdhx')) {
            exit();
        }
        
        $insure = M('Insurance')->where('in_id=1')->find();
        $bili = $insure['day_bili'];
        $fan_time = strtotime(date('Y-m-d'));
        
        $insure_map['fan_time'] = array(
            'lt',
            $fan_time
        );
        $insure_map['fan_start_time'] = array(
            'lt',
            time()
        );
        $insure_map['end_time'] = array(
            'gt',
            time()
        );
        $insure_map['quanyi_jifen'] = array(
            'gt',
            0
        );
        $insure_map['fan_status'] = 1;
        $insure_user = M('Insure_user');
        $insure = $insure_user->where($insure_map)->select();
       
        if ($insure) {
            foreach ($insure as $k => $v) {
                $data = array();
                  $fan_temp_money = ($v['quanyi_jifen'] * $bili) / 100;
                  $fan_temp_money = sprintf("%.2f", $fan_temp_money)>0?sprintf("%.2f", $fan_temp_money):0.01;
                
                if ($v['quanyi_jifen'] < 1) {
                    $fan_temp_money = $v['quanyi_jifen'];
                    $data['fan_count'] = $v['fan_count'] + $fan_temp_money;
                    $data['fan_count']= sprintf("%.2f", $data['fan_count']);
                    $data['quanyi_jifen'] = 0;
                } else {
                    
                    $data['fan_count'] = $v['fan_count'] + $fan_temp_money;
                    $data['quanyi_jifen'] -= $fan_temp_money;
                }
                
                $data['fan_time'] = time();
                $log_data['in_uid'] = $v['in_uid'];
                $log_data['count_money'] = $fan_temp_money;
                $log_data['time'] = $data['fan_time'];
                $log_data['thisfan'] = $data['fan_count'];
                $log_data['thisjifen'] = $data['quanyi_jifen'];
                M('Insurance_log')->add($log_data);
                M('Wxuser')->where('uid=' . $v['uid'])->setInc('user_money', $fan_temp_money);
                add_account_log($v['uid'], $fan_temp_money, 1, date(Y - m - d) . '保险返现');
                M('Insure_user')->where('in_uid=' . $v['in_uid'])->save($data);
            }
        }
    }

    protected function order_money_count($start_time = 0, $endtime = 0)
    {
        $where = " and pay_time>0";
        
        if ($start_time) {
            $where .= ' and pay_time >' . $start_time;
        }
        
        if ($endtime) {
            $where .= ' and pay_time <' . $endtime;
        }
        
        $shop_order = M('Order')->where('status=10 ' . $where)->sum('goods_amount');
        $wash_order = M('Washorder')->where('status=1 ' . $where)->sum('order_total');
        // $wash_order = M('Washorder')->where('status=1 ' . $where)->select();
        $insure_order = M('Inorder')->where('status=10 ' . $where)->sum('order_total');
        
        return $shop_order + $wash_order + $insure_order;
    }
}