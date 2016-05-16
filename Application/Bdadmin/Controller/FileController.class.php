<?php

namespace Bdadmin\Controller;

use Bdadmin\Controller\CommonController;
/**
 * 文件控制器
 * 主要用于下载模型的文件上传和下载
 */
class FileController extends CommonController
{

    /* 文件上传 */
    public function upload()
    {
        $return = array(
            'status' => 1,
            'info' => '上传成功',
            'data' => ''
        );
        /* 调用文件上传组件上传文件 */
        $File = D('File');
        $file_driver = C('DOWNLOAD_UPLOAD_DRIVER');
        $info = $File->upload($_FILES, C('DOWNLOAD_UPLOAD'), C('DOWNLOAD_UPLOAD_DRIVER'), C("UPLOAD_{$file_driver}_CONFIG"));
        
        /* 记录附件信息 */
        if ($info) {
            $return['data'] = think_encrypt(json_encode($info['download']));
            $return['info'] = $info['download']['name'];
        } else {
            $return['status'] = 0;
            $return['info'] = $File->getError();
        }
        
        /* 返回JSON数据 */
        $this->ajaxReturn($return);
    }

    /* 下载文件 */
    public function download($id = null)
    {
        if (empty($id) || ! is_numeric($id)) {
            $this->error('参数错误！');
        }
        
        $logic = D('Download', 'Logic');
        if (! $logic->download($id)) {
            $this->error($logic->getError());
        }
    }

    /**
     * 上传图片
     * 
     * @author huajie <banhuajie@163.com>
     */
    public function uploadPicture()
    {
        // TODO: 用户登录检测
        
        /* 返回标准数据 */
        $return = array(
            'status' => 1,
            'info' => '上传成功',
            'data' => ''
        );
        
        /* 调用文件上传组件上传文件 */
        $Picture = D('Picture');
        $pic_driver = C('PICTURE_UPLOAD_DRIVER');
        $info = $Picture->upload($_FILES, C('PICTURE_UPLOAD'), C('PICTURE_UPLOAD_DRIVER'), C("UPLOAD_{$pic_driver}_CONFIG")); // TODO:上传到远程服务器
        
        /* 记录图片信息 */
        if ($info) {
            $return['status'] = 1;
            $return = array_merge($info['download'], $return);
        } else {
            $return['status'] = 0;
            $return['info'] = $Picture->getError();
        }
        
        /* 返回JSON数据 */
        $this->ajaxReturn($return);
    }

    /**
     * 上传图片
     * 
     * @author huajie <banhuajie@163.com>
     */
    public function uploadadv()
    {
        // TODO: 用户登录检测
        
        /* 返回标准数据 */
        $return = array(
            'status' => 1,
            'info' => '上传成功',
            'data' => ''
        );
        
        /* 调用文件上传组件上传文件 */
        $upload = new \Think\Upload(); // 实例化上传类
        $upload->maxSize = 3145728; // 设置附件上传大小
        $upload->exts = array(
            'jpg',
            'gif',
            'png',
            'jpeg'
        ); // 设置附件上传类型
        $upload->rootPath = './Uploads/Adv/'; // 设置附件上传根目录
        $upload->savePath = ''; // 设置附件上传（子）目录
                                     // 上传文件
        $info = $upload->upload();
        
        /* 记录图片信息 */
        if ($info) {
            $return['status'] = 1;
            $return['path'] = '/Uploads/Adv/'.$info['download']['savepath'].$info['download']['savename'];
            $return['info'] = '上传成功!';
        } else {
            $return['status'] = 0;
            $return['info'] = $upload->getError();
        }
        
        /* 返回JSON数据 */
        $this->ajaxReturn($return);
    }
    
    
    /**
     * 上传图片
     *
     * @author huajie <banhuajie@163.com>
     */
    public function uploadimg()
    {
        // TODO: 用户登录检测
    
        /* 返回标准数据 */
        $return = array(
            'status' => 1,
            'info' => '上传成功',
            'data' => ''
        );
    
        /* 调用文件上传组件上传文件 */
        $upload = new \Think\Upload(); // 实例化上传类
        $upload->maxSize = 3145728; // 设置附件上传大小
        $upload->exts = array(
            'jpg',
            'gif',
            'png',
            'jpeg'
        ); // 设置附件上传类型
        $upload->rootPath = './Uploads/Goods/orign/'; // 设置附件上传根目录
        $upload->savePath = ''; // 设置附件上传（子）目录
        // 上传文件
        $info = $upload->upload();
        
        
    
        /* 记录图片信息 */
        if ($info) {
            $return['status'] = 1;
            $return['path'] = '/Uploads/Goods/orign/'.$info['download']['savepath'].$info['download']['savename'];
            $return['info'] = '上传成功!';
        } else {
            $return['status'] = 0;
            $return['info'] = $upload->getError();
        }
    
        /* 返回JSON数据 */
        $this->ajaxReturn($return);
    }
    
  
}
