<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/7/16
 * Time: 14:22
 */

namespace app\common\model;

use think\Model;
use think\Db;

class People
{
    // 查询邮箱配置
    public function seleEmail($e_mailid){
        $sql = "select * from e_mail where e_mailid = '$e_mailid'";
        return Db::query($sql);
    }

    //查询邮箱是否注册
    public function seleMail($e_mailid){
        $sql = "select * from people where e_mail = '$e_mailid'";
        return Db::query($sql);
    }

    //查询邮箱是否注册
    public function seleNick($nickname){
        $sql = "select * from people where nickname = '$nickname'";
        return Db::query($sql);
    }

    public function addPeople($data){
        db('people')->insert($data);
    }





}