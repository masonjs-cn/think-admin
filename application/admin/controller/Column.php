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


    //添加表
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

    //删除表
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
            'flag' => 1,
            'count'=>$Count[0]["COUNT(*)"],
            'msg' => '',
            'data' => $fanhui
        ];


        echo json_encode($res);

    }
    //查询表
    public function CheckTable(){

        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
        header('Access-Control-Allow-Methods: GET, POST, PUT');


        $data = input('post.');//think5 的验证机制
        $currentPage=$data['currentPage'];//当前页
        $pageSize=$data['pageSize'];//一页加载多少
        $Columnid=$data['classid'];
        $table=model('Program')->seleField("Column",'Columnid',$Columnid);//获取修改表的名称
        $table=$table[0]['Column'];
        $Count=model('Column')->CheckList($table);
        $fanhui=model('Column')->CheckTable($table,($currentPage- 1) * $pageSize,$pageSize);

        $res = [
            'flag' => 1,
            'pages' => [
                "total"=>$Count[0]["COUNT(*)"],//总页数
                "currentPage"=> $currentPage,//当前页
                "pageSize"=> $pageSize,//一页加载多少
            ],
            'infos' => $fanhui
        ];

        echo json_encode($res);

    }







}