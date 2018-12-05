<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/12/2
 * Time: 00:39
 */

namespace app\common\model;

use think\Model;
use think\Db;


class Zsty extends Model
{
    public function CheckTable($zsDate)
    {
        //查询值的sql
      return  Db::table('zmyq_wechat_robot_zsty')->where('zsDate',$zsDate)->select();
    }


}