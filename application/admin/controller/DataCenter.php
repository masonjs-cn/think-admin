<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/11/14
 * Time: 13:47
 */

namespace app\admin\controller;
use \think\Request;
use think\Controller;

class DataCenter extends Controller
{
    //添加表
    public function newTable(){
//        column  表名
//        columnName  表标题
        $token = Request::instance()->header('auth');    // 人物权限
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
        $token = Request::instance()->header('auth');    // 人物权限
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

    //修改表
    public function updateTable(){
//        column  表名
//        columnName  表标题
        $token = Request::instance()->header('auth');    // 人物权限
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

    //增加字段接口
    public function addTableField(){
        //    增加字段接口
        //    Columnid 栏目id
        //    field 字段
        //    fieldType 数据类型
        //    fieldSize 数据大小
        //    field_annotation 管理字段名注释
        //    sort  排序

        $data = input('post.');//think5 的验证机制

        $field = $data['field'];
        $Columnidname = "Columnid";
        $Columnid = $data['Columnid'];


        $table=model('Program')->seleField("Column",$Columnidname,$Columnid);//获取修改表的名称
        $infos=model('Program')->seleField("program",'table_form',$table[0]['Column']);//获取修改表的名称

        $panduan = 1;
        for ($a = 0 ; $a<sizeof($infos);$a++){
            if ($infos[$a]['field'] == $field){
                $panduan = 0;
                echo print_r($infos[$a]['field']);
                break;
            }else{
                $panduan = 1;
            }
        }

        if ($panduan == 0){

            $fanhui= array('flag'=>0, 'msg'=>'重复字段不能添加','cc'=>$panduan);

        }else{
            $shuju =array('title'=>$table[0]['ColumnName'],'table_form'=>$table[0]['Column'],'field'=>$data['field'],'fieldType'=>$data['fieldType'],'fieldSize'=>$data['fieldSize'],'field_annotation'=>$data['field_annotation'],'sort'=>$data['sort']);
            model('Program')->addField($shuju);
            model('Program')->addTableField($table[0]['Column'],$data['field'],$data['fieldType'],$data['fieldSize']);
            $fanhui= array('flag'=>1, 'msg'=>'成功');

        }


        echo  json_encode($fanhui);


    }

    //删除字段接口
    public function deleTableField(){
        //    删除字段接口
        //    Columnid  表id
        //    deleField  查询的字段

        $data = input('post.');//think5 的验证机制

        $Columnid = $data['Columnid'];//表
        $deleField = $data['deleField'];//字段

        $table=model('Program')->seleField("Column",'Columnid',$Columnid);//获取修改表的名称
        model('Program')->deleTableField($table[0]['Column'],$deleField);

        $fanhui= array('flag'=>1, 'msg'=>'成功');
        echo  json_encode($fanhui);


    }


}