<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/7/17
 * Time: 14:09
 */

namespace app\common\model;
use PHPMailer\PHPMailer\PHPMailer;
use think\Cookie;


class Email
{


// ======== 模板1 一

    public function mode0($e_Mail){
        $yzm = mt_rand(10000,99999);//提前定义的一个验证码
        $e_Mailnew = explode('@',$e_Mail);
        Cookie::delete($e_Mailnew[0]);
        setcookie($e_Mailnew[0],$yzm,time()+6000);
        $mode0 = '您好:'."<br/>".'&nbsp&nbsp&nbsp&nbsp我们收到了来自您的通行证的安全请求。请使用下面的验证码验证您的账号归属。'."<br/>".$yzm."<br/>".'请注意：该验证码将在10分钟后过期，请尽快验证!';
        return $mode0;
    }
// ======== 模板2 一
    public function mode1($message){
          $mode1 = '<div style="text-align:center;"><div style="margin:0 auto;width:600px;"><div style="float:left;width:48%;border: 1px solid #000000;padding:5px;">数据名称</div><div style="float:left;width:48%;border: 1px solid #000000;padding:5px;">数据的值</div>'.$message.'	</div></div>';
          return $mode1;
    }

// ======== 待更新



    //  发送验证码的一次封装
    public function mailYzm($e_Mail,$e_Mailid,$message)
    {

//        e_mail: 邮箱地址
//        e_mailid: 邮箱的模型编号


        $info=model('People')->seleEmail($e_Mailid);//获取邮箱配置信息


//      ========== 关于邮箱配置的说明
        //Host      链接qq域名邮箱的服务器地址
        //Port      端口
        //e_mail    邮箱
        //title     标题
        //content   内容
        //timu      题目，也就是发件人的名字
        //Username  smtp登录的账号 这里填入字符串格式的qq号即可
        //Password  smtp登录的密码 使用生成的授权码（就刚才叫你保存的最新的授权码）
//      ========== 关于邮箱配置的说明



        $Host = ''.$info[0]['host'].'';
        $Port=''.$info[0]['port'].'';//端口
        $Hostname = ''.$info[0]['hostname'].'';//服务器地址
        $title = ''.$info[0]['title'].'';//标题
        if ($info[0]['content']==0){
            $content = $this->mode0($e_Mail);
        }else if($info[0]['content']==1){
            $content = $this->mode1($message);
        }

        $timu =''.$info[0]['timu'].'';
        $Username =''.$info[0]['username'].'';
        $Password =''.$info[0]['password'].'';


        $flag = $this->sendMail($Host,$Port,$Hostname,$e_Mail,$title,$content,$timu,$Username,$Password);
        if ($info[0]['content']==0){
            if($flag){
                $fanhui= array('flag'=>1, 'msg'=>'发送邮件成功');
                echo  json_encode($fanhui);
            }else{
                $fanhui= array('flag'=>0, 'msg'=>'发送邮件失败');
                echo  json_encode($fanhui);
            }
        }


    }





    //  发送邮件的一次封装
    public function sendMail($Host,$Port,$Hostname,$to,$title,$content,$timu,$Username,$Password)
    {
        //实例化
        $mail=new PHPMailer();
        try{
            $mail = new PHPMailer();

            //是否启用smtp的debug进行调试 开发环境建议开启 生产环境注释掉即可 默认关闭debug调试模式
            $mail->SMTPDebug = 0;

            //使用smtp鉴权方式发送邮件
            $mail->isSMTP();

            //smtp需要鉴权 这个必须是true
            $mail->SMTPAuth=true;

            //链接qq域名邮箱的服务器地址
            $mail->Host =  $Host;//163邮箱：smtp.163.com

            //设置使用ssl加密方式登录鉴权
            $mail->SMTPSecure = 'ssl';//163邮箱就注释

            //设置ssl连接smtp服务器的远程服务器端口号，以前的默认是25，但是现在新的好像已经不可用了 可选465或587
            $mail->Port = $Port;//163邮箱：25

            //设置smtp的helo消息头 这个可有可无 内容任意
            // $mail->Helo = 'Hello smtp.qq.com Server';

            //设置发件人的主机域 可有可无 默认为localhost 内容任意，建议使用你的域名
            $mail->Hostname = $Hostname;

            //设置发送的邮件的编码 可选GB2312 我喜欢utf-8 据说utf8在某些客户端收信下会乱码
            $mail->CharSet = 'UTF-8';

            //设置发件人姓名（昵称） 任意内容，显示在收件人邮件的发件人邮箱地址前的发件人姓名
            $mail->FromName = $timu;

            //smtp登录的账号 这里填入字符串格式的qq号即可
            $mail->Username = $Username;

            //smtp登录的密码 使用生成的授权码（就刚才叫你保存的最新的授权码）
            $mail->Password = $Password;//163邮箱也有授权码 进入163邮箱帐号获取

            //设置发件人邮箱地址 这里填入上述提到的“发件人邮箱”
            $mail->From = $Username;

            //邮件正文是否为html编码 注意此处是一个方法 不再是属性 true或false
            $mail->isHTML(true);

            //设置收件人邮箱地址 该方法有两个参数 第一个参数为收件人邮箱地址 第二参数为给该地址设置的昵称 不同的邮箱系统会自动进行处理变动 这里第二个参数的意义不大
            $mail->addAddress($to,'爱代码，爱生活世界');

            //添加多个收件人 则多次调用方法即可
            // $mail->addAddress('xxx@163.com','爱代码，爱生活世界');

            //添加该邮件的主题
            $mail->Subject = $title;

            //添加邮件正文 上方将isHTML设置成了true，则可以是完整的html字符串 如：使用file_get_contents函数读取本地的html文件
            $mail->Body = $content;

            //为该邮件添加附件 该方法也有两个参数 第一个参数为附件存放的目录（相对目录、或绝对目录均可） 第二参数为在邮件附件中该附件的名称
            // $mail->addAttachment('./d.jpg','mm.jpg');
            //同样该方法可以多次调用 上传多个附件
            // $mail->addAttachment('./Jlib-1.1.0.js','Jlib.js');

            $status = $mail->send();

            //简单的判断与提示信息
            if($status) {
                return true;
            }else{
                return false;
            }
        }catch (Exception $e){
            echo 'Mailer Error: ' . $mail->ErrorInfo;
        }
    }

}