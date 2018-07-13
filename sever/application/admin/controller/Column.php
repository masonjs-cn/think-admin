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

use think\Controller;

class Column  extends Controller
{



    public function newTable(){
        $data = input('post.');//think5 的验证机制

        $fanhui="";

        $cha=model('Column')->sele($data);
        if ($cha == null){
            model('Column')->add($data);
            model('Column')->newTable($data);
            $fanhui= array('flag'=>1, 'msg'=>'成功');

        }else{
            $fanhui= array('flag'=>0, 'msg'=>'表名不能重复');
        }

        echo  json_encode($fanhui);
    }

    public function deleTable(){
        $data = input('post.');//think5 的验证机制

        $fanhui="";

        $cha=model('Column')->sele($data);
        if ($cha == null){
            $fanhui= array('flag'=>0, 'msg'=>'没有这张表');
        }else{
            model('Column')->dele($data);
            model('Column')->deleTable($data);
            $fanhui= array('flag'=>1, 'msg'=>'成功');
        }


        echo  json_encode($fanhui);

    }

    public function QueryTable(){
        $data = input('get.');//think5 的验证机制
        $fanhui="";
        $a=$data['page'];
        $b=$data['limit'];
        $table_form=$data['table_form'];

        $Count=model('Column')->CheckFileList("program",$table_form);
        $fanhui=model('Column')->QueryTable($table_form,($a - 1) * $b,$b);

        $res = [
            'code' => 0,
            'count'=>$Count[0]["COUNT(*)"],
            'msg' => '',
            'data' => $fanhui
        ];


        echo json_encode($res);

    }
    //查询表
    public function CheckTable(){
        $data = input('get.');//think5 的验证机制
        $a=$data['page'];
        $b=$data['limit'];
        $table=$data['table'];


        $Count=model('Column')->CheckList($table);
        $fanhui=model('Column')->CheckTable($table,($a - 1) * $b,$b);



        $res = [
            'code' => 0,
            'count'=>$Count[0]["COUNT(*)"],
            'msg' => '',
            'data' => $fanhui
        ];

        echo json_encode($res);

    }







}