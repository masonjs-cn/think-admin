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
    //添加表
    public function newTable(){
//        column  表名
//        columnName  表标题
        $token = Request::instance()->header('Authorization');    // 人物权限
        $data = input('post.');//think5 的验证机制
        $fields = ['column','columnName'];
        $res=model('Tools')->emptyData($data,$fields);
        if ($res['flag']!=40001){
            $res=model('Role')->getTocken($token,$fields,"DEBXX919-5569-45AA-06C8-BE57F4884555","add");
            if($res['flag']==1){
                $column=$data['column'];
                $columnName=$data['columnName'];
                $cha=model('Column')->seleTable($column);
               if ($cha == null){
                    model('Column')->newTable($column,$columnName);
                    $res = model('Msg')->success('建表成功');
               }else{
                   $res=model('Msg')->error('表名不能重复');
               }
            }
        }
        echo  json_encode($res);
    }

    //删除表
    public function deleTable(){
        $token = Request::instance()->header('Authorization');    // 人物权限
        $data = input('post.');//think5 的验证机制
        $fields = ['column'];
        $res=model('Tools')->emptyData($data,$fields);

        if ($res['flag']!=40001){
            $res=model('Role')->getTocken($token,$fields,"DEBXX919-5569-45AA-06C8-BE57F4884555","delete");
            if($res['flag']==1){
                $column=$data['column'];
                $cha = model('Column')->seleTable($column);
                if ($cha != null) {
                    model('Column')->deleTable($column);
                    $res = model('Msg')->success('删除成功');
                } else {
                    $res = model('Msg')->error('没有这张表,或者该表为基础表');
                }
            }
        }
        echo  json_encode($res);
    }

    public function updateTable(){
//        column  表名
//        columnName  表标题
        $token = Request::instance()->header('Authorization');    // 人物权限
        $data = input('post.');//think5 的验证机制
        $fieldVal = ['columnid','infoJson'];
        $res=model('Tools')->emptyData($data,$fieldVal);

        if ($res['flag']!=40001){

            $obj = $data['infoJson'];
            $objArry = model('Tools')->traverseObjKey($obj);
            $columnid=$data['columnid'];
            $res=model('Role')->getTocken($token,$objArry,"DEBXX919-5569-45AA-06C8-BE57F4884555","update");
            if($res['flag']==1){
                $res=[];
                $cha=model('Column')->seleTableClass($columnid);
                if ($cha != null){
                    if(strpos($cha['column'],'zmyq_') !==false){
                        $cha2=model('Column')->seleTable($data['infoJson']['column']);
                        if ($cha2 == null){
                            model('Column')->updateTable($obj,$columnid,$cha);
                            $res = model('Msg')->success('修改成功');
                        }
                        else{
                            $res=model('Msg')->error('已经有了这张表');
                        }
                    }else{
                        $res=model('Msg')->error('不允许修改基础表');
                    }
                }else{
                    $res=model('Msg')->error('没有这张表');
                }
            }
        }
        echo  json_encode($res);
    }


    //查询表
    public function CheckTable(){

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




//    public function QueryTable(){
//        $data = input('get.');//think5 的验证机制
//        $fanhui="";
//        $a=$data['page'];
//        $b=$data['limit'];
//        $table_form=$data['table_form'];
//
//        $Count=model('Column')->CheckFileList("program",$table_form);
//        $fanhui=model('Column')->QueryTable($table_form,($a - 1) * $b,$b);
//
//        $res = [
//            'flag' => 1,
//            'count'=>$Count[0]["COUNT(*)"],
//            'msg' => '',
//            'data' => $fanhui
//        ];
//
//
//        echo json_encode($res);
//
//    }












}