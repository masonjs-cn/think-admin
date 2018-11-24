<?php
/**
 * Created by PhpStorm.
 * User: myq
 * Date: 2018/11/14
 * Time: 17:06
 */

namespace app\admin\controller;


class QueryList
{
    /**
     * 模拟post进行url请求
     * @param string $url
     * @param array $post_data
     */
    public function request_post($url = '', $post_data = array(),$getcookie) {
        if (empty($url) || empty($post_data)) {
            return false;
        }

        $o = "";
        foreach ( $post_data as $k => $v )
        {
            $o.= "$k=" . urlencode( $v ). "&" ;
        }
        $post_data = substr($o,0,-1);

        session_start();
        $cookie_file = tempnam('./temp','cookie');

        $postUrl = $url;
        $curlPost = $post_data;
        $ch = curl_init();//初始化curl
        curl_setopt($ch, CURLOPT_URL,$postUrl);//抓取指定网页
        curl_setopt($ch, CURLOPT_HEADER, $getcookie);//设置header
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);//要求结果为字符串且输出到屏幕上
        curl_setopt($ch, CURLOPT_COOKIEFILE, $cookie_file);
        curl_setopt($ch, CURLOPT_POST, 1);//post提交方式
        curl_setopt($ch, CURLOPT_POSTFIELDS, $curlPost);
        $data = curl_exec($ch);//运行curl
        curl_close($ch);
        if ($getcookie===1){

            $data = explode("GMT", $data);
            $header = explode(":", $data[0]);
            $cookies = explode("=", $header[7]);
            $cookie = explode(";", $cookies[1]);
            $fanhui = [
                'cookie' => $cookie[0],
            ];
        }else{
            return $data;
        }

    }

    public function testAction(){
        $url = 'http://jw.sicp.sh.cn/st/login.aspx';

        $post_data['__VIEWSTATE']='/wEPDwUJOTYxNDY3OTc0D2QWAgIBD2QWAgIHDxBkDxYBAgEWAQUJ6L6F5a+85ZGYZGQYAQUeX19Db250cm9sc1JlcXVpcmVQb3N0QmFja0tleV9fFgEFDUJ1dHRvbl/nmbvpmYZlPZUBkrn2LhZ2e+IzvipDoDOK4w==';
        $post_data['__VIEWSTATEGENERATOR']= 'D2D9F043';
        $post_data['__EVENTVALIDATION']='/wEWCQLZo+aCBwLep8vjCAKu8uE5AvKm2soEAvLJzeAMAvWZ8TkC6fHPnw8CwsjN4QICyKiipgENUkhjpEyPuWbHCniFAhI4jrj5hg==';
        $post_data['txt_卡学号']='201530193';
        $post_data['txt_密码']='57484279';
        $post_data['Button_登陆.x']='70';
        $post_data['Button_登陆.y']='30';
        $post_data['Rad_角色']='家长';

        //$post_data = array();
        $res = $this->request_post($url, $post_data,1);
        print_r($res);

    }

    public function html(){
        $url = 'http://jw.sicp.sh.cn/st/login.aspx';
        $res = $this->request_post($url, '',1);
        print_r($res);
    }


}