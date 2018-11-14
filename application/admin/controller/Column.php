<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/5/23
 * Time: 22:00
 */
//栏目接口
//栏目表在我的认为中就是系统的的建表
namespace app\admin\controller;
use \think\Request;
use think\Controller;

class Column  extends Controller
{
    // 查询所有的表
    public function CheckTableList(){

        $token = Request::instance()->header('Authorization');    // 人物权限
        $data = input('post.');//think5 的验证机制
        $fields = ['currentPage','pageSize'];
        $res=model('Tools')->emptyData($data,$fields);

        if ($res['flag']!=40001){
            $res=model('Role')->getTocken($token,$fields,"DEBXX919-5569-45AA-06C8-BE57F4884555","check");
            if($res != null){
                $page=$data['currentPage'];
                $limit=$data['pageSize'];
               $res = model('Column')->CheckTableList('column',($page- 1) * $limit,$limit,$res);
            }
        }
        echo  json_encode($res);

    }


    public function CheckTable(){

        $token = Request::instance()->header('Authorization');    // 人物权限
        $data = input('post.');//think5 的验证机制
        $fields = ['currentPage','pageSize',"classid"];
        $res=model('Tools')->emptyData($data,$fields);
        $classid=$data['classid'];

        if ($res['flag']!=40001){
            $res=model('Role')->getTocken($token,$fields,$classid,"check");
            if($res != null){
                $page=$data['currentPage'];
                $limit=$data['pageSize'];
                $cha=model('Column')->seleTableClass($classid);
                if ($cha != null) {
                    $res = model('Column')->CheckTableList($cha['column'], ($page - 1) * $limit, $limit, $res);
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