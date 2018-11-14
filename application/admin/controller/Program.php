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
    // 上传文件
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

    // vue 上传插件接口
    public function uploadVue()
    {
        $res= '';

        //上传文件
        if (!empty($_FILES)) {
            $dir = iconv("UTF-8", "GBK", "image/".date("Ymd/")."");

            if (!file_exists($dir)){
                mkdir ($dir,0777,true);
                // echo '创建文件夹bookcover成功';
            } else {
                // echo '需创建的文件夹bookcover已经存在';
            }

//            if (!empty($_SESSION)) {
            //拼接路径
            $filePathArr = explode('/', $_SERVER['SCRIPT_FILENAME']);
            array_pop($filePathArr);
            $temp = explode(".", $_FILES["file"]["name"]);
            $filePath = $dir . md5(time()) .'.'. end($temp);
            // $name = iconv("UTF-8", "gb2312", $filePath);
            // $filePath = $dir . md5(time()) .$_REQUEST['isLastChunk'];
            if (move_uploaded_file($_FILES["file"]["tmp_name"], $filePath)) {
                $path = [
                    'name' => $_FILES['file']['name'],
                    'url' => $filePath
                ];
                $res=model("Msg")->success($path);

//                    $filePath = str_replace($_SERVER['CONTEXT_DOCUMENT_ROOT'], "", $filePath);
                //其他业务代码.我在制作此处时，我先将图片存入数据库

            } else {
                $res=model('Msg')->error('对不起,操作失败!请稍候再试!');
            }
//            } else {
//                $data = returnData(false, '请登录后再试!');
//            }
        }else{
            $res=model('Msg')->error('对不起,你没有上传图片');
        }
        echo json_encode($res);

    }

    // 下载接口
    public function download()
    {
        $data = input('get.');//think5 的验证机制
        // print_r($data);
//        $famlePath = $_GET['resum'];
        // $a = $data['name'];
        $file_dir = ROOT_PATH . 'public' . DS . $data['url'];    // 下载文件存放目录
        // // 检查文件是否存在
        if (! file_exists($file_dir) ) {
            $this->error('文件未找到');
        }else{
            // 打开文件
            $file1 = fopen($file_dir, "r");
            // 输入文件标签
            Header("Content-type: application/octet-stream");
            Header("Accept-Ranges: bytes");
            Header("Accept-Length:".filesize($file_dir));
            $name = $data['name'];
            Header("Content-Disposition: attachment;filename=" . $name .'.pdf');
            ob_clean();     // 重点！！！
            flush();        // 重点！！！！可以清除文件中多余的路径名以及解决乱码的问题：
            //输出文件内容
            //读取文件内容并直接输出到浏览器
            echo fread($file1, filesize($file_dir));
            fclose($file1);
            exit();
        }
    }

}