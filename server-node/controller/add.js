var express = require('express');
var router = express.Router();
var multipart = require('connect-multiparty');

router.get('/', function (req, res, next) {
  //   console.log(req.query);
  res.send('respond with a resource');

});

router.get('/people', function (req, res, next) {
    console.log(req.query);
    res.send(req.query);
});

var multipartMiddleware = multipart();

router.post('/process_post', multipartMiddleware, function (req, res) {

  // 输出 JSON 格式
  console.log(req.body);
  res.send(req.body);
})
// var fs = require("fs");

// console.log("准备写入文件");
// fs.writeFile('input.txt', '我是通 过fs.writeFile 写入文件的内容', function (err) {
//   if (err) {
//     return console.error(err);
//   }
//   console.log("数据写入成功！");
//   console.log("--------我是分割线-------------")
//   console.log("读取写入的数据！");
//   fs.readFile('input.txt', function (err, data) {
//     if (err) {
//       return console.error(err);
//     }
//     console.log("异步读取文件数据: " + data.toString());
//   });
// });

module.exports = router;
