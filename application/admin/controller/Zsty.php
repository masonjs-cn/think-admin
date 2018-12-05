<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/12/2
 * Time: 00:35
 */

namespace app\admin\controller;
use app\common\model\Msg;
use think\Controller;


class Zsty extends Controller
{

    public function CheckZsDatePost(){
        $data = input('post.');//think5 的验证机制
        $zsDate=$data['zsDate'];
        $cha=model('Zsty')->CheckTable($zsDate);
        $res=model('Msg')->success($cha);
        echo  json_encode($res);
    }

    public function CheckZsDateGet(){
        $data = input('get.');//think5 的验证机制
        $zsDate=$data['zsDate'];
        $cha=model('Zsty')->CheckTable($zsDate);
        $res=model('Msg')->success($cha);
        echo  json_encode($res);
    }


}