<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/10/1
 * Time: 19:58
 */

namespace app\common\model;


class Tools
{
    // 产生随机出的函数
    function random() {
        $charid = strtoupper(md5(uniqid(mt_rand(), true)));

        $hyphen = chr(45);// "-"
        $uuid = substr($charid, 0, 8).$hyphen
            .substr($charid, 8, 4).$hyphen
            .substr($charid,12, 4).$hyphen
            .substr($charid,16, 4).$hyphen
            .substr($charid,20,12);
        return $uuid;
    }

    function emptyDataPart($getkey,$getVal){
//      允许参数为空
        $res = [
            'flag' => 40001,
            'msg' => "传参有问题"
        ];
        if (sizeof($getkey)==sizeof($getVal)){
            $res = [
                'flag' => 1
            ];
        }
        return $res;
    }

    //判断函数是否为空
    function emptyData($getkey,$getVal){
//      将收到的值和需要收到的值，全部传入即可
        $res = [
            'flag' => 40001,
            'msg' => "传参有问题"
        ];
        if (sizeof($getkey)==sizeof($getVal)){
            for ($x=0; $x<sizeof($getVal); $x++) {
                if (empty($getkey[$getVal[$x]])){
                    $res = [
                        'flag' => 40001,
                        'msg' => "'请提交字段'$getVal[$x]"
                    ];
                }else{
                    $res = [
                        'flag' => 1
                    ];
                }
            }
        }
        return $res;
    }

    function traverseObjKey($obj){
        $res = [];
        $i = 0;
        foreach($obj as $key => $val){
            $res[$i++] = $key;
        }
        return $res;
    }



}