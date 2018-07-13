<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/5/26
 * Time: 08:00
 */

namespace app\common\model;

use think\Model;
use think\Db;

class Program extends Model
{
    public function addField($data)
    {
        //增加信息的sql
        return  $this->save($data);
    }

    public function addFieldinfos($table,$list,$data){

        $Field = "";
        $Fieldskty = "";

        for($a = 0; $a<sizeof($list);$a++){

            if ($a == 0){
                $Field = "`".$list[$a]."`";
                $Fieldskty = "'".$data[$list[$a]]."'";

            }else{
                $Field = $Field .",". "`".$list[$a]."`";
                $Fieldskty = $Fieldskty .","."'".$data[$list[$a]]."'";
            }

        }

        $sql = "INSERT INTO `$table` ($Field) VALUES ($Fieldskty)";
        Db::execute($sql);
    }

    public function seleField($table,$field,$Columnid)
    {
        //查询值的sql
        $sql = "SELECT * FROM `".$table."` WHERE  `".$field."` = '".$Columnid."'";
        return Db::query($sql);
    }

    public function deleField($table,$Field,$Key)
    {
        //删除值的sql
        $sql = "DELETE FROM `".$table."` WHERE `".$table."`.`".$Field."` = `".$Key."`";
        Db::execute($sql);
//        print_r($sql);
    }



    public function addTableField($table,$field,$fieldType,$fieldSize){
        //新建表的sql
        $sql = "ALTER TABLE `".$table."` ADD `".$field."` ".$fieldType."(".$fieldSize.")";
        Db::execute($sql);
    }

    public function deleTableField($table,$field){
        //删除表的sql

        $sqlone ='DELETE FROM `program` WHERE `field` = "'.$field.'" and `table_form` = "'.$table.'"';
        Db::execute($sqlone);

        $sql = "ALTER TABLE `".$table."` DROP `".$field."`";
        Db::execute($sql);

    }



}