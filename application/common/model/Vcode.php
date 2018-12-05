<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/9/2
 * Time: 21:53
 */

// namespace vcode;
namespace app\common\model;
use think\Session;


class Vcode
{
    private $height;
    private $width;
    private $codeNum;
    private $disturbColorNum;
    private $lineNum;
    private $type;
    private $checkCode;
    private $image;
    /*构造函数为属性赋初值*/
    function __construct($height=100,$width=200,$codeNum=4,$disturbColorNum=50,$lineNum=4,$type=1)
    {
        $this->height = $height;
        $this->width = $width;
        $this->codeNum = $codeNum;
        $this->disturbColorNum = $disturbColorNum;
        $number = floor($height*$width/15);
        if($number > 240-$codeNum){
            $this->disturbColorNum = 240-$codeNum;
        }else {
            $this->disturbColorNum = $number;
        }
        $this->lineNum = $lineNum;
        $this->checkCode = $this->createCheckCode($type);
    }

    function __tostring()
    {
        Session::set('code',strtoupper($this->checkCode));
        $_SESSION['code'] = strtoupper($this->checkCode);
        $this->outImg();
        return '';
    }
    /*生成验证的过程*/
    function outImg()
    {
        $this->getCreateImage();        //1.创建画布
        $this->setDisturbColor();       //2.设置干扰
        $this->outputText();            //3.添加字符
        $this->outputImage();           //4.输出图片
    }

    function getCreateImage()
    {
        $this->image = imagecreatetruecolor($this->width,$this->height);
        $backColor = imagecolorallocate($this->image,255,255,255);
        @imagefill($this->image,0,0,$backColor);
        $border = imagecolorallocate($this->image,255,0,0);
        imagerectangle($this->image,0,0,$this->width-1,$this->height-1,$border);
    }
    /*获得纯数字掺字母验证码的串*/
    private function createCheckCode($type)
    {
        $type = intval($type);
        if($type<1) $type = 1;
        if($type>3) $type = 3;
        $codeStr = "";
        switch ($type) {
            case 1:
                $code = "3456789abcdefghijkmnpqrstuvwxyABCDEFGHIJKMNPQRSTUVWXY";
                break;
            case 2:
                $code = "1234567890";
                break;
            case 3:
                $code = "abcdefghijkmnpqrstuvwxyABCDEFGHIJKMNPQRSTUVWXY";
                break;
            default:
                $code = "3456789abcdefghijkmnpqrstuvwxyABCDEFGHIJKMNPQRSTUVWXY";
                break;
        }
        for ($i=0; $i < $this->codeNum; $i++) {
            $char = $code[rand(0,strlen($code)-1)];
            $codeStr .= $char;
        }
        return $codeStr;
    }

    function setDisturbColor()
    {
        for ($i=0; $i < $this->disturbColorNum; $i++) {
            $color = imagecolorallocate($this->image,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));
            imagesetpixel($this->image,mt_rand(1,$this->width-2),mt_rand(1,$this->height-2),$color);
        }

        for ($i=0; $i < $this->lineNum; $i++) {
            $color = imagecolorallocate($this->image,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));
            imagearc($this->image,rand(-10,$this->width),rand(-10,$this->height),rand(30,300),rand(20,200),55,44,$color);
        }
    }

    function outputText()
    {
        for ($i=0; $i < $this->codeNum; $i++) {
            $fontColor = imagecolorallocate($this->image,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));
            $fontSize = mt_rand(30,35);
            $x = floor($this->width/$this->codeNum)*$i+3;
            $y = mt_rand(0,$this->height-imagefontheight($fontSize));
            imagechar($this->image,$fontSize,$x,$y,$this->checkCode[$i],$fontColor);
        }
    }

    function outputImage(){
        if (imagetypes() & IMG_GIF) {
            header("Content-type:image/gif");
            imagegif($this->image);
        }elseif (imagetypes() & IMG_JPG) {
            header("Content-type:image/jpeg");
            imagejpeg($this->image);
        }elseif (imagetypes() & IMG_PNG) {
            header("Content-type:image:png");
            imagepng($this->image);
        }else {
            die("PHP不支持图像创建！");
        }
    }

    function __destruct()
    {
        imagedestroy($this->image);
    }
}