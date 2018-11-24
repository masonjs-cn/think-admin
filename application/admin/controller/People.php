<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/7/16
 * Time: 14:21
 */

namespace app\admin\controller;
use app\common\model\Email;
use app\common\model\Sms;
use PHPMailer\PHPMailer\PHPMailer;
use think\Cookie;
use \think\Request;
use think\Session;
use Qcloud\Sms\SmsSingleSender;

class People
{
//  ======  注册接口
    // 电话/邮箱  注册接口
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
        $ipone=$data['ipone'];
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

        if(empty($ipone)) {
            $this->emailProgenitor($e_mail,$password,$nickname,$code);//如果没传那就走邮箱注册
        }else{
            $this->smsProgenitor($ipone,$password,$nickname,$code);//如果没传那就走邮箱注册
        }

    }

    // 通过邮箱注册账号一次封装
    public function emailProgenitor($e_mail,$password,$nickname,$code){
        $e_Mailnew = explode('@',$e_mail);
        if (Cookie::has("".$e_Mailnew[0]."") == 1){

            $e_mailyzm=Cookie::get("".$e_Mailnew[0]."");//获取验证码
            if ($e_mailyzm ==$code ){
                $info=model('People')->seleMail($e_mail);//获取邮箱配置信息
                $nick=model('People')->seleNick($nickname);//获取昵称信息
                if (empty($info)){
                    if (empty($nick)){
                        $request = model("Tools")->get_real_ip();
                        $data = ['e_mail' => $e_mail, 'password' => $password,'nickname' =>$nickname,'last_login_ip'=>$request->ip(),'last_login_time'=>time(),'freeze'=>0];
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


    public function smsProgenitor($phoneNumber,$password,$nickname,$code){
        // 短信应用SDK AppID
        $appid = 1400132316;
        // 短信应用SDK AppKey
        $appkey = "554c7e1c90dc49dffcbb5f54bc4080d2";
        // 你的手机号码。
        $phoneNumber = "17621515830";
        // 短信模板ID，需要在短信应用中申请
        $templateId = 179508; // NOTE: 这里的模板ID`7839`只是一个示例，真实的模板ID需要在短信控制台中申请
        // 签名
        $smsSign = "shzqbaojie"; // NOTE: 这里的签名只是示例，请使用真实的已申请的签名，签名参数使用的是`签名内容`，而不是`签名ID`
        $this->smsSend($appid,$appkey,$phoneNumber,$templateId,$smsSign);
    }

    // 邮箱验证码
    public function mailYzm(){
//     e_mail: 邮箱地址
//     e_mailid: 邮箱的模型编号

        $data = input('post.');//think5 的验证机制
        $e_Mail = $data['e_mail']; // 这个是发送的邮箱，肯定是接口调用的
        $e_Mailid = $data['e_mailid'];
        model("Email")->mailYzm($e_Mail,$e_Mailid);


    }

    // 用户名注册接口
    public function registeredUser(){
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

//  ====== 登录接口

    // 手机号登录
    public function loginTel(){
        $data = input('post.');//think5 的验证机制
        //        ipone  用户名/手机号
        //        password  密码
        //        code      验证码
        $ipone=$data['ipone'];
        $password=$data['password'];
        $code=$data['code'];

        $scode=Session::get('code','think');
        if ($code == $scode){

            $info=model('People')->seleLoginTel($ipone);//获取邮箱配置信息

            if ($info[0]['password']==$password){
               $shu = model('Tools')->shu();
               Session::set($shu,$info[0]['orgid'],'think');
               $fanhui= array('flag'=>1, 'msg'=>'登录成功','token'=>$shu);
            }else{
                $fanhui= array('flag'=>0, 'msg'=>'密码错误');
            }
        }else{
            $fanhui= array('flag'=>0, 'msg'=>'验证码错误');
        }
        echo  json_encode($fanhui);

    }

    // 邮箱登录
    public function loginEmail(){
        $data = input('post.');//think5 的验证机制
        //        e_mail    邮箱
        //        password  密码
        //        code      验证码
        $e_mail=$data['e_mail'];
        $password=$data['password'];
        $code=$data['code'];

        $fieldVal = ['e_mail','password','code'];
        $res=model('Tools')->emptyData($data,$fieldVal);
        if ($res['flag']!=40001){

            $scode=Session::get('code','think');
            if ($code == $scode) {

               $info=model('People')->loginEmail($e_mail);//获取邮箱配置信息
                if ($info[0]['password']==$password){
                    $shu = model('Tools')->random();
                    Session::set($shu,$info[0]['orgid'],'think');
                    model('People')->loginTime($info[0]['rid']);
                    $res = model('Msg')->success($shu);

                }else{
                    $res = model('Msg')->error('密码错误');
                }

            }else{
                $res = model('Msg')->error('验证码错误');
            }
        }

        echo  json_encode($res);

    }

    // 用户登录
    public function loginUserName(){
        $data = input('post.');//think5 的验证机制
        //        e_mail    邮箱
        //        password  密码
        //        code      验证码
        $userName=$data['userName'];
        $password=$data['password'];
//       $code=$data['code'];

//        $fieldVal = ['e_mail','password'];
//        $res=model('Tools')->emptyData($data,$fieldVal);
//        if ($res['flag']!=40001){

//            $scode=Session::get('code','think');
//            if ($code == $scode) {

        $info=model('People')->loginUserName($userName);//获取邮箱配置信息
        if (empty($info)==''){
            if ($info[0]['password']==$password){
                $shu = model('Tools')->random();
                Session::set($shu,$info[0]['orgid'],'think');
                model('People')->loginTime($info[0]['rid']);
                $roleTile = $info[0]['orgid'] == 'B834D761-7BFB-A5F5-33F6-9C90EC3FC2D6' ? '超级管理员':'普通用户';

                $fanhui = [
                    'Authorization' => $shu,
                    'userName' => $userName,
                    'role' => $roleTile
                ];
                $res = model('Msg')->success($fanhui);

            }else{
                $res = model('Msg')->error('密码错误');
            }
        }else {
            $res = model('Msg')->error('用户名不存在');
        }
//        }

        echo  json_encode($res);

    }









}