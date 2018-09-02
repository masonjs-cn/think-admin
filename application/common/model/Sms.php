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
    public function smsSend(){

        // $appid $appkey $templateId $smsSign为官方demo所带，请修改为你自己的
        // 短信应用SDK AppID
        $appid = 1400132316;

        // 短信应用SDK AppKey
        $appkey = "554c7e1c90dc49dffcbb5f54bc4080d2";

        // 你的手机号码。
        $phoneNumber = "17621515830";

        // 短信模板ID，需要在短信应用中申请
        $templateId = 7839;  // NOTE: 这里的模板ID`7839`只是一个示例，真实的模板ID需要在短信控制台中申请

        // 签名
        $smsSign = "腾讯云"; // NOTE: 这里的签名只是示例，请使用真实的已申请的签名，签名参数使用的是`签名内容`，而不是`签名ID`

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

        //暂停3秒
        sleep(3);

        // 指定模板ID单发短信
        try {
            $ssender = new SmsSingleSender($appid, $appkey);
            $params = ["654321", "5"];
            $result = $ssender->sendWithParam("86", $phoneNumber, $templateId,
                $params, $smsSign, "", "");  // 签名参数未提供或者为空时，会使用默认签名发送短信
            $rsp = json_decode($result);
            echo $result;
        } catch(\Exception $e) {
            echo var_dump($e);
        }
    }
}