<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/10/1
 * Time: 10:12
 */

namespace app\common\model;


class Msg
{

    //改函数设计的目的，就是用于所有的返回值的规范
    // 10001 权限
    // 40001 参数不对
    // 1 成功


    // 分页返回
    public function paging($Count,$fanhui){
        $res = [
            'flag' => 1,
            'count'=>$Count[0]["COUNT(*)"],
            'msg' => '',
            'data' => $fanhui
        ];
        return $res;
    }

    //判断操作成功的返回
    function success($msg){
        if ( $msg==""||$msg==null){
            $msg = '';
        }
        $res = [
            'flag' => 1,
            'msg' => $msg
        ];
        return $res;
    }

    //判断操作成功的返回
    function error($msg){
        if ( $msg==""||$msg==null){
            $msg = '';
        }
        $res = [
            'flag' => 0,
            'msg' => $msg
        ];
        return $res;
    }

    // 权限返回
    public function qxError(){
        $res = [
            'flag' => 10001,
            'msg' => "抱歉您没有操作权限"
        ];
        return $res;
    }

}