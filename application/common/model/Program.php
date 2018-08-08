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

    public function addFieldinfos($table,$infoJson,$send){
//        $send  0 不发送 1发送

        $Fkey="";
        $Fval="";
        $info = "";
        foreach($infoJson as $key => $val){
            $Fkey = $Fkey."`$key`,";
            $Fval = $Fval."'$val',";
            if($send==1){
//                $info =$info.'<div style="float:left;width:48%;border: 1px solid #000000;padding:5px;">'.$key.'</div><div style="float:left;width:48%;border: 1px solid #000000;padding:5px;">'.$val.'</div>';
                $info =$info.'<tr><td style="border: 1px solid #000;">					<div style="width:600px;text-align:left;font:17px/18px simsun;color:#000;background:#fff;text-align:center;margin:5px;">						'.$key.'</div>				</td>				<td style="border: 1px solid #000;">					<div style="width:600px;text-align:left;font:17px/18px simsun;color:#000;background:#fff;text-align:center;margin:5px;margin:5px;">						'.$val.'</div>				</td></tr>';
            }
        }
        $Fkey=rtrim($Fkey, ',');
        $Fval=rtrim($Fval, ',');
        $time=time();
        if($send==1) {
            model("Email")->mailYzm("954663633@qq.com", "BBA6E0E3-442E-6666-6B6B-53639CD557CC", $info);//      e_mail: 邮箱地址
        }
        $sql = "INSERT INTO `$table` ($Fkey,`".'newTime'."`) VALUES ($Fval,'".$time."')";
        Db::execute($sql);
    }

    public function seleField($table,$field,$Columnid)
    {
        //查询值的sql
        $sql = "SELECT * FROM `".$table."` WHERE  `".$field."` = '".$Columnid."'";
        return Db::query($sql);
    }

    public function CheckTable($table,$a,$b,$QueryField,$QueryKey)
    {

        //查询值的sql
        $sql = "SELECT * FROM `$table` WHERE $QueryField = ".$QueryKey."  LIMIT ".$a.", ".$b." ";
//        print_r($sql);
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