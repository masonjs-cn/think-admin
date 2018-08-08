<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/7/16
 * Time: 14:21
 */

namespace app\admin\controller;
use app\common\model\Email;
use PHPMailer\PHPMailer\PHPMailer;
use think\Cookie;
use \think\Request;



class People
{
    //注册接口
    public function registered(){
        $data = input('post.');//think5 的验证机制
//        ipone  用户名/手机号
//        password  密码
//        e_mail    邮箱
//        nickname  昵称
//        code      验证码

        $e_mail=$data['e_mail'];
        $password=$data['password'];
        $nickname=$data['nickname'];
        $code=$data['code'];


        if(empty($ipone)&&empty($e_mail)){
            $fanhui= array('flag'=>0, 'msg'=>'账号或者邮箱不能为空');
            echo  json_encode($fanhui);
        }else if(empty($password))   {
            $fanhui= array('flag'=>0, 'msg'=>'密码不能为空');
            echo  json_encode($fanhui);
        }else if(empty($nickname))   {
            $fanhui= array('flag'=>0, 'msg'=>'昵称不能为空');
            echo  json_encode($fanhui);
        }else if(empty($code))   {
            $fanhui= array('flag'=>0, 'msg'=>'验证码不能为空');
            echo  json_encode($fanhui);
        }

        if(empty($data['ipone'])) {
            $this->emailProgenitor($e_mail,$password,$nickname,$code);//如果没传那就走邮箱注册
        }else{

        }

    }


    //通过邮箱注册账号一次封装
    public function emailProgenitor($e_mail,$password,$nickname,$code){
        $e_Mailnew = explode('@',$e_mail);
        if (Cookie::has("".$e_Mailnew[0]."") == 1){

            $e_mailyzm=Cookie::get("".$e_Mailnew[0]."");//获取验证码
            if ($e_mailyzm ==$code ){
                $info=model('People')->seleMail($e_mail);//获取邮箱配置信息
                $nick=model('People')->seleNick($nickname);//获取昵称信息
                if (empty($info)){
                    if (empty($nick)){
                        $request = Request::instance();
                        $data = ['e_mail' => $e_mail, 'password' => $password,'nickname' =>$nickname,'last_login_ip'=>$request->ip(),'last_login_time'=>time()];
                        model('People')->addPeople($data);

                        $fanhui= array('flag'=>1, 'msg'=>'注册成功');
                        echo  json_encode($fanhui);

                    }else{
                        $fanhui= array('flag'=>0, 'msg'=>'用户名重复');
                        echo  json_encode($fanhui);
                    }

                }else{
                    $fanhui= array('flag'=>0, 'msg'=>'邮箱已经注册');
                    echo  json_encode($fanhui);
                }

            }else{
                $fanhui= array('flag'=>0, 'msg'=>'验证码不正确');
                echo  json_encode($fanhui);
            }

        }else{
            $fanhui= array('flag'=>0, 'msg'=>'验证码已经失效,请重新获取');
            echo  json_encode($fanhui);
        }

    }

        public function mailYzm(){
//            e_mail: 邮箱地址
//            e_mailid: 邮箱的模型编号

            $data = input('post.');//think5 的验证机制
            $e_Mail = $data['e_mail']; // 这个是发送的邮箱，肯定是接口调用的
            $e_Mailid = $data['e_mailid'];
            model("Email")->mailYzm($e_Mail,$e_Mailid);


        }



}