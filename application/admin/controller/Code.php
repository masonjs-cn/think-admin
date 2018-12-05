<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/11/28
 * Time: 20:46
 */

namespace app\admin\controller;
use \think\Request;
use think\Controller;
use app\common\model\Vcode;
use think\Session;

class Code extends Controller
{
    public function ImageCode(){
        session_start();
        // 2.imagecode.php文件（在Vcode的参数可以修改分别表示 高、宽、验证码字符串、杂点数、线条数、验证码类型【1:字母数字  2:数字  3:字母】）
        $image= new Vcode(50,130,4,0,0,2);
        // 输出的图片，必须使用image标签才可以读取，不然无法读取
        echo $image;
    }
}