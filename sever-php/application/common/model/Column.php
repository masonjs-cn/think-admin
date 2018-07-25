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
    public function newTable($data)
    {
        $Column=$data['Column'];
        $ColumnName=$data['ColumnName'];

        $sql = "CREATE TABLE IF NOT EXISTS `zmyq_".$Column."` ( `id` INT UNSIGNED AUTO_INCREMENT, PRIMARY KEY ( `id` ),`newTime` VARCHAR(100) NOT NULL) ENGINE = INNODB DEFAULT CHARSET = utf8 COMMENT='$ColumnName'";
        Db::execute($sql);

    }

    public function deleTable($data){
        $Column=$data['Column'];
        $sql = "DROP TABLE `zmyq_".$Column."` ";
        Db::execute($sql);
        $delesql ="DELETE FROM `program` WHERE `program`.table_form='zmyq_".$Column."'";
        Db::execute($delesql);
    }

    public function QueryTable($table_form,$a,$b){
        $sql = "SELECT * FROM `program` WHERE `table_form` = '".$table_form."'  ORDER BY sort asc LIMIT ".$a.", ".$b." ";
        return Db::query($sql);
    }

    public function add($data)
    {
        $shu=$this->shu();
        $newdata=array("Column"=>"zmyq_".$data['Column'],"ColumnName"=>$data['ColumnName'],"Columnid"=>$shu);
        $this->save($newdata);
    }

    public function dele($data){

        $Column=$data['Column'];
        $sql = "DELETE FROM `Column` where `Column` = 'zmyq_".$Column."' ";
        Db::execute($sql);
    }

    public function sele($data)
    {
        $Column=$data['Column'];
       return Db::table('Column')->where('Column',"zmyq_".$Column)->find();

    }

    public function CheckTable($table,$a,$b)
    {

        //查询值的sql
        $sql = "SELECT * FROM `$table` LIMIT ".$a.", ".$b." ";
        return Db::query($sql);
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


    function shu() {
        $charid = strtoupper(md5(uniqid(mt_rand(), true)));

        $hyphen = chr(45);// "-"
        $uuid = substr($charid, 0, 8).$hyphen
            .substr($charid, 8, 4).$hyphen
            .substr($charid,12, 4).$hyphen
            .substr($charid,16, 4).$hyphen
            .substr($charid,20,12);
        return $uuid;
    }


}