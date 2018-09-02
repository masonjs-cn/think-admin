<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/9/2
 * Time: 21:55
 */

namespace app\admin\controller;
use app\common\model\Vcode;
use think\Session;


class Image
{

    function ImageCode(){
        session_start();
        // 2.imagecode.php文件（在Vcode的参数可以修改分别表示 高、宽、验证码字符串、杂点数、线条数、验证码类型【1:字母数字  2:数字  3:字母】）
        $image= new Vcode(50,130,4,50,4,1);
        echo $image;
    }

    function fileToBase64($file){
        $base64_file = '';
        if(file_exists($file)){
            $mime_type= mime_content_type($file);
            $base64_data = base64_encode(file_get_contents($file));
            $base64_file = 'data:'.$mime_type.';base64,'.$base64_data;
        }
        return $base64_file;
    }

    function imagefg (){
       echo Session::get('code','think');
    }


}