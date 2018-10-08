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


    // 通过字段查询
    public function checkField($table,$whereArry,$objArry)
    {
        $whereString = "";
        for ($i=0;$i<sizeof($whereArry);$i++){
            $whereString =$objArry[$i].'="'.$whereArry[$objArry[$i]] .'" and '.$whereString;
        }

        $whereString=rtrim($whereString,' and ');
        $sql = "select * from ".$table." where ".$whereString." ";
        return Db::query($sql);
    }


    public function addField($data)
    {
        //增加信息的sql
        return  $this->save($data);
    }

    // 增加信息
    public function addFieldinfos($table,$data){
//        $send  0 不发送 1发送

        $infoJson = $data['infoJson'];
        $send = $data['send'];

        if($send["send"]==1) {
            $Fkey="";
            $Fval="";
            $info = "";
            foreach($infoJson as $key => $val){
                $Fkey = $Fkey."`$key`,";
                $Fval = $Fval."'$val',";
                if($send["send"]==1){
    //                $info =$info.'<div style="float:left;width:48%;border: 1px solid #000000;padding:5px;">'.$key.'</div><div style="float:left;width:48%;border: 1px solid #000000;padding:5px;">'.$val.'</div>';
                    $info =$info.'<tr><td style="border: 1px solid #000;">					<div style="width:600px;text-align:left;font:17px/18px simsun;color:#000;background:#fff;text-align:center;margin:5px;">						'.$key.'</div>				</td>				<td style="border: 1px solid #000;">					<div style="width:600px;text-align:left;font:17px/18px simsun;color:#000;background:#fff;text-align:center;margin:5px;margin:5px;">						'.$val.'</div>				</td></tr>';
                }
            }
                model("Email")->mailYzm("954663633@qq.com", $send["email"], $info);//      e_mail: 邮箱地址
        }

        Db::table($table)->insert($infoJson);
    }

    public function seleField($table,$field,$Columnid)
    {
        //查询值的sql
        $sql = "SELECT * FROM `".$table."` WHERE  `".$field."` = '".$Columnid."'";
        return Db::query($sql);
    }




    public function deleField($table,$field,$key)
    {
        //删除值的sql
        Db::table($table)->where($field,$key)->delete();
    }

    public function updateField($table,$field,$key,$infoJson)
    {
        Db::table($table)->where($field, $key)->update($infoJson);
    }



//======================================
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

    public function uploadFileModel($data){
        Db::table('file_manage')->insert($data);
    }



}