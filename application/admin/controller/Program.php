<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/5/26
 * Time: 08:14
 */

namespace app\admin\controller;
use app\common\model\Email;
use PHPMailer\PHPMailer\PHPMailer;
use \think\Request;

class Program
{

    //增加字段接口
    public function addTableField(){
        //    增加字段接口
        //    Columnid 栏目id
        //    field 字段
        //    fieldType 数据类型
        //    fieldSize 数据大小
        //    field_annotation 管理字段名注释
        //    sort  排序

        $data = input('post.');//think5 的验证机制

        $field = $data['field'];
        $Columnidname = "Columnid";
        $Columnid = $data['Columnid'];


        $table=model('Program')->seleField("Column",$Columnidname,$Columnid);//获取修改表的名称
        $infos=model('Program')->seleField("program",'table_form',$table[0]['Column']);//获取修改表的名称

        $panduan = 1;
        for ($a = 0 ; $a<sizeof($infos);$a++){
            if ($infos[$a]['field'] == $field){
                $panduan = 0;
                echo print_r($infos[$a]['field']);
                break;
            }else{
                $panduan = 1;
            }
        }

        if ($panduan == 0){

            $fanhui= array('flag'=>0, 'msg'=>'重复字段不能添加','cc'=>$panduan);

        }else{
            $shuju =array('title'=>$table[0]['ColumnName'],'table_form'=>$table[0]['Column'],'field'=>$data['field'],'fieldType'=>$data['fieldType'],'fieldSize'=>$data['fieldSize'],'field_annotation'=>$data['field_annotation'],'sort'=>$data['sort']);
            model('Program')->addField($shuju);
            model('Program')->addTableField($table[0]['Column'],$data['field'],$data['fieldType'],$data['fieldSize']);
            $fanhui= array('flag'=>1, 'msg'=>'成功');

        }


        echo  json_encode($fanhui);


    }

    //删除字段接口
    public function DeleTableField(){
        //    删除字段接口
        //    Columnid  表id
        //    deleField  查询的字段

        $data = input('post.');//think5 的验证机制

        $Columnid = $data['Columnid'];//表
        $deleField = $data['deleField'];//字段

        $table=model('Program')->seleField("Column",'Columnid',$Columnid);//获取修改表的名称
        model('Program')->deleTableField($table[0]['Column'],$deleField);

        $fanhui= array('flag'=>1, 'msg'=>'成功');
        echo  json_encode($fanhui);


    }

    //=================================================================

    //通过字段查询信息
    public function checkField(){
        //    通过字段和值查询这条信息
        //    classid  表id
        //    QueryField  查询的字段
        //    QueryKey  查询的字段值

        $token = Request::instance()->header('Authorization');    // 人物权限
        $data = input('post.');//think5 的验证机制
        $fields = ["classid","infoJson"];
        $res=model('Tools')->emptyData($data,$fields);

        if ($res['flag']!=40001){
            $classid=$data['classid'];
            $obj = $data['infoJson'];
            $objArry = model('Tools')->traverseObjKey($obj);
            $res=model('Role')->getTocken($token,$objArry,$classid,"checkField");
            if($res != null){
                $cha=model('Column')->seleTableClass($classid);
                if ($cha != null) {
                    $whereArry = model('Tools')->object_to_array($obj);
                    $fanhui=model('Program')->checkField($cha["column"],$whereArry,$objArry);
                    $res=model("Msg")->success($fanhui);
                }else{
                    $res=model('Msg')->error('没有这张表');
                }
           }else{
                $res=model("Msg")->qxError();
            }
        }
        echo  json_encode($res);


    }

