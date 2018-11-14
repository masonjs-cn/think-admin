<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/9/2
 * Time: 10:34
 */

//
//namespace app\index\controller;
namespace app\common\model;

use Qcloud\Sms\SmsSingleSender;

class Sms
{

    public function mode0($e_Mail){
        $yzm = mt_rand(10000,99999);//提前定义的一个验证码
        $e_Mailnew = explode('@',$e_Mail);
        Cookie::delete($e_Mailnew[0]);
        setcookie($e_Mailnew[0],$yzm,time()+6000);
        $mode0 = '您好:'."<br/>".'&nbsp&nbsp&nbsp&nbsp我们收到了来自您的通行证的安全请求。请使用下面的验证码验证您的账号归属。'."<br/>".$yzm."<br/>".'请注意：该验证码将在10分钟后过期，请尽快验证!';
        return $mode0;
    }

    public function smsSend($appid,$appkey,$phoneNumber,$templateId,$smsSign){
        // 单发短信
        try {
            $ssender = new SmsSingleSender($appid, $appkey);
            $result = $ssender->send(0, "86", $phoneNumber,
                "123456为您的登录验证码，请于5分钟内填写。如非本人操作，请忽略本短信。", "", "");
            $rsp = json_decode($result);
            echo $result;
        } catch(\Exception $e) {
            echo var_dump($e);
        }
//        //暂停3秒
//        sleep(3);
//        // 指定模板ID单发短信
//        try {
//            $ssender = new SmsSingleSender($appid, $appkey);
//            $params = ["654321", "5"];
//            $result = $ssender->sendWithParam("86", $phoneNumber, $templateId,
//                $params, $smsSign, "", "");  // 签名参数未提供或者为空时，会使用默认签名发送短信
//            $rsp = json_decode($result);
//            echo $result;
//        } catch(\Exception $e) {
//            echo var_dump($e);
//        }
    }

}