<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/5/23
 * Time: 22:05
 */

namespace app\common\model;

use think\Model;
use think\Db;

class Column extends Model
{
    // 新建表
    public function newTable($column,$columnName)
    {
        //增加一条数据库的信息
        $shu=model('Tools')->random();
        $newdata=array("column"=>"zmyq_".$column,"columnName"=>$columnName,"columnid"=>$shu);
        $this->save($newdata);

        // 操作数据库
        $sql = "CREATE TABLE IF NOT EXISTS `zmyq_".$column."` ( `id` INT UNSIGNED AUTO_INCREMENT, PRIMARY KEY ( `id` ),`identifies` VARCHAR(100) NOT NULL , `newTime` VARCHAR(100) NOT NULL) ENGINE = INNODB DEFAULT CHARSET = utf8 COMMENT='$columnName'";
        Db::execute($sql);
    }


//        删除表
    public function deleTable($column){
        //删除了一条数据库的信息
        Db::table('column')->where('column',$column)->delete();
        Db::table('program')->where('table_form',$column)->delete();

        // 炒作数据库删除
        $sql = "DROP TABLE $column ";
        Db::execute($sql);
    }


    //更新表名
    public function updateTable($obj,$columnid,$old){
//        $obj  将infoJson 全部接受，这边转成数组，可以直接更新
//        $columnid 获取的修改哪一张的表的信息
//        $old 原来这张表的所有信息

        $objArray = model('Tools')->object_to_array($obj);
        $objArray['column'] = 'zmyq_'.$objArray['column'];
        // 修改栏目列表的值
        Db::table('column')->where('columnid', $columnid)->update($objArray);

        // 修改表名
        $sql ='alter table '.$old['column'].' rename '.$objArray['column'].' ';
        Db::execute($sql);

        // 修改表的注释
        $sql1 ="alter table ".$objArray['column']." comment '".$objArray['columnName']."' ";
        Db::execute($sql1);

        // 字段管理
        $sql2= "update program set table_form=REPLACE(table_form,'".$old['column']."','".$objArray['column']."')";
        Db::execute($sql2);

    }

    public function QueryTable($table_form,$a,$b){
        $sql = "SELECT * FROM `program` WHERE `table_form` = '".$table_form."'  ORDER BY sort asc LIMIT ".$a.", ".$b." ";
        return Db::query($sql);
    }

    // 通过表名来查询这张表
    public function seleTable($column)
    {
       return Db::table('column')->where('column',$column)->find();
    }

    // 通过classid 这张表
    public function seleTableClass($columnid)
    {
        return Db::table('column')->where('columnid',$columnid)->find();
    }

    //查询表管理的sql
    public function CheckTableList($columnName,$page,$limit,$whereArry){
        $whereArry = $whereArry['msg'];

        $whereString ="";
        for($i=0;$i<sizeof($whereArry);$i++){
            $whereString='`'.$whereArry[$i].'`,'.$whereString;
        }

        $whereString = rtrim($whereString,',');
        $sql = "SELECT ".$whereString." FROM `".$columnName."` LIMIT ".$page.", ".$limit." ";

        $data = Db::query($sql);

        $sql2 = "SELECT COUNT(*) FROM `$columnName`";

        $sum = Db::query($sql2);

        return model('Msg')->paging($sum,$data);
    }


    public function CheckTable($table,$a,$b)
    {
        //查询值的sql
        $sql = "SELECT * FROM `$table` LIMIT ".$a.", ".$b." ";
     echo $sql;
//        return Db::query($sql);
    }

    public function CheckList($args)
    {
        $sql = "SELECT COUNT(*) FROM `$args`";
        return Db::query($sql);
    }

    public function CheckFileList($args,$table_form)
    {
        $sql = "SELECT COUNT(*) FROM `$args` where `table_form` = '".$table_form."'";
        return Db::query($sql);
    }

}