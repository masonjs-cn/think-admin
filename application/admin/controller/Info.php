<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/11/14
 * Time: 14:07
 */

namespace app\admin\controller;
use \think\Request;
use think\Controller;

class Info extends Controller
{
    //通过字段查询信息
    public function checkField(){
        //    通过字段和值查询这条信息
        //    classid  表id
        //    QueryField  查询的字段
        //    QueryKey  查询的字段值

        $token = Request::instance()->header('Authorization');    // 人物权限
        $data = input('post.');//think5 的验证机制
        $fields = ["classid","infoJson"];
        $res=model('Tools')->emptyData($data,$fields);

        if ($res['flag']!=40001){
            $classid=$data['classid'];
            $obj = $data['infoJson'];
            $objArry = model('Tools')->traverseObjKey($obj);
            $res=model('Role')->getTocken($token,$objArry,$classid,"checkField");
            if($res != null){
                $cha=model('Column')->seleTableClass($classid);
                if ($cha != null) {
                    $whereArry = model('Tools')->object_to_array($obj);
                    $fanhui=model('Program')->checkField($cha["column"],$whereArry,$objArry);
                    $res=model("Msg")->success($fanhui);
                }else{
                    $res=model('Msg')->error('没有这张表');
                }
            }else{
                $res=model("Msg")->qxError();
            }
        }
        echo  json_encode($res);


    }

    //通过表和字段，给字段添加信息
    public function addInfos(){
        //    添加信息

        $token = Request::instance()->header('Authorization');    // 人物权限
        $data = input('post.');//think5 的验证机制

        $fields = ["classid","infoJson",'send'];
        $res=model('Tools')->emptyData($data,$fields);
        if ($res['flag']!=40001){
            $classid=$data['classid'];
            $obj = $data['infoJson'];
            $objArryKey = model('Tools')->traverseObjKey($obj);
            $res=model('Role')->getTocken($token,$objArryKey,$classid,"add");
            if($res['flag'] !==10001){
                $cha=model('Column')->seleTableClass($classid);
                if ($cha != null) {
                    $fanhui=model('Program')->addFieldinfos($cha["column"],$data);
                    $res=model("Msg")->success($fanhui);
                }else{
                    $res=model('Msg')->error('没有这张表');
                }
            }else{
                $res=model("Msg")->qxError();
            }
        }
        echo  json_encode($res);

    }

    //删除数据
    public function deleInfos(){
        $token = Request::instance()->header('Authorization');    // 人物权限
        $data = input('post.');//think5 的验证机制
        $fields = ['mainKey','mainVal','classid'];
        $res=model('Tools')->emptyData($data,$fields);

        if ($res['flag']!=40001){
            $classid=$data['classid'];
            $fieldVal[0]=$data['mainKey'];
            $res=model('Role')->getTocken($token,$fieldVal,$classid,"delete");
            if($res['flag'] !==10001) {
                $cha=model('Column')->seleTableClass($classid);
                if ($cha != null) {
                    model('Program')->deleField($cha["column"],$data['mainKey'],$data['mainVal']);
                    $res=model("Msg")->success("");
                }else{
                    $res=model('Msg')->error('没有这张表');
                }
            }else{
                $res=model("Msg")->qxError();
            }
        }
        echo  json_encode($res);
    }

    //更新数据
    public function updateInfos(){
        $token = Request::instance()->header('Authorization');    // 人物权限
        $data = input('post.');//think5 的验证机制
        $fields = ['mainKey','mainVal','classid','infoJson'];
        $res=model('Tools')->emptyData($data,$fields);

        if ($res['flag']!=40001){
            $classid=$data['classid'];

            $obj = $data['infoJson'];
            $objArryKey = model('Tools')->traverseObjKey($obj);
//            if(strpos($data['mainKey'],',') !==false){
//
//                echo '包含该字符串';
//
//            }else{
//                $objArryKey[sizeof($objArryKey)+1]=$data['mainKey'];
//            }
            $res=model('Role')->getTocken($token,$objArryKey,$classid,"update");

            if($res['flag'] !==10001) {
                $cha=model('Column')->seleTableClass($classid);
                if ($cha != null) {
                    $whereArry = model('Tools')->object_to_array($obj);
                    model('Program')->updateField($cha["column"],$data['mainKey'],$data['mainVal'],$whereArry);
                    $res=model("Msg")->success("");
                }else{
                    $res=model('Msg')->error('没有这张表');
                }
            }else{
                $res=model("Msg")->qxError();
            }
        }
        echo  json_encode($res);
    }

}