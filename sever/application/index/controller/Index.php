<?php
namespace app\index\controller;

use think\Controller;

//继承控制器
class Index extends Controller
{
    public function index()
    {
       return $this->fetch();

//       返回页面
    }

}
