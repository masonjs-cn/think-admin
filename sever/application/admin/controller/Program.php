<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/5/26
 * Time: 08:14
 */

namespace app\admin\controller;


class Program
{

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

    public function QueryField(){
        //    通过字段和值查询这条信息
        //    Columnid  表id
        //    QueryField  查询的字段
        //    QueryKey  查询的字段值


        $data = input('post.');//think5 的验证机制

        $Columnid = $data['Columnid'];
        $QueryField = $data['QueryField'];
        $QueryKey=$data['QueryKey'];



        $table=model('Program')->seleField("Column",'Columnid',$Columnid);//获取修改表的名称
        $infos=model('Program')->seleField($table[0]['Column'],$QueryField,$QueryKey);//获取修改表的名称

        $fanhui= array('flag'=>1, 'msg'=>'成功','infos'=>$infos);

        echo  json_encode($fanhui);


    }


    public function DeleTableField(){
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

    public function AddInfos(){
        //    添加信息
        //    Columnid  表id
        //    deleField  查询的字段

        $data = input('post.');//think5 的验证机制

        $Columnid = $data['Columnid'];//表

        $table=model('Program')->seleField("Column",'Columnid',$Columnid);//获取修改表的名称
        $list = explode(",",$data["list"]);

        model('Program')->addFieldinfos($table[0]['Column'],$list,$data);

        $fanhui= array('flag'=>1, 'msg'=>'成功');
        echo  json_encode($fanhui);


    }



}