    //通过表和字段，给字段添加信息
    public function AddInfos(){
        //    添加信息

        $token = Request::instance()->header('Authorization');    // 人物权限
        $data = input('post.');//think5 的验证机制

        $fields = ["classid","infoJson",'send'];
        $res=model('Tools')->emptyData($data,$fields);
        if ($res['flag']!=40001){
            $classid=$data['classid'];
            $obj = $data['infoJson'];
            $objArryKey = model('Tools')->traverseObjKey($obj);
            $res=model('Role')->getTocken($token,$objArryKey,$classid,"add");
            if($res['flag'] !==10001){
                $cha=model('Column')->seleTableClass($classid);
                if ($cha != null) {
                    $fanhui=model('Program')->addFieldinfos($cha["column"],$data);
                    $res=model("Msg")->success($fanhui);
                }else{
                    $res=model('Msg')->error('没有这张表');
                }
            }else{
                $res=model("Msg")->qxError();
            }
        }
        echo  json_encode($res);

    }

    //删除表
    public function deleInfos(){
        $token = Request::instance()->header('Authorization');    // 人物权限
        $data = input('post.');//think5 的验证机制
        $fields = ['mainKey','mainVal','classid'];
        $res=model('Tools')->emptyData($data,$fields);

        if ($res['flag']!=40001){
            $classid=$data['classid'];
            $fieldVal[0]=$data['mainKey'];
            $res=model('Role')->getTocken($token,$fieldVal,$classid,"delete");
            if($res['flag'] !==10001) {
                $cha=model('Column')->seleTableClass($classid);
                if ($cha != null) {
                    model('Program')->deleField($cha["column"],$data['mainKey'],$data['mainVal']);
                    $res=model("Msg")->success("");
                }else{
                    $res=model('Msg')->error('没有这张表');
                }
            }else{
                $res=model("Msg")->qxError();
            }
        }
        echo  json_encode($res);
    }




    public function uploadFile(){
        header('Content-type: text/plain; charset=utf-8');

        $dir = iconv("UTF-8", "GBK", "image/".date("Ymd/")."");

        if (!file_exists($dir)){
            mkdir ($dir,0777,true);
            // echo '创建文件夹bookcover成功';
        } else {
            // echo '需创建的文件夹bookcover已经存在';
        }

        //文件数据
        $files = $_FILES['theFile'];
        //文件名
        $fileName = $_REQUEST['fileName'];
        //文件总大小
        $totalSize = $_REQUEST['totalSize'];
        //是否为末段
        $isLastChunk = $_REQUEST['isLastChunk'];
        //是否是第一次上传
        $isFirstUpload = $_REQUEST['isFirstUpload'];
        if ($_FILES['theFile']['error'] > 0) {
            $status = 500;
        } else {
            // 如果第一次上传的时候，该文件已经存在，则删除文件重新上传
            if ($isFirstUpload == '1' && file_exists($dir . $fileName) && filesize($dir . $fileName) == $totalSize) {
                unlink($dir . $fileName);
            }
            // 否则继续追加文件数据
            if (!file_put_contents($dir . $fileName, file_get_contents($_FILES['theFile']['tmp_name']), FILE_APPEND)) {
                $status = 501;
            } else {
                // 在上传的最后片段时，检测文件是否完整（大小是否一致）
                if ($isLastChunk === '1') {
                    if (filesize($dir. $fileName) == $totalSize) {
                        $status = 200;
                    } else {
                        $status = 502;
                    }
                } else {
                    $status = 200;
                }
            }
        }

        if ($isLastChunk === '1'&&$status === 200) {
            $Coccygeal = pathinfo($fileName, PATHINFO_EXTENSION);
            $newname =  time().'.'.$Coccygeal;
            rename($dir. $fileName,$dir.$newname);
//            echo $dir.$newname;
            $shu = model('Tools')->shu();
            $data = ['url' => $dir.$newname , 'identifies' => $shu ];
            model("Program")->uploadFileModel($data);
            echo json_encode(array(
                'status' => $status,
                'totalSize' => filesize($dir.$newname),
                'isLastChunk' => $isLastChunk,
                'id'=> $shu
            ));
        }else {
            echo json_encode(array(
                'status' => $status,
                'totalSize' => filesize($dir . $fileName),
                'isLastChunk' => $isLastChunk,
            ));
        }

    }






}