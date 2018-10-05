<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/9/28
 * Time: 22:47
 */

namespace app\common\model;
use think\Model;
use think\Db;
use think\Session;

class Role extends Model
{

    // 增 0
    // 删 1
    // 改 2
    // 查 3

    // name||&&||name||&&||sex

//    roleid 获取角色
//

    public function roleJudge($roleid,$classid,$fields,$operation)
    {
        // 权限判断  增删改查

        if ($operation=="add"){
            $res = $this->CheckRole($roleid,$classid,0);
            if ($res!==""){return $this->CheckField($res,$fields);}
        }else if ($operation=="delete"){
            $res = $this->CheckRole($roleid,$classid,1);
            if ($res!==""){return $this->CheckField($res,$fields);}
        }else if ($operation=="update"){
            $res = $this->CheckRole($roleid,$classid,2);
            if ($res!==""){return $this->CheckField($res,$fields);}
        }else if ($operation=="check"){
            $res = $this->CheckRole($roleid,$classid,3);
            if ($res!==""){return $this->CheckFieldFind($res,$fields);}
        }else if ($operation=="checkField"){
            $res = $this->CheckRole($roleid,$classid,3);
            if ($res!==""){return $this->CheckField($res,$fields);}
        }

    }

   public function CheckRole($roleid,$classid,$control)
   {

       $roleid=Session::get($roleid,'think');

       $fieldSql = Db::table('role')
           ->where('roleid', $roleid)
           ->where('control', $control)
           ->where('classid', $classid)
           ->value('field');
       return $fieldSql;
   }

   public function CheckField($fieldSql,$fields){
        if ($fieldSql !== null) {
            $fieldArray = explode("||&&||", $fieldSql);

            $c = array_diff($fields, $fieldArray);
            $flag = empty($c)?1 : 0;

            if ($flag) {
                return model("Msg")->success("");
            }else {
                return model("Msg")->qxError();
            }


//            sort($fields);//排序
//            sort($fieldArray);//排序
//            if($fields == $fieldArray){
//                return model("Msg")->success("");
//            }else{
//                return model("Msg")->qxError();
//            }


        } else {
                return model("Msg")->qxError();
        }
   }

    public function CheckFieldFind($fieldSql,$fields){
        if ($fieldSql !== null) {
            $fieldArray = explode("||&&||", $fieldSql);
            return model("Msg")->success($fieldArray);
        } else {
            return model("Msg")->qxError();
        }
    }



    public function getTocken($token,$fields,$classid,$control){
        $res = [];
        $fanhui= model('Role')->roleJudge($token,$classid,$fields,$control);
        if ($fanhui["msg"]!=""){
            $res=$fanhui;
        }else if ($fanhui['flag']==1){
            $res=model("Msg")->success("有权限");
        }else{
            $res=model("Msg")->qxError();
        }

        return $res;
    }


}