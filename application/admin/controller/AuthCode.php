<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/9/2
 * Time: 21:55
 */

namespace app\admin\controller;
use \think\Request;
use think\Controller;
use app\common\model\Vcode;
use think\Session;


class AuthCode extends Controller
{
    //  获取Tocken的方法，这里不做记录
    public function getTocken(){
        $token = Request::instance()->header('auth');// 人物权限
        $fields = ["facility","issue","price","processing","Stick"]; // 要控制的值
        $classid = "CE68E83A-65A7-E588-A63D-5D24CD2A755D";
        $res=model('Role')->getTocken($token,$fields,$classid,"add");
        echo $res;
    }

    // public function ImageCode(){
    //     session_start();
    //     // 2.imagecode.php文件（在Vcode的参数可以修改分别表示 高、宽、验证码字符串、杂点数、线条数、验证码类型【1:字母数字  2:数字  3:字母】）
    //     $image= new Vcode(50,130,4,0,0,2);
    //     // 输出的图片，必须使用image标签才可以读取，不然无法读取
    //     echo $image;
    // }

    function fileToBase64($file){
        $base64_file = '';
        if(file_exists($file)){
            $mime_type= mime_content_type($file);
            $base64_data = base64_encode(file_get_contents($file));
            $base64_file = 'data:'.$mime_type.';base64,'.$base64_data;
        }
        return $base64_file;
    }

    function Imagefg (){
        $data = input('post.');//think5 的验证机制
        $code=$data['code'];
        $scode=Session::get('code','think');
        if ($code == $scode){
            $fanhui= array('flag'=>1, 'msg'=>'验证码成功');
        }else{
            $fanhui= array('flag'=>0, 'msg'=>'验证码错误');
        }
        echo  json_encode($fanhui);
    }

}