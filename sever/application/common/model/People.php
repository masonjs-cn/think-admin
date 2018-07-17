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
    public function seleEmail($e_mailid){

        $sql = "select * from e_mail where e_mailid = '$e_mailid'";
//        print_r($sql);
        return Db::query($sql);

    }



